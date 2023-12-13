import 'dart:developer';

import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/service/firebase_database.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:flutter/material.dart';
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
    getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            AppTextfield(
              controller: taskNameController,
              labelText: 'Add Task',
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                    child: Text('Pick Date'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  addTask();
                },
                child: Text("Add Task")),
            processing
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: allTaskList.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(allTaskList[index]['taskName']),
                            subtitle: Text(
                              '${DateFormat('MMM d, y').format(DateTime.parse(allTaskList[index]['dueDate']))} ',
                            ),
                          );
                        })))
          ],
        ));
  }

  getTask() async {
    setState(() {
      processing = true;
    });
    allTaskList = await FireStoreService.getTask();
    setState(() {
      processing = false;
    });
  }

  void addTask() async {
    FocusManager.instance.primaryFocus!.unfocus();

    Map<String, dynamic> data = {
      "taskName": taskNameController.text,
      "dueDate": _dueDate.toString(),
      "userId": auth.currentUser!.uid
    };
    log("befor adding:" + allTaskList.length.toString());
    allTaskList.add(data);
    Map? res = await FireStoreService.addTask(data);
    if (res == null) {
      log("error aaddd ni hua");
    }
    log("after adding:" + allTaskList.length.toString());
    setState(() {
      taskNameController.clear();
      _dueDate = null;
    });
  }
}
