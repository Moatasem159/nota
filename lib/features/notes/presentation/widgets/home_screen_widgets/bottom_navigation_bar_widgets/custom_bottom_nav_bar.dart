import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/bottom_navigation_bar_widgets/add_note_button_widgets/add_note_button.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/bottom_navigation_bar_widgets/bottom_navigation_bar_painter.dart';
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(context.width,context.height/8.5),
          painter: BottomNavBarPainter(backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!),
        ),
        const AddNoteButton()
      ],
    );
  }
}