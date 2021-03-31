import 'package:flame/sprite.dart';
import 'package:street_ball/components/shot_box.dart';
import 'package:street_ball/screen/ball_game.dart';

class ShotSprites extends ShotBox{
  ShotSprites(StreetBall game, double x, double y) : super(game,x,y){
    boxSprites = [];
    boxSprites.add(Sprite('Rectangle_13.png'));
    boxSprites.add(Sprite('ok_box.png'));
    boxSprites.add(Sprite('miss_box.png'));
  }
}