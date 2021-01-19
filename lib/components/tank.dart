import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_handle/components/screen.dart';

class Tank {
  final Screen game;
  Offset position = Offset.zero;
  double bodyAngle = 0;
  double turretAngle = 0;
  double targetBodyAngle;

  Tank(this.game, {this.position});

  //绘制
  void render(Canvas c) {
    Paint lightPaint = Paint()..color = Color(0xffdddddd);
    Paint darkPaint = Paint()..color = Color(0xff777777);

    c.save();
    c.translate(position.dx, position.dy);

    //tank body
    c.drawRect(
      Rect.fromLTWH(-20, -15, 40, 30),
      lightPaint,
    );

    //tank wheel
    c.drawRect(
      Rect.fromLTWH(-24, -23, 48, 8),
      darkPaint,
    );
    c.drawRect(
      Rect.fromLTWH(-24, 15, 48, 8),
      darkPaint,
    );

    //tank
    c.drawRect(
      Rect.fromLTWH(-10, -12, 25, 24),
      darkPaint,
    );
    c.drawRect(
      Rect.fromLTWH(0, -3, 36, 6),
      darkPaint,
    );
    c.drawRect(
      Rect.fromLTWH(36, -5, 6, 10),
      darkPaint,
    );

    c.restore();
  }

  void update(double t) {
    final double rotationRate = pi * t;

    if (targetBodyAngle != null) {
      if (bodyAngle < targetBodyAngle) {
        if ((targetBodyAngle - bodyAngle).abs() > pi) {
          bodyAngle = bodyAngle - rotationRate;
          if (bodyAngle < -pi) {
            bodyAngle += pi * 2;
          } else {
            bodyAngle = bodyAngle + rotationRate;
            if (bodyAngle > targetBodyAngle) {
              bodyAngle = targetBodyAngle;
            }
          }
        }
      }
      if (bodyAngle > targetBodyAngle) {
        if ((targetBodyAngle - bodyAngle).abs() < pi) {
          bodyAngle = bodyAngle + rotationRate;
          if (bodyAngle > pi) {
            bodyAngle -= pi * 2;
          } else {
            bodyAngle = bodyAngle - rotationRate;
            if (bodyAngle < targetBodyAngle) {
              bodyAngle = targetBodyAngle;
            }
          }
        }
      }
    }
  }
}
