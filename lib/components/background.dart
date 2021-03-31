import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:street_ball/screen/ball_game.dart';

class Background{
  final StreetBall game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game){
    bgSprite = Sprite('background.png');
    bgRect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
    );
  }

  void render(Canvas c){
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t){}
}