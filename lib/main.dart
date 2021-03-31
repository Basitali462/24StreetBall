import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:street_ball/screen/ball_game.dart';

void main() {
  runApp(StreetBall().widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = StreetBall().onTapDown;
  flameUtil.addGestureRecognizer(tapper);

  Flame.images.loadAll([
    'background.png',
    'basket.png',
    'miss_bttn.png',
    'ok_bttn.png',
    'Rectangle_13.png',
    'ok_box.png',
    'miss_box.png',
    'ball_with_shadow.png',
    'target.png',
  ]);

  Flame.audio.loadAll([
    '12_throws_completed_sfx.mp3',
    'hit_button_sfx.mp3',
    'miss_button_sfx.mp3',
  ]);
}
