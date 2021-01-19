import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_handle/widget/joy.dart';

import 'components/screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await SystemChrome.setEnabledSystemUIOverlays([]);

  final Screen game = Screen();

  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          game.widget,
          Column(
            children: [
              Spacer(),
              Row(
                children: [
                  SizedBox(width: 48),
                  JoyCon(
                    onChange: (Offset delta) => game.onLeftJoyConChange,
                  ),
                  Spacer(),
                  JoyCon(
                    onChange: (Offset delta) => print(delta),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
    ),
  );
}
