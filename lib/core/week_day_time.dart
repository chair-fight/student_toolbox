class WeekDayTime {
  static const List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  int _weekDay;
  int _hours;
  int _minutes;

  WeekDayTime({weekDay = 0, hours = 0, minutes = 0}) {
    this._weekDay = weekDay % 7;
    this._hours = hours % 24;
    this._minutes = minutes % 60;
  }

  int get weekDay => _weekDay;

  int get hours => _hours;

  int get minutes => _minutes;

  String get weekDayName => weekDays[_weekDay];

  int inDays() {
    return _weekDay;
  }

  int inHours() {
    return _weekDay * 24 + _hours;
  }

  int inMinutes() {
    return _weekDay * 1440 + _hours * 60 + _minutes;
  }

  static WeekDayTime get min => WeekDayTime(weekDay: 0, hours: 0, minutes: 0);

  static WeekDayTime get max => WeekDayTime(weekDay: 6, hours: 23, minutes: 59);

  static WeekDayTime fromDateTime(DateTime dateTime) {
    return WeekDayTime(
      weekDay: dateTime.weekday - 1,
      hours: dateTime.hour,
      minutes: dateTime.minute,
    );
  }

  static WeekDayTime now() {
    var now = DateTime.now();
    return WeekDayTime(
      weekDay: now.weekday - 1,
      hours: now.hour,
      minutes: now.minute,
    );
  }

  DateTime toDateTime(DateTime referenceDateTime) {
    return referenceDateTime
        .subtract(Duration(
            days: referenceDateTime.weekday - 1, hours: referenceDateTime.hour, minutes: referenceDateTime.minute))
        .add(Duration(days: _weekDay, hours: _hours, minutes: _minutes));
  }

  bool equals(WeekDayTime weekDayTime) {
    return _weekDay == weekDayTime._weekDay && _hours == weekDayTime._hours && _minutes == weekDayTime._minutes;
  }

  bool isBefore(WeekDayTime weekDayTime) {
    return inMinutes() < weekDayTime.inMinutes();
  }

  bool isAfter(WeekDayTime weekDayTime) {
    return inMinutes() > weekDayTime.inMinutes();
  }

  WeekDayTime add(WeekDayTime weekDayTime) {
    var x = (inMinutes() + weekDayTime.inMinutes()) % WeekDayTime.max.inMinutes();
    return new WeekDayTime(
      weekDay: (x ~/ 1440) % 7,
      hours: (x ~/ 60) % 24,
      minutes: x % 60,
    );
  }

  WeekDayTime subtract(WeekDayTime weekDayTime) {
    var x = (inMinutes() - weekDayTime.inMinutes()) % WeekDayTime.max.inMinutes();
    return new WeekDayTime(
      weekDay: (x ~/ 1440) % 7,
      hours: (x ~/ 60) % 24,
      minutes: x % 60,
    );
  }

  int compareTo(other) {
    if (this.isBefore(other))
      return -1;
    else if (this.isAfter(other))
      return 1;
    else
      return 0;
  }
}
