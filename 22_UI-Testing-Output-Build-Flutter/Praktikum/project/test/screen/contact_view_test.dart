import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas_1/pages/contact/contact_view.dart';

void main() {
  testWidgets('Contact View Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactView()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('appbar')), findsOneWidget);
    expect(find.byKey(const Key('FormName')), findsOneWidget);
    expect(find.byKey(const Key('FormPhone')), findsOneWidget);
    expect(find.byKey(const Key('FormDate')), findsOneWidget);
    expect(find.byKey(const Key('FormColor')), findsOneWidget);
    expect(find.byKey(const Key('FormFile')), findsOneWidget);
    expect(find.byKey(const Key('SubmitButton')), findsOneWidget);
  });
}