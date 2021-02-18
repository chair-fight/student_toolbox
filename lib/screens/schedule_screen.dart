import 'package:flutter/material.dart';
import 'package:student_toolbox/models/schedule_model.dart';
import 'package:student_toolbox/models/schedule_model_private.dart';
import 'package:student_toolbox/models/schedule_model_public.dart';
import 'package:student_toolbox/widgets/app_bars/common_app_bar.dart';
import 'package:student_toolbox/widgets/loading_widget.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleModel> schedules;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() async {
    // TODO - Implement when database is up
    await Future.delayed(const Duration(milliseconds: 500), () => null);
    setState(() {
      schedules = [
        ScheduleModelPrivate(
          sid: 1,
          name: "Week 1",
          scheduleEntrySeidList: [],
          uid: 0,
        ),
        ScheduleModelPrivate(
          sid: 1,
          name: "Week 1",
          scheduleEntrySeidList: [],
          uid: 0,
        ),
        ScheduleModelPublic(
          sid: 1,
          name: "UBB Info Engleza W1",
          scheduleEntrySeidList: [],
          gid: 0,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: schedules == null ? 0 : schedules.length,
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text("Schedule"),
          bottom: schedules == null
              ? null
              : TabBar(
                  isScrollable: true,
                  tabs: schedules.map((schedule) => Tab(text: schedule.name)).toList(),
                ),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          reverseDuration: Duration.zero,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              child: child,
              opacity: animation,
            );
          },
          child: schedules == null //
              ? LoadingWidget()
              : TabBarView(
                  children: schedules
                      .map(
                        (schedule) => ListView(),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}
