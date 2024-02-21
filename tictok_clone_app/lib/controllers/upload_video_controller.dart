import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tictok_clone_app/constants.dart';
import 'package:tictok_clone_app/models/video.dart';
import 'package:tictok_clone_app/views/screens/add_video_screen.dart';
import 'package:tictok_clone_app/views/screens/home_screen.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  var counter = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    VideoCompress.compressProgress$.subscribe((progress) {
      log('compression progress ----- $progress');
      counter.value = progress;
    });
  }

  //Compress the video
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    log('compressed file size in bytes ------------------ ${compressedVideo!.filesize}');
    if (compressedVideo.filesize! < 30000000) {
      return compressedVideo.file;
    } else {
      Get.snackbar(
        'Error compressing file',
        'Please select file less than 100MB',
        duration: const Duration(seconds: 4),
      );
      Get.off(() => const AddVideoScreen());
    }
  }

  //upload to storage
  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //getting thumbnail
  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  //upload thumbnail
  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);

    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: 'Video $len',
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songname: songName,
        caption: caption,
        videoUrl: videoUrl,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnail,
      );

      await firestore
          .collection('videos')
          .doc('Video $len')
          .set(video.toJson());
      Get.off(() => HomeScreen());
    } catch (e) {
      Get.snackbar('Error uploading video', e.toString());
    }
  }
}
