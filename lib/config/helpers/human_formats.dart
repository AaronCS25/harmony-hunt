class HumanFormats {
  static String millisecondsToMinutes(int milliseconds) {
    int seconds = (milliseconds / 1000).round();
    int minutes = seconds ~/ 60;
    seconds %= 60;

    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = seconds.toString().padLeft(2, '0');

    return '$minutesString:$secondsString';
  }
}
