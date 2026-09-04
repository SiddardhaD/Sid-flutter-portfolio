import 'package:url_launcher/url_launcher.dart';

/// Non-web fallback: just opens the file with the platform's default handler.
Future<void> triggerDownload(Uri uri, String filename) async {
  try {
    await launchUrl(uri);
  } catch (_) {}
}
