// Process JavaScript interop objects as Dart friendly
import 'chrome_interop.dart';
import 'package:js/js_util.dart';

/// Returns `url` String from current tab.
Future<String?> getCurrentTabUrl() async {
  final promise =
      query(QueryInfo(active: true, highlighted: true, currentWindow: true));
  final result = await promiseToFuture(promise);
  // `query` result may return single `Tab` object, or a list containint `Tab` objects.
  if (result is List) {
    // Find first `Tab` object with `url`.
    for (final tab in result) {
      if (tab is Tab && tab.url != null) {
        return tab.url;
      }
    }
  }
  return (result is Tab) ? result.url : null;
}
