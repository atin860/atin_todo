import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:atin_todo/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Task {
  final String title;

  final DateTime dueDate;

  Task({
    required this.title,
    required this.dueDate,
  });
}

// TaskProvider for state management
class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

class WOrksTodayScreen extends StatelessWidget {
  const WOrksTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: GestureDetector(
        onTap: () {
          //hide keyboard code..................
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            TaskForm(),
            TaskList(),
          ],
        ),
      ),
    );
  }
}

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _titleController = TextEditingController();

  DateTime? _dueDate;

  void _submitForm() {
    final title = _titleController.text;

    if (title.isEmpty || _dueDate == null) {
      print('add your task or date');
      showToastMessage('Task or date is required');
      return;
    }

    final newTask = Task(
      title: title,
      dueDate: _dueDate!,
    );

    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);

    // Clear form
    _titleController.clear();

    setState(() {
      _dueDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppTextfield(
            controller: _titleController,
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
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Task'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return Dismissible(
            key: Key(task.title),
            onDismissed: (direction) {
              Provider.of<TaskProvider>(context, listen: false)
                  .removeTask(task);
            },
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(
                '${DateFormat('MMM d, y').format(task.dueDate)} ',
              ),
            ),
          );
        },
      ),
    );
  }
}
