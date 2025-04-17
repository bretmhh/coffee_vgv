// Start Generation Here

import 'package:flutter/material.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/screens/random_image_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RandomImageScreen', () {
    testWidgets(
      'renders CircularProgressIndicator when state is GetRandomImageLoading',
      (WidgetTester tester) async {
        await tester.pumpWidget(RandomImageScreen());
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'renders Text with error message when state is GetRandomImageError',
      (WidgetTester tester) async {
        await tester.pumpWidget(RandomImageScreen());
        expect(find.byType(Text), findsOneWidget);
      },
    );

    testWidgets('renders nothing when state is GetRandomImageInitial', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(RandomImageScreen());
      expect(find.byType(SizedBox), findsNothing);
    });
  });
}
