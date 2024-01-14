import 'dart:developer';
import 'dart:io';

import 'package:atin_todo/widget/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static Future<String?> uploadFile(
    String path,
    String fileName, {
    File? file,
  }) async {
    try {
      return FirebaseStorage.instance
          .ref(path)
          .child(fileName)
          .putFile(file!)
          .then((value) => value.ref.getDownloadURL());
    } catch (e) {
      log(e.toString());
      showToastMessage(e.toString());
      return null;
    }
  }
}
