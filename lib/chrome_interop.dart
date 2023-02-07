// File interop with javascript functionality exposed by chrome extensions.
@JS()
library stringify;

import 'package:js/js.dart';

/// Calls invoke JavaScript `chrome.tabs.query(obj)`. See documentatin at
/// https://developer.chrome.com/docs/extensions/reference/tabs/#method-query
@JS('chrome.tabs.query')
external dynamic query(QueryInfo queryInfo, [Function? callback]);

/// JavaScript object to pass as obj `chrome.tabs.query`
@JS()
@anonymous
class QueryInfo {
  /// Current Dart below only exposes `active` and `highlighted` fields of
  /// javascipt object. But could extended to exposes remaining. (`audible`,
  /// `autoDiscardable`,`discarded`,`groupId`,`index`, ...)
  external bool? get active;
  external bool? get currentWindow;
  external bool? get highlighted;
  external factory QueryInfo(
      {bool? active, bool? currentWindow, bool? highlighted});
}

/// JavaScript object(s) returned from `chrome.tabs.query`
@JS()
@anonymous
class Tab {
  /// Current Dart below only exposes `url` field of
  /// javascipt object. But could extended to exposes remaining. (`audible`,
  /// `autoDiscardable`,`discarded`,`favIconUrl`,`groupId`,`height`, ...)
  external String? get url;
  external factory Tab({
    String? url,
  });
}
