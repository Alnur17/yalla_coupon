
import 'package:intl/intl.dart';

class DateHelper {
  /// Formats a date string to 'yyyy-MM-dd'
  static String formatDate(String? dateString, {String format = 'yyyy-MM-dd'}) {
    if (dateString == null || dateString.isEmpty) return 'N/A';
    try {
      final dt = DateTime.parse(dateString);
      return DateFormat(format).format(dt);
    } catch (_) {
      return dateString; // fallback if parsing fails
    }
  }

  /// Returns a "time remaining" style string until the given date
  static String timeRemaining(String? dateString) {
    if (dateString == null || dateString.isEmpty) return 'N/A';
    try {
      final dt = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = dt.difference(now);

      if (difference.inDays > 0) {
        return '${difference.inDays} days left';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours left';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minutes left';
      } else {
        return 'Expired';
      }
    } catch (_) {
      return dateString;
    }
  }

  /// Returns a "time ago" style string for how much time has passed since the given date
  static String timeAgo(String? dateString) {
    if (dateString == null || dateString.isEmpty) return 'N/A';
    try {
      final dt = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(dt); // ✅ how much time has passed

      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else {
        return 'just now';
      }
    } catch (_) {
      return dateString;
    }
  }

}
