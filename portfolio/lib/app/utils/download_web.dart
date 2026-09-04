import 'package:web/web.dart' as web;

/// Web implementation: creates a hidden `<a download>` anchor and clicks it,
/// which triggers a real browser file-save instead of just opening a tab.
Future<void> triggerDownload(Uri uri, String filename) async {
  final anchor =
      web.document.createElement('a') as web.HTMLAnchorElement
        ..href = uri.toString()
        ..download = filename
        ..style.display = 'none';
  web.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
