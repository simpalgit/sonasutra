import 'package:flutter_test/flutter_test.dart';
import 'package:sonasutra/main.dart';

void main() {
  testWidgets('SonaSutra app smoke test', (WidgetTester tester) async {
    // Build SonaSutra app and trigger a frame.
    await tester.pumpWidget(const SonaSutraApp());

    // Verify app renders splash screen title or branding
    expect(find.text('SONA SUTRA'), findsOneWidget);

    // Advance time for splash timer to avoid pending timers
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}
