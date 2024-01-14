import 'dart:developer';

import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/service/firebase_database.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:atin_todo/widget/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskNameController = TextEditingController();
  DateTime? _dueDate;
  List allTaskList = [
    {"taskName": "This is a taks", "dueDate": "2023-12-12 00:00:00.000"}
  ];
  bool processing = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            AppTextfield(
              controller: taskNameController,
              labelText: 'Add Task',
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_dueDate == null
                        ? 'No Due Date'
                        : 'Due Date: ${DateFormat('MMM d, y').format(_dueDate!)}'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _dueDate = pickedDate;
                        });
                      }
                    },
                    child: const Text('Pick Date'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  addTask();
                },
                child: const Text("Add Task")),
            const SizedBox(
              height: 30,
            ),

            //main..........................................
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('tasks')
                      .where("userId", isEqualTo: auth.currentUser?.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Text("Task is empty");
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Card(
                          color: const Color.fromARGB(255, 231, 255, 95),
                          child: ListTile(
                            title: Text(
                              data['taskName'],
                              style: const TextStyle(),
                            ),
                            subtitle: Text(
                              data['dueDate'] ?? "_dueDate",
                              style: const TextStyle(),
                            ),
                            trailing: Wrap(
                              spacing: 12,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      updateTaskForm(document.id, data);
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      FireStoreService.deleteTask(document.id);

                                      showToastMessage("Delete item");
                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            )
          ],
        ));
  }

  void addTask() async {
    FocusManager.instance.primaryFocus!.unfocus();

    Map<String, dynamic> data = {
      "taskName": taskNameController.text,
      "dueDate": _dueDate.toString(),
      'createdAt': Timestamp.now(),
      "userId": auth.currentUser!.uid
    };
    if (taskNameController != null && _dueDate != null) {
      await FireStoreService.addTask(data);
      successMessage("Daily Task is Added");
    } else {
      showToastMessage("Add Task and Date");
    }
    log("after adding:" + allTaskList.length.toString());
    setState(() {
      taskNameController.clear();
      _dueDate = null;
    });
  }

  void updateTaskForm(id, data) {
    TextEditingController controller =
        TextEditingController(text: data['taskName']);
    _dueDate = DateTime.parse(data['dueDate']);
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Update your Data",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextfield(
                    controller: controller,
                    hintText: "New Task",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(_dueDate == null
                              ? 'No Due Date'
                              : 'Due Date: ${DateFormat('MMM d, y').format(_dueDate!)}'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                _dueDate = pickedDate;
                              });
                            }
                          },
                          child: const Text('Pick Date'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();

                        Map<String, dynamic> data = {
                          "taskName": controller.text,
                          "dueDate": _dueDate.toString()
                        };
                        FireStoreService.editTask(id, data);
                      },
                      child: const Text("Update Task")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
