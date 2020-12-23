import 'package:align_positioned/align_positioned.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/services/user_task_detail_service.dart';
import 'package:task_app/style.dart';

class TaskItem extends StatefulWidget {
  TaskItem({
    Key key,
    @required this.currentTask,
    @required this.userTaskDetailService,
  }) : super(key: key);

  final Task currentTask;
  final UserTaskDetailService userTaskDetailService;

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, top: 8, bottom: 16),
      child: AspectRatio(
        aspectRatio: 1.6/1,
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              shadowColor: AppTheme.shadow,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radius)),
              child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 20,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 80,
                                    child: FittedBox(
                                      child: Text(
                                        widget.currentTask.name,
                                        style:
                                            Theme.of(context).textTheme.headline2,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 20,
                                    child: Icon(
                                      EvaIcons.moreHorizotnal,
                                      color: AppTheme.subTitleTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: FractionallySizedBox(
                                heightFactor: 0.6,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: users.length,
                                  itemBuilder: (context, index) {
                                    var currentUser = users[index];
                                    return Container(
                                      height: double.infinity,
                                      margin: EdgeInsets.only(
                                          right: 8),
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: Card(
                                          elevation: 0,
                                          margin: EdgeInsets.zero,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  AppTheme.radius)),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: CachedNetworkImage(
                                              imageUrl: currentUser.imageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Divider(
                              color: AppTheme.shadow,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                              flex: 30,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                margin:
                                    EdgeInsets.only(left: 16, right: 16),
                                child: FractionallySizedBox(
                                  heightFactor: 0.65,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 40,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          elevation: 0,
                                          color: widget.currentTask.status == null
                                              ? AppTheme.primary
                                              : AppTheme.taskStatusColors[
                                                  widget.currentTask.status.index],
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  AppTheme.radius)),
                                          child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              alignment: Alignment.center,
                                              child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                child: Text(
                                                  widget.currentTask.status == null
                                                      ? 'Task'
                                                      : describeEnum(
                                                          widget.currentTask.status),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5
                                                      .copyWith(color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      ),
                                      Spacer(
                                        flex: 20,
                                      ),
                                      Expanded(
                                        flex: 40,
                                        child: Container(
                                          width: double.infinity,
                                          child: FractionallySizedBox(
                                            heightFactor: 0.8,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 8),
                                                        child: FittedBox(
                                                            child: Icon(
                                                                EvaIcons.clock)))),
                                                Flexible(
                                                  child: Container(
                                                    child: FittedBox(
                                                      child: Text(
                                                        DateFormat.d().format(widget
                                                                .currentTask.date) +
                                                            ' - ' +
                                                            DateFormat.Hm().format(
                                                                widget.currentTask
                                                                    .date),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
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
            Container(
              width: 5,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                heightFactor: 0.7,
                widthFactor: 1,
                child: AlignPositioned(
                  moveByContainerWidth: -0.5,
                  touch: Touch.inside,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    color: widget.currentTask.status == null
                        ? AppTheme.primary
                        : AppTheme
                            .taskStatusColors[widget.currentTask.status.index],
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setupUsers() {
    widget.userTaskDetailService
        .findAllByTask_Id(widget.currentTask.id)
        .then((value) {
      if (value != null && value.length > 0) {
        setState(() {
          if (value.length > 5) {
            users = value.sublist(0, 5);
          } else {
            users = value;
          }
        });
      }
    });
  }
}
