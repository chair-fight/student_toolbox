import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/widgets/dialogs/assignment_edit_dialog.dart';

class AssignmentCard extends StatefulWidget {
  final AssignmentModel assignment;
  final bool isExpanded;
  final Function(AssignmentModel assignment) onTap;
  final Function(AssignmentModel oldAssignment, AssignmentModel newAssignment) onEdit;
  final Function(AssignmentModel oldAssignment) onDelete;

  const AssignmentCard({
    Key key,
    this.assignment,
    this.onEdit,
    this.onTap,
    this.onDelete,
    this.isExpanded,
  }) : super(key: key);

  @override
  _AssignmentCardState createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> with TickerProviderStateMixin {
  AnimationController _isFinishedAnimationController;

  @override
  void initState() {
    super.initState();
    _isFinishedAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 150),
      value: widget.assignment.isFinished ? 1 : 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _isFinishedAnimationController.dispose();
  }

  void _playIsFinishedAnimation() async {
    try {
      if (widget.assignment.isFinished)
        await _isFinishedAnimationController.animateTo(1, curve: Curves.decelerate).orCancel;
      else
        await _isFinishedAnimationController.animateBack(0, curve: Curves.decelerate).orCancel;
    } on TickerCanceled {}
  }

  int _dateDifference(DateTime lhs, DateTime rhs) {
    DateTime lhsDateOnly = new DateTime(lhs.year, lhs.month, lhs.day);
    DateTime rhsDateOnly = new DateTime(rhs.year, rhs.month, rhs.day);
    return lhsDateOnly.difference(rhsDateOnly).inDays;
  }

  @override
  Widget build(BuildContext context) {
    _playIsFinishedAnimation();
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            border: BorderDirectional(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: Theme.of(context).colorScheme.primary,
                value: widget.assignment.isFinished,
                onChanged: (bool value) {
                  widget.onEdit(
                    widget.assignment,
                    AssignmentModel(
                      widget.assignment.id,
                      widget.assignment.name,
                      widget.assignment.dueDate,
                      value,
                    ),
                  );
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _isFinishedAnimationController,
                                      builder: (context, child) => Text(
                                        widget.assignment.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle.lerp(
                                          Theme.of(context).textTheme.subtitle1,
                                          Theme.of(context).textTheme.subtitle1.apply(color: Theme.of(context).textTheme.caption.color),
                                          _isFinishedAnimationController.value,
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: AnimatedBuilder(
                                        animation: _isFinishedAnimationController,
                                        builder: (context, child) => Center(
                                          child: Container(
                                            height: 2,
                                            transform: Matrix4.diagonal3Values(_isFinishedAnimationController.value, 1, 1),
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.caption,
                                    children: [
                                      if (_dateDifference(widget.assignment.dueDate, DateTime.now()) < -1) TextSpan(text: 'Late by ' + _dateDifference(DateTime.now(), widget.assignment.dueDate).toString() + ' days'),
                                      if (_dateDifference(widget.assignment.dueDate, DateTime.now()) == -1) TextSpan(text: 'Late by 1 day'),
                                      if (_dateDifference(widget.assignment.dueDate, DateTime.now()) == 0) TextSpan(text: 'Due today'),
                                      if (_dateDifference(widget.assignment.dueDate, DateTime.now()) == 1) TextSpan(text: 'Due tomorrow'),
                                      if (_dateDifference(widget.assignment.dueDate, DateTime.now()) > 1) TextSpan(text: 'Due in ' + _dateDifference(widget.assignment.dueDate, DateTime.now()).toString() + ' days'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: AnimatedSwitcher(
                              duration: Duration(seconds: 2),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeOut,
                              transitionBuilder: (widget, animation) => RotationTransition(
                                child: widget,
                                turns: animation,
                              ),
                              child: widget.isExpanded
                                  ? Icon(
                                      FontAwesomeIcons.angleUp,
                                      size: 20,
                                      color: Theme.of(context).hintColor,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.angleDown,
                                      size: 20,
                                      color: Theme.of(context).hintColor,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      height: widget.isExpanded ? 48 : 0,
                      child: ClipRect(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(),
                              // TODO - Add Assignment Details
                            ),
                            TextButton(
                              child: Icon(FontAwesomeIcons.shareAlt, size: 20),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Icon(FontAwesomeIcons.pencilAlt, size: 20),
                              onPressed: () => showDialog(context: context, builder: (context) => AssignmentEditDialog(assignment: widget.assignment)).then((value) {
                                if (value != null && value is AssignmentModel) return widget.onEdit(widget.assignment, value);
                              }),
                            ),
                            TextButton(
                              child: Icon(FontAwesomeIcons.trashAlt, size: 20),
                              style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.error),
                              onPressed: () => showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("Do you wish to permanently delete this assignment?"),
                                  actions: [
                                    Container(
                                      width: 96,
                                      child: OutlinedButton(
                                        child: Text("Cancel"),
                                        onPressed: () => Navigator.of(context).pop(false),
                                      ),
                                    ),
                                    Container(
                                      width: 96,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.error),
                                        child: Text("Delete"),
                                        onPressed: () => Navigator.of(context).pop(true),
                                      ),
                                    ),
                                  ],
                                ),
                              ).then((value) {
                                if (value == true) {
                                  widget.onDelete(widget.assignment);
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () => widget.onTap(widget.assignment),
      ),
    );
  }
}
