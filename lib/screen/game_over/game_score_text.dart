import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:street_ball/screen/ball_game.dart';
import 'package:street_ball/utils/static_values.dart';

class GameScoreText{
  final StreetBall game;
  TextPainter painter;
  Offset position;

  GameScoreText(this.game){
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
    if((painter.text ?? '') != StaticValues.gameScore.toString()){
      painter.text = TextSpan(
        text: StaticValues.gameScore.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 80,
        ),
      );
      painter.layout();
      position = Offset(
        (game.screenSize.width / 2) - (painter.width / 2),
        (game.screenSize.height / 2) - (painter.height / 2),
      );
    }
  }
}