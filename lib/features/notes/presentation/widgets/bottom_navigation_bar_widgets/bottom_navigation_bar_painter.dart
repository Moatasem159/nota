import 'package:flutter/material.dart';
class BottomNavBarPainter extends CustomPainter{
  final Color backgroundColor;
  BottomNavBarPainter({required this.backgroundColor});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.9999728);
    path_0.lineTo(0,size.height*0.5244293);
    path_0.quadraticBezierTo(size.width*0.5140278,size.height*0.5244293,size.width*0.7050000,size.height*0.5244293);
    path_0.cubicTo(size.width*0.7383333,size.height*0.5211005,size.width*0.7105556,size.height*0.6818342,size.width*0.7638889,size.height*0.7545924);
    path_0.cubicTo(size.width*0.8052778,size.height*0.7698098,size.width*0.8197222,size.height*0.7698098,size.width*0.8694444,size.height*0.7545924);
    path_0.cubicTo(size.width*0.9250000,size.height*0.6742255,size.width*0.8994444,size.height*0.5249049,size.width*0.9250000,size.height*0.5244293);
    path_0.quadraticBezierTo(size.width*0.9493056,size.height*0.5244293,size.width*1.0011111,size.height*0.5244293);
    path_0.lineTo(size.width*1.0016667,size.height*1.0056793);
    path_0.lineTo(0,size.height*0.9999728);
    path_0.close();
    canvas.drawPath(path_0, paintFill0);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
}