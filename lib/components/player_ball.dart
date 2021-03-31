import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:street_ball/screen/ball_game.dart';
import 'package:street_ball/utils/static_values.dart';

class PlayerBall{
  final StreetBall game;
  Sprite ballSprite;
  Rect ballRect;
  double ballWidth;
  double ballHeight;
  double speed;
  bool ballDunk = false;

  PlayerBall(this.game, double x, double y){
    ballSprite = Sprite('ball_with_shadow.png');
    speed = game.tileSize * 20;
    ballWidth = game.tileSize * 1.2;
    ballHeight = game.tileSize * 1.2;
    ballRect = Rect.fromLTWH(
      x - ballWidth/2,
      y - ballHeight/2,
      ballWidth,
      ballHeight,
    );
  }

  void render(Canvas c){
    ballSprite.renderRect(c, ballRect);
  }

  void update(double t){
    if(StaticValues.shotPlayed){
      double stepDistance = speed * t;
      Offset toBasket = (game.basketPool.poolRect.center.scale(1, 0.7)) - ballRect.center;
      if(stepDistance <= toBasket.distance){
        Offset stepToBasket = Offset.fromDirection(toBasket.direction, stepDistance);
        ballRect = ballRect.shift(stepToBasket);
      }else{
        StaticValues.shotPlayed = false;
        StaticValues.nextMove = true;
        ballDunk = true;
      }
    }
  }

}