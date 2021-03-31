import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:street_ball/screen/ball_game.dart';
import 'package:street_ball/utils/static_values.dart';

class ShotBox{
  final StreetBall game;
  List<Sprite> boxSprites;
  Sprite btnSprite;
  Rect btnRect;
  int boxSpriteIndex = 0;
  
  ShotBox(this.game, double x, double y){
    //btnSprite = Sprite('Rectangle_13.png');
    btnRect = Rect.fromLTWH(
      x,
      y,
      game.tileSize/2,
      game.tileSize/2,
    );
  }

  void render(Canvas c){
    boxSprites[boxSpriteIndex].renderRect(c, btnRect);
  }

  void update(double t){
    if(StaticValues.missBtnTap){
      boxSpriteIndex = 2;
      StaticValues.missBtnTap = false;
    }else if(StaticValues.hitBtnTap){
      boxSpriteIndex = 1;
      StaticValues.hitBtnTap = false;
    }
  }
}