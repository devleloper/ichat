extension DateTimeFormatting on DateTime {
  String toMessageTime() {
    final now = DateTime.now();
    final isToday = year == now.year && month == now.month && day == now.day;
    if (isToday) {
      return '$hour:${minute.toString().padLeft(2, '0')}';
    }
    return '$month/$day/${year.toString().substring(2)}';
  }
}
