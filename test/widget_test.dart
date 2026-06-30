import 'package:flutter_test/flutter_test.dart';
import 'package:ichat/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const IChatApp());
    expect(find.text('iChat'), findsOneWidget);
  });
}

