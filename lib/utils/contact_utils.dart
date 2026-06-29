import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/app_catalog.dart';

Future<void> openContactEmail({String? subject}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: AppCatalog.contactEmail,
    query: _encodeQuery({
      'subject': subject ?? '[소통사매] 앱 문의',
      'body': '안녕하세요.\n\n소통사매 앱에 대해 문의드립니다.\n\n',
    }),
  );
  if (!await launchUrl(uri)) {
    debugPrint('mailto 열기 실패: $uri');
  }
}

Future<void> openLaunchNotifyEmail() async {
  final uri = Uri(
    scheme: 'mailto',
    path: AppCatalog.contactEmail,
    query: _encodeQuery({
      'subject': '[소통사매] 앱 출시 알림 신청',
      'body': '안녕하세요.\n\n소통사매 앱 출시 알림을 받고 싶습니다.\n연락처:\n\n',
    }),
  );
  if (!await launchUrl(uri)) {
    debugPrint('mailto 열기 실패: $uri');
  }
}

// TODO: Play Store 링크 확정 후 AppCatalog.playStoreUrl 연결
Future<void> openAppStore() async {
  final url = AppCatalog.playStoreUrl;
  if (url.isEmpty) {
    debugPrint('TODO: 앱스토어 링크가 아직 설정되지 않았습니다.');
    return;
  }
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('앱스토어 열기 실패: $uri');
  }
}

String? _encodeQuery(Map<String, String> params) {
  final entries = params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
  return entries.isEmpty ? null : entries;
}
