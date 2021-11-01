import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as storage;

class StorageService {
  final storage.FirebaseStorage _storage = storage.FirebaseStorage.instance;

  Future<void> uploadFile(String path, String filename) async {
    File file = File(path);
    try {
      await _storage.ref().child(filename).putFile(file);
    } on storage.FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<String> getDownloadUrl(String filename) async {
    try {
      return await _storage.ref().child(filename).getDownloadURL();
    } on storage.FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }

  Future<void> deleteFile(String filename) async {
    try {
      await _storage.ref().child(filename).delete();
    } on storage.FirebaseException catch (e) {
      print(e.message);
    }
  }
}
