class HumanFormats {
  static String reproductionTime(String milliseconds) {
    final int millis = int.tryParse(milliseconds) ?? 0;
    final Duration duration = Duration(milliseconds: millis);
    
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    
    final String minutes = twoDigits(duration.inMinutes.remainder(60));
    final String seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$minutes:$seconds";
  }
}
