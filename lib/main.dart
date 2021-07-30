import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  var game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGame extends BaseGame {
  final turret = SpriteComponent();
  final ship = SpriteComponent();
  final turretSpeed = 0.25;
  final shipSpeed = .5;

  Future<void> onLoad() async {
    turret
      ..sprite = await loadSprite('turret.png')
      ..size = Vector2(200, 200)
      ..position = Vector2(200, 200)
      ..anchor = Anchor.center;
    add(turret);

    ship
      ..sprite = await loadSprite('ship.png')
      ..size = Vector2(200, 200)
      ..position = Vector2(500, 300)
      ..anchor = Anchor.center;
    add(ship);
  }

  @override
  void update(double dt) {
    super.update(dt);
    turret.angle += turretSpeed * dt;
    turret.angle %= 2 * math.pi;

    ship.angle += shipSpeed * dt * -1;
    ship.angle %= 2 * math.pi;
  }
}
