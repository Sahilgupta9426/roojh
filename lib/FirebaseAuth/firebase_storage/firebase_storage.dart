import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:image_picker/image_picker.dart';

class StorageFirebase {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<String> uploadFile(filePath, fileName, selectTest, email) async {
    File file = File(filePath);
    try {
      final storefile = await storage
          .ref()
          .child('${email}')
          .child('/$selectTest.pdf')
          .putData(
            await file.readAsBytes(),
          );

      print('data transfer ----${storefile.bytesTransferred}');
      var downurl = await (await storefile).ref.getDownloadURL();
      var url = downurl.toString();
      print(url);
      return url;
      // storefile.storage.
    } on firebase_core.FirebaseApp catch (e) {
      print('firestore error ${e}');
      return e.toString();
    }
  }
}

class FireStoreDatabase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
}
