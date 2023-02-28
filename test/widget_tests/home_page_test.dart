import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:take_one/view/pages/home_page.dart';

void main() {
  testWidgets("Testing HomePage widget", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Test: Scaffold widget
    expect(find.byType(Scaffold), findsOneWidget);

    // Test: AppBar widget
    expect(find.byType(AppBar), findsOneWidget);

    // Test: 2 Text widgets
    expect(find.byType(Text), findsNWidgets(2));

    // Test: "Leaf" text
    expect(find.text("Leaf"), findsOneWidget);

    // Test: "Hello world!" text
    expect(find.text("Hello world!"), findsOneWidget);
  });
}