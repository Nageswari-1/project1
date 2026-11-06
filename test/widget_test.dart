// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:project1/main.dart';

void main() {
  testWidgets('Music Playlist App loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => MusicProvider(),
        child: const MusicPlaylistApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Music Playlist'), findsOneWidget);
    expect(find.text('Welcome to Music Playlist'), findsOneWidget);
    expect(find.text('Open Playlist'), findsOneWidget);
    expect(find.text('Add New Song'), findsOneWidget);
  });
}