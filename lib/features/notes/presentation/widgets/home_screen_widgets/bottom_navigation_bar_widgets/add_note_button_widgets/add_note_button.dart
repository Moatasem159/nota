import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/screens/add_note_screen.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/bottom_navigation_bar_widgets/add_note_button_widgets/add_note_button_builder.dart';
import 'package:nota/core/widgets/open_container.dart';
class AddNoteButton extends StatefulWidget {
  const AddNoteButton({super.key});
  @override
  State<AddNoteButton> createState() => _AddNoteButtonState();
}
class _AddNoteButtonState extends State<AddNoteButton> with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _slideCurveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds:200),reverseDuration: const Duration(milliseconds: 0));
    _slideCurveAnimations = CurvedAnimation(parent: _slideController, curve: Curves.fastEaseInToSlowEaseOut);
    _slideTransition = Tween<Offset>(begin:Offset.zero, end: const Offset(-1, -1.5)).animate(_slideCurveAnimations);
  }
  animateForeword() {
    _slideController.reset();
    _slideController.forward();
  }
  animateReverse() {
    _slideController.reverse();
  }
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.width / 1.357,
      bottom: context.height - 707,
      child: SlideTransition(
        position: _slideTransition,
        child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 300),
        openColor: Theme.of(context).colorScheme.background,
        closedColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        middleColor: Theme.of(context).colorScheme.background,
        closedElevation:10,
        openElevation:10,
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        closedBuilder: (context, action) => AddNoteButtonBuilder(onTap:() {
          Future.delayed(const Duration(milliseconds: 50)).then((value) {action();});
          animateForeword();
        }),
        openBuilder: (context, action) => AddNoteScreen(arrowBack: () {
          animateReverse();
          action();
        }),
        ),
      ),
    );
  }
}