import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/widget/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static FirebaseFirestore instance = FirebaseFirestore.instance;
  static CollectionReference tasks = instance.collection('tasks');
  static CollectionReference users = instance.collection('users');

  static Future<Map?> addTask(Map<String, dynamic> data) async {
    try {
      return tasks.add(data).then((value) => data);
    } catch (e) {
      showToastMessage("error:$e");
      print("add task error : $e");

      return null;
    }
  }

  static Future<List> getTask() async {
    try {
      List data = [];
      return tasks
          .where('userId', isEqualTo: auth.currentUser!.uid)
          .get()
          .then((value) => value.docs.map((e) => e.data() as Map).toList());
      return data;
    } catch (e) {
      showToastMessage("error:$e");
      print("get task error : $e");

      return [];
    }
  }

  static Future<Map?> addUser(Map<String, dynamic> data) async {
    try {
      return users.add(data).then((value) => data);
    } catch (e) {
      showToastMessage("error:$e");
      print("add user error : $e");

      return null;
    }
  }
}
