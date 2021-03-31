import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:street_ball/screen/ball_game.dart';
import 'package:street_ball/utils/game_state.dart';
import 'package:street_ball/utils/static_values.dart';

class ResetGameText{
  final StreetBall game;
  TextPainter painter;
  Offset position;

  ResetGameText(this.game){
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  void render(Canvas c){
    painter.paint(c, position);
  }


  void update(double t){
    painter.text = TextSpan(
      text: 'RESET GAME',
      style: TextStyle(
        color: Colors.white,
        fontSize: 50.0,
      ),
      recognizer: TapGestureRecognizer()..onTap = () {
        print('reset game');
      },
    );
    painter.layout();
    position = Offset(
      (game.screenSize.width / 2) - (painter.width / 2),
      (game.screenSize.height * 0.7) - (painter.height / 2),
    );
  }
}