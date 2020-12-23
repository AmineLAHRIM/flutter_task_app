import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_app/items/task_item.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/services/task_service.dart';
import 'package:task_app/services/user_task_detail_service.dart';
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
  List<Task> TomorrowTasks = [];

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
            TomorrowTasks = value
                .where((element) => element.status == TaskStatus.Task)
                .toList();

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
              flex: 8,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: Container(
                        child: SvgPicture.asset(
                          'assets/images/icon_filter.svg',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 80,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Dashboard',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Container(
                        child: SvgPicture.asset(
                            'assets/images/icon_notification.svg',
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 84,
              child: Container(
                color: AppTheme.primary.withOpacity(0.04),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Text(
                            'Hi Amine, you have 4 tasks due today',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
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
                              UserTaskDetailService userTaskDetailService =
                                  Provider.of<UserTaskDetailService>(context,
                                      listen: false);

                              return TaskItem(
                                  currentTask: currentTask,
                                  userTaskDetailService: userTaskDetailService);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Text(
                            'Tomorrow',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          child: Text('Expand All',
                              style: Theme.of(context).textTheme.headline4),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: TomorrowTasks.length,
                            itemBuilder: (context, index) {
                              Task currentTask = TomorrowTasks[index];
                              UserTaskDetailService userTaskDetailService =
                                  Provider.of<UserTaskDetailService>(context,
                                      listen: false);

                              return TaskItem(
                                  currentTask: currentTask,
                                  userTaskDetailService: userTaskDetailService);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Card(
                elevation: 8,
                margin: EdgeInsets.zero,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 20,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Icon(EvaIcons.home,
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: AppTheme.shadow.withOpacity(0.1),
                                  onTap: () => null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Icon(EvaIcons.search,
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: AppTheme.shadow.withOpacity(0.1),
                                  onTap: () => null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: AppTheme.primary,
                            child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Icon(
                                  EvaIcons.plus,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Icon(EvaIcons.calendar,
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: AppTheme.shadow.withOpacity(0.1),
                                  onTap: () => null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Icon(
                                EvaIcons.settings,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: AppTheme.shadow.withOpacity(0.1),
                                  onTap: () => null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
