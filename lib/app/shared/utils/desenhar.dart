import 'package:flutter/cupertino.dart';
import 'package:pintura/app/modules/home/home_store.dart';

class Desenhar extends CustomPainter {
  Desenhar({required this.pointsList});
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = [];
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i].points.dx != -1 && pointsList[i + 1].points.dx != -1) {
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i].points.dx != -1 &&
          pointsList[i + 1].points.dx == -1) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));

        canvas.drawCircle(pointsList[i].points,
            pointsList[i].paint.strokeWidth * .5, pointsList[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(Desenhar oldDelegate) => true;
}
