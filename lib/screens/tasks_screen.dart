import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/add_newTask.dart';
import 'package:todoey_flutter/widgets/task_Tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/providers.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TasksScreen> {
  // List<Task> tasks = [
  //   Task(name: 'Buy milk'),
  //   Task(name: 'Buy eggs'),
  //   Task(name: 'Buy Sandwich')
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasksCount} tasks',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Consumer<TaskData>(
                builder: (context, taskData1, child) {
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        final task = taskData1.tasks[index];
                        return TaskTile(
                          taskTitle: task.name,
                          isChecked: task.isDone,
                          checkBoxCallBack: (checkBoxState) {
                            taskData1.updateTask(task);
                          },
                          longPressCallBack: () {
                            taskData1.deleteTask(task);
                          },
                        );
                      },
                      itemCount: Provider.of<TaskData>(context).tasksCount);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
