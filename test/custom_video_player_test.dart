import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/custom_video_player.dart';
import 'package:pod_player/pod_player.dart';

void main() {
  group('CustomVideoPlayer Widget Tests', () {
    testWidgets('Widget displays error message when URI is null',
        (WidgetTester tester) async {
      // Build the CustomVideoPlayer widget with null URI
      await tester.pumpWidget(const MaterialApp(
        home: CustomVideoPlayer(uri: null),
      ));

      // Expect to find the error message widget
      expect(find.text('No video available'), findsOneWidget);
    });

    testWidgets('Widget displays video player when URI is not null',
        (WidgetTester tester) async {
      // Build the CustomVideoPlayer widget with a non-null URI
      await tester.pumpWidget(const MaterialApp(
        home: CustomVideoPlayer(
            uri: 'https://www.youtube.com/watch?v=9CU25fv9_R8'),
      ));

      // Expect to find the PodVideoPlayer widget
      expect(find.byType(PodVideoPlayer), findsOneWidget);
    });
  });
}
