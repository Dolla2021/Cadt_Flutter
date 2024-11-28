class MyDuration {
  final int _milliseconds;

  const MyDuration._(this._milliseconds);

  const MyDuration.fromHours(int hours)
      : _milliseconds = hours * 60 * 60 * 1000;
  const MyDuration.fromMinutes(int minutes)
      : _milliseconds = minutes * 60 * 1000;
  const MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  int get inHours => (_milliseconds / (60 * 60 * 1000)).floor();
  int get inMinutes => (_milliseconds / (60 * 1000)).floor();
  int get inSeconds => (_milliseconds / 1000).floor();
  int get inMilliseconds => _milliseconds;

  // Overloaded operator: >
  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  bool operator <(MyDuration other) {
    return _milliseconds < other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration._(_milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Duration cannot be negative');
    }
    return MyDuration._(result);
  }

  @override
  String toString() {
    int totalSeconds = (_milliseconds / 1000).round();
    int minutes = (totalSeconds / 60).floor();
    int seconds = totalSeconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;

    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = const MyDuration.fromHours(2);
  MyDuration duration2 = const MyDuration.fromMinutes(10);
  //total duration
  print(duration1 + duration2);

  // Compare durations
  print(duration1 > duration2);

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e);
  }
}
