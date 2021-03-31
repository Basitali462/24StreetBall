import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:street_ball/screen/ball_game.dart';
import 'package:street_ball/utils/game_state.dart';
import 'package:street_ball/utils/static_values.dart';

class MissButton{
  final StreetBall game;
  Sprite btnSprite;
  Rect btnRect;
  double btnWidth;
  double btnHeight;
  double screenHalfWidth;

  MissButton(this.game){
    btnSprite = Sprite('miss_bttn.png');
    btnWidth = game.tileSize*3;
    btnHeight = game.tileSize*1.2;
    screenHalfWidth = game.screenSize.width/2;
    btnRect = Rect.fromLTWH(
      (screenHalfWidth - btnWidth/2) - (screenHalfWidth)/2.5,
      game.screenSize.height/1.1 - btnHeight/2,
      btnWidth,
      btnHeight,
    );
  }

  void render(Canvas c){
    btnSprite.renderRect(c, btnRect);
  }

  void update(double t){}

  void onTapDown(){
    if(!StaticValues.shotPlayed && StaticValues.shotNumber < 11 && StaticValues.state == GameState.main){
      Flame.audio.play('miss_button_sfx.mp3');
      StaticValues.shotPlayed = true;
      StaticValues.missBtnTap = true;
      StaticValues.shotNumber = StaticValues.shotNumber + 1;
    }
  }
}