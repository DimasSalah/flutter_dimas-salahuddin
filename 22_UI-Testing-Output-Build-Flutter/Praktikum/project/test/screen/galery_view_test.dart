import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas_1/pages/gallery/gallery_view.dart';

void main() {
  testWidgets('Contact View Test', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(home: GalleryView()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('appbar')), findsOneWidget);
    expect(find.byKey(const Key('appbarTitle')), findsOneWidget);
    expect(find.byKey(const Key('GridView')), findsOneWidget);
    
  });
}