import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter_handle/components/tank.dart';

//背景 -- 场景
class Screen extends Game {
  Size screenSize;
  Tank tank;

  @override
  void render(Canvas canvas) {
    if (screenSize == null) {
      return;
    }
    canvas.drawRect(Rect.fromLTWH(0, 0, screenSize.width, screenSize.height),
        Paint()..color = Color(0xff27ae60));

    tank.render(canvas);
  }

  @override
  void update(double t) {
    if (screenSize == null) {
      return;
    }
    tank.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    if (tank == null) {
      tank = Tank(this,
          position: Offset(screenSize.width / 2, screenSize.height / 2));
    }
  }

  void onLeftJoyConChange(Offset offset) {
    if (offset == Offset.zero) {
      tank.targetBodyAngle = null;
    } else {
      tank.targetBodyAngle = offset.direction;
    }
  }
}
