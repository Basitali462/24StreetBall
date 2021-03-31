import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/material.dart';
import 'package:street_ball/components/background.dart';
import 'package:street_ball/components/basket_pool.dart';
import 'package:street_ball/components/hit_button.dart';
import 'package:street_ball/components/hit_point.dart';
import 'package:street_ball/components/miss_button.dart';
import 'package:street_ball/components/player_ball.dart';
import 'package:street_ball/components/shot_box.dart';
import 'package:street_ball/components/shot_sprites.dart';
import 'package:street_ball/main.dart';
import 'package:street_ball/screen/game_over/game_over_text.dart';
import 'package:street_ball/screen/game_over/game_score_text.dart';
import 'package:street_ball/screen/game_over/reset_game_text.dart';
import 'package:street_ball/utils/static_values.dart';
import 'package:street_ball/utils/game_state.dart';

class StreetBall extends Game{
  Random rand;
  Size screenSize;
  Background bg;
  BasketPool basketPool;
  HitButton hitButton;
  MissButton missButton;
  List<PlayerBall> playerBall;
  List<HitPoint> hitPoint;
  List<ShotBox> shotBox;
  double tileSize;
  double boxPosition;
  int hitCount = 0;
  GameOverText gameOverText;
  GameScoreText gameScoreText;
  ResetGameText resetGameText;
  Set<int> setOfInts = Set();

  StreetBall(){
    initialize();
  }

  void initialize() async{
    resize(await Flame.util.initialDimensions());
    StaticValues.state = GameState.main;
    shotBox = [];
    hitPoint = [];
    playerBall = [];
    rand = Random();
    boxPosition = 0.08;
    bg = Background(this);
    basketPool = BasketPool(this);
    hitButton = HitButton(this);
    missButton = MissButton(this);
    gameOverText = GameOverText(this);
    gameScoreText = GameScoreText(this);
    resetGameText = ResetGameText(this);
    spawnTarget(StaticValues.targetToShow);
    createBoxes();
  }

  void createBoxes(){
    for(int i = 0; i < 12; i++){
      shotBox.add(ShotSprites(this, (screenSize.width - tileSize)*boxPosition, (screenSize.height/1.2) - (tileSize/4)));
      boxPosition = boxPosition + 0.08;
    }
  }

  @override
  void render(Canvas canvas) {
    bg.render(canvas);
    if(StaticValues.state == GameState.main){
      basketPool.render(canvas);
      hitButton.render(canvas);
      missButton.render(canvas);
      hitPoint.forEach((HitPoint point) => point.render(canvas));
      shotBox.forEach((ShotBox box) => box.render(canvas));
      playerBall.forEach((PlayerBall ball) => ball.render(canvas));
    }else if(StaticValues.state == GameState.over){
      gameOverText.render(canvas);
      gameScoreText.render(canvas);
      resetGameText.render(canvas);
    }
  }

  @override
  void update(double t) {
    // TODO: implement update
    if(StaticValues.state == GameState.main){
      playerBall.removeWhere((PlayerBall ball) => ball.ballDunk);
      playerBall.forEach(((PlayerBall ball) => ball.update(t)));
      hitPoint.forEach(((HitPoint point) => point.update(t)));
      hitPoint.removeWhere((HitPoint point) => point.shotHit);
      for(int i = 0; i < shotBox.length; i++){
        if(i == StaticValues.shotNumber){
          shotBox[i].update(t);
        }
      }
    }else if(StaticValues.state == GameState.over){
      gameScoreText.update(t);
      gameOverText.update(t);
      resetGameText.update(t);
    }
    if(StaticValues.nextMove && StaticValues.shotNumber < 11){
      StaticValues.nextMove = false;
      increaseSpawnPos();
    }else if(StaticValues.shotNumber >= 11 && StaticValues.state == GameState.main){
      Flame.audio.play('12_throws_completed_sfx.mp3');
      StaticValues.state = GameState.over;
    }
  }

  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width/9;
  }

  void onTapDown(TapDownDetails d){
    if(StaticValues.state == GameState.over){
      StaticValues.shotPlayed = false;
      StaticValues.missBtnTap = false;
      StaticValues.hitBtnTap = false;
      StaticValues.nextMove = false;
      StaticValues.shotNumber = -1;
      StaticValues.targetToShow = 0;
      StaticValues.gameScore = 0;
      StaticValues.xPos = 0.0;
      StaticValues.yPos = 0.0;
      main();
    }
    if(missButton.btnRect.contains(d.globalPosition)){
      missButton.onTapDown();
    }
    if(hitButton.btnRect.contains(d.globalPosition)){
      hitButton.onTapDown();
    }
  }

  void spawnTarget(int i){
    double x, y;
    switch(i){
      case 0:
        x = screenSize.width/2;
        y = screenSize.height/1.6;
        break;
      case 1:
        x = screenSize.width/2*0.3;
        y = screenSize.height/1.6;
        break;
      case 2:
        x = screenSize.width/2*1.7;
        y = screenSize.height/1.6;
        break;
      case 3:
        x = screenSize.width/2*0.3;
        y = screenSize.height/2.3;
        break;
      case 4:
        x = screenSize.width/2*1.7;
        y = screenSize.height/2.3;
        break;
      case 5:
        x = screenSize.width/2;
        y = screenSize.height/2.3;
        break;
    }
    hitPoint.add(HitPoint(this, x, y));
    playerBall.add(PlayerBall(this, x*0.95, y*1.03));
  }

  void increaseSpawnPos(){
    StaticValues.targetToShow = StaticValues.targetToShow + 1;
    if(StaticValues.targetToShow <=5){
      spawnTarget(StaticValues.targetToShow);
    }else{
      StaticValues.targetToShow = 0;
      spawnTarget(StaticValues.targetToShow);
    }
  }

}