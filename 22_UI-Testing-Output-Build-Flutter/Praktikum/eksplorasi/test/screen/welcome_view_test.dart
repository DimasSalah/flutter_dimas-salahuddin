import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/pages/welcome_view.dart';

void main() {
  testWidgets('Welcome view test', (WidgetTester tester) async {
    // Membungkus widget dengan MaterialApp
    await tester.pumpWidget(const MaterialApp(home: WelcomeView()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('appBar')), findsOneWidget);
    expect(find.byKey(const Key('carousel')), findsOneWidget);
    expect(find.byKey(const Key('title')), findsOneWidget);
    expect(find.byKey(const Key('subtitle')), findsOneWidget);
    expect(find.byKey(const Key('button submit')), findsOneWidget);
  });
}
