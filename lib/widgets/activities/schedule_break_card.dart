import 'package:flutter/material.dart';
import 'package:student_toolbox/core/week_day_time.dart';

class ScheduleBreakCard extends StatelessWidget {
  final WeekDayTime start;
  final WeekDayTime end;

  const ScheduleBreakCard({Key key, this.start, this.end}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Stack(
        children: [
          Container(
            height: 32,
            padding: EdgeInsets.fromLTRB(10, 4, 8, 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    child: Text(
                      ((end.subtract(start).hours > 0) ? end.subtract(start).hours.toString() : "") +
                          ((end.subtract(start).hours > 0 && end.subtract(start).minutes > 0) ? ":" : "") +
                          ((end.subtract(start).hours > 0 &&
                                  end.subtract(start).minutes > 0 &&
                                  end.subtract(start).minutes < 10)
                              ? "0"
                              : "") +
                          ((end.subtract(start).minutes > 0) ? end.subtract(start).minutes.toString() : "") +
                          ((end.subtract(start).hours > 0) ? " Hour Break" : " Minute Break"),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                Text(
                  start.hours.toString().padLeft(2, '0'),
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                ),
                Text(
                  start.minutes.toString().padLeft(2, '0'),
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
                ),
                Text(
                  " - ",
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                ),
                Text(
                  end.hours.toString().padLeft(2, '0'),
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                ),
                Text(
                  end.minutes.toString().padLeft(2, '0'),
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            height: 32,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              child: RotatedBox(
                quarterTurns: 1,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white12,
                  value: (WeekDayTime.now().isBefore(start))
                      ? 0
                      : (WeekDayTime.now().isAfter(end))
                          ? 1.0
                          : WeekDayTime.now().subtract(start).inMinutes() / end.subtract(start).inMinutes(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
