import 'dart:ffi';

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:street_ball/screen/ball_game.dart';

class BasketPool{
  final StreetBall game;
  Sprite poolSprite;
  Rect poolRect;
  double poolWidth;
  double poolHeight;

  BasketPool(this.game){
    poolSprite = Sprite('basket.png');
    poolWidth = game.tileSize*2;
    poolHeight = game.tileSize*4;
    poolRect = Rect.fromLTWH(
      game.screenSize.width/2 - poolWidth/2,
      game.screenSize.height/3 - poolHeight/1.2,
      poolWidth,
      poolHeight,
    );
  }

  void render(Canvas c){
    poolSprite.renderRect(c, poolRect);
  }

  void update(double t){}
}