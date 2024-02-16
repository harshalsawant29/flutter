import 'dart:developer' as dev;
import 'dart:io' as io;

import 'package:get/get.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

/*This is a http class used to authenticate the client while taking the headers
  as the parameter. This class's constructor is called from the login method.
*/
class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;

  final http.Client _client = new http.Client();

  GoogleAuthClient(this._headers);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}

/* This is a controller class which has all the required methods such as logIn, 
  logOut, upload, download, etc. 
  We have saved the drive api for the authenticated user in 'gDriveApi', 
  name of the file to be uploaded in 'gDriveFileName' and the 
  active signed In client in the 'activeUser'.
*/
class UserFunctions extends GetxController {
  var isLoggedIn = false;
  var isDownloaded = false;
  var isLoading = false;
  var _openResult = 'Unknown';
  String savedFilePath = '';
  var gDriveApi;
  var gDriveFileName;
  var activeUser;

/*User sign in - This is a generic method integrated with the Google Drive api.
  'signIn' is the Google sign In Package which gives us the google 
  authentication functionality.
*/
  Future<void> loginWithGoogle() async {
    isLoading = true;

    final googleSignIn =
        signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
    final signIn.GoogleSignInAccount userAccount = await googleSignIn.signIn();
    activeUser = await googleSignIn;

    isLoggedIn = true;
    isLoading = false;

    dev.log("User account $userAccount");
    dev.log('-----------User logged In---------------------');

    final authHeaders = await userAccount.authHeaders;
    final authenticateClient = GoogleAuthClient(authHeaders);
    final driveApi = drive.DriveApi(authenticateClient);
    gDriveApi = driveApi;
  }

/*User logout - This method is for signing out the active user. Therefore, we 
  have used the 'activeUser' in which we saved the authentication response in 
  the login method, to sign out.
*/
  void logOut() async {
    await activeUser.signOut();
    dev.log("User Signed Out");
  }

/*upload file to google drive - Here we have given a hard coded ascii values to 
  upload a text, but we can also use filePicker package to pick a file from the 
  device and upload it to the drive.
  'drive' is used to denote the Google Drive Package.
*/
  Future<void> uploadFile() async {
    isLoading = true;

    final Stream<List<int>> mediaStream = Future.value([
      73,
      32,
      104,
      111,
      112,
      101,
      32,
      116,
      104,
      105,
      115,
      32,
      119,
      111,
      114,
      107,
      115
    ]).asStream(); //I hope this works in ascii

    var media = drive.Media(
        mediaStream, 17); // count of the characters in the uploading file.
    var driveFile = drive.File();
    driveFile.name = 'testingText.doc';
    gDriveFileName = driveFile
        .name; //global var gDriveFileName for saving the name of the file
    final result = await gDriveApi.files
        .create(driveFile, uploadMedia: media)
        .whenComplete(() {
      isLoading = false;

      dev.log('File uploaded!');
    });

    dev.log("Upload File result: $result");
  }

/*download the file via ID from the link - Here the 'get' method of drive api 
  for logged in user is used to download the file from drive with the help of an
  id of the file stored on the drive. 
  'get' method needs the id in string format.
*/
  Future<void> downloadFile() async {
    drive.Media downloadedFile =
        await gDriveApi.files.get('1zxf9_5KbwrhF6ARKsQf2mZ_BIJ1Uyi_Y',
/*the id in the link is after the 'd/'-----for example ---> (d/-----id----/)
*/
            downloadOptions: drive.DownloadOptions.FullMedia);

    final directory =
        await getExternalStorageDirectory(); //this gets us the local directory
    dev.log('directory---${directory.path}');
    final saveFile = io.File(
        "${directory.path}/${DateTime.now().millisecondsSinceEpoch}$gDriveFileName"); //absolute file path
    List<int> dataStore = []; //to receive the data via stream
    await downloadedFile.stream.listen((data) {
      dev.log(
          "DataReceived: ${data.length}"); //receives length of the data in the file
      dataStore.insertAll(
          dataStore.length, data); //store the recieved data in the list
    }, onDone: () {
      dev.log("Task Done");
      saveFile.writeAsBytes(dataStore); //saving the data in the specified file
      dev.log("File saved at ------------${saveFile.path}");
      savedFilePath = saveFile.path;

      isDownloaded = true;
    }, onError: (error) {
      dev.log("-----------Some Error----------");
    });
    if (downloadedFile == null) {
      return dev.log('--------downloaded file is null------');
    }
  }

/*Open the file mentioned as the id - Here we have used the package 'OpenFilex' 
  it automatically recognize the type of file and then opens the file inside our
  app.
*/
  Future<void> openFile() async {
    final filePath =
        await savedFilePath; //path of the downloaded file from the drive
    final result = await OpenFilex.open(
      filePath,
    ); //open() requires a string as a path to open the file at the specified path

    dev.log(
        '${_openResult = "type=${result.type}------------message=${result.message}"}');
  }

/*delete the file at the saved path - This deletes the downloaded file from the 
  device storage at the given path.
*/
  Future<void> deleteFile() async {
    io.File f = io.File(savedFilePath);
    dev.log('deleting file at path - $savedFilePath');
    await f.delete().then((_) {
      dev.log('File has been deletd');
    });
  }
}
