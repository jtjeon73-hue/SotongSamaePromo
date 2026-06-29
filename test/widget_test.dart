import 'package:flutter_test/flutter_test.dart';

import 'package:sotong_samae_promo/main.dart';

void main() {
  testWidgets('랜딩 페이지가 렌더링된다', (WidgetTester tester) async {
    await tester.pumpWidget(const SotongSamaePromoApp());
    await tester.pumpAndSettle();

    expect(find.text('소통사매'), findsWidgets);
    expect(find.textContaining('사매면 생활정보를 한눈에'), findsOneWidget);
  });
}
