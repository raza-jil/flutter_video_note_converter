// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_video_note_converter/main.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VideoToNoteApp());

    // Verify that the home screen title is shown.
    expect(find.text('Turn videos into notes'), findsOneWidget);

    // Verify that the "Convert a video" button is present.
    expect(find.text('Convert a video'), findsOneWidget);
  });
}