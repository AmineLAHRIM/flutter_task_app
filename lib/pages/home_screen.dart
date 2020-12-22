import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/services/task_service.dart';
import 'package:task_app/style.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskService taskService;
  bool isInit = false;
  bool isLoading = true;
  List<Task> tasks = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!isInit) {
      taskService = Provider.of<TaskService>(context);
      taskService.findAll().then((value) {
        if (value != null && value.length > 0) {
          setState(() {
            tasks = value;
            isLoading = false;
          });
        }
      });
    }
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiLight);
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 80,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          'Hi Amine, you have 4 tasks due today',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Text('Expand All',
                            style: Theme.of(context).textTheme.headline4),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            Task currentTask = tasks[index];
                            return Container(
                              width: 280,
                              margin: EdgeInsets.only(right: 16,top: 16,bottom: 16),
                              child: Card(
                                elevation: 4,
                                shadowColor: AppTheme.shadow,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppTheme.radius)),
                                child: Container(
                                  child: Center(child: Text(currentTask.name)),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
