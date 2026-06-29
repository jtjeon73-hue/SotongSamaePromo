import 'package:flutter_test/flutter_test.dart';

import 'package:sotong_samae_promo/data/app_catalog.dart';
import 'package:sotong_samae_promo/main.dart';

void main() {
  testWidgets('랜딩 페이지가 렌더링된다', (WidgetTester tester) async {
    await tester.pumpWidget(const SotongSamaePromoApp());
    await tester.pumpAndSettle();

    expect(find.text('소통사매'), findsWidgets);
    expect(find.textContaining(AppCatalog.prelaunchBadge), findsWidgets);
    expect(find.textContaining('미리 만나보세요'), findsOneWidget);
  });
}
