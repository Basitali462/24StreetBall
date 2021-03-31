import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:street_ball/screen/ball_game.dart';

class GameOverText{
  final StreetBall game;
  TextPainter painter;
  Offset position;

  GameOverText(this.game){
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
      text: 'GAME OVER',
      style: TextStyle(
        color: Colors.white,
        fontSize: 50.0,
      ),
    );
    painter.layout();
    position = Offset(
      (game.screenSize.width / 2) - (painter.width / 2),
      (game.screenSize.height * 0.2) - (painter.height / 2),
    );
  }
}