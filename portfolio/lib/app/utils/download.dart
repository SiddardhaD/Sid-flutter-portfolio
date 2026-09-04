// Cross-platform file "download" trigger. On the web build (the one this
// portfolio actually ships) it forces a real browser file-save via a hidden
// `<a download>` anchor. On other platforms it falls back to opening the
// file with the OS default handler.
export 'download_stub.dart' if (dart.library.html) 'download_web.dart';
