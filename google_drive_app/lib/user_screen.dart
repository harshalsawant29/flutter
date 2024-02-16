import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_app/controllers/auth.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserFunctions controller = Get.find<UserFunctions>();
  var isUploading = true;
  var isDownloading = true;
  var isOpened = false;
  var isUploadLoading = false;
  var isDownloadLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage('assets/images/BI.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('User Screen'),
          actions: [
            Center(child: Text('Logout')),
            IconButton(
                onPressed: () async {
                  await controller.logOut();
                  Get.back();
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.upload),
                onPressed: () async {
                  setState(() {
                    isUploadLoading = true;
                  });
                  var response = await controller.uploadFile().then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('File uploaded successfully'),
                          ),
                        ),
                      );
                  setState(() {
                    isUploading = false;
                    isUploadLoading = false;
                  });
                },
                label: Text('Upload file'),
              ),
              isUploadLoading
                  ? CircularProgressIndicator()
                  : !isUploading
                      ? Container(
                          child: !isUploading
                              ? ElevatedButton.icon(
                                  icon: Icon(Icons.download),
                                  onPressed: () async {
                                    setState(() {
                                      isDownloadLoading = true;
                                    });
                                    await controller
                                        .downloadFile()
                                        .whenComplete(() {
                                      setState(() {
                                        isDownloading = false;
                                      });
                                      log('------------------downloaded---------------');
                                    });
                                    setState(() {
                                      isDownloadLoading = false;
                                      log('set----------------state----------------------------');
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'File downloaded successfully')),
                                    );
                                  },
                                  label: Text('Download file'),
                                )
                              : CircularProgressIndicator(),
                        )
                      : Container(),
              isDownloadLoading
                  ? CircularProgressIndicator()
                  : !isDownloading
                      ? Container(
                          child: !isDownloading
                              ? ElevatedButton.icon(
                                  icon: Icon(Icons.download_done),
                                  onPressed: () async {
                                    await controller.openFile();
                                    setState(() {
                                      isOpened = true;
                                    });
                                    log('File opened');
                                  },
                                  label: Text('view file'),
                                )
                              : Container(),
                        )
                      : Container(),
              isOpened
                  ? Container(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: AlertDialog(
                                    title: const Text('Are you sure?'),
                                    content: const Text(
                                        'The downloaded file will be permanently deleted.'),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            await controller
                                                .deleteFile()
                                                .whenComplete(() {
                                              setState(() {
                                                isDownloading = true;
                                                isOpened = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text('File deleted!'),
                                                ),
                                              );
                                            });
                                            Get.back();
                                          },
                                          child: Text('Yes')),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('No')),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete file')),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
