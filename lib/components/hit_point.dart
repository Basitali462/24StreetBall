import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:street_ball/screen/ball_game.dart';
import 'package:street_ball/utils/static_values.dart';
import 'package:street_ball/utils/static_values.dart';

class HitPoint{
  final StreetBall game;
  Sprite hitPointSprite;
  Rect hitRect;
  bool shotHit = false;

  HitPoint(this.game, double x, double y){
    hitPointSprite = Sprite('target.png');
    hitRect = Rect.fromLTWH(
      x - game.tileSize/2,
      y - game.tileSize/2,
      game.tileSize,
      game.tileSize,
    );
  }

  void render(Canvas c){
    hitPointSprite.renderRect(c, hitRect);
  }

  void update(t){
    if(StaticValues.shotPlayed){
      shotHit = true;
    }
  }
}