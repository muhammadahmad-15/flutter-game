import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: BrickBreaker()));
}

class BrickBreaker extends FlameGame {
  SpriteComponent tile = SpriteComponent();
  List<SpriteComponent> bricks = [];

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    await loadBricks();

    tile
      ..sprite = await loadSprite("tile.png")
      ..size = Vector2(size.x * 0.4, 30)
      ..anchor = Anchor.center
      ..x = size.x / 2
      ..y = size.y / 1.1;

    add(tile);

    for (final brick in bricks) {
      add(brick);
    }
  }

  Future<void> loadBricks() async {
    for (int i = 1; i <= 10; i++) {
      final brick = SpriteComponent()
        ..sprite = await loadSprite("brick-$i.png")
        ..size = Vector2(50, 20) // Set your brick size
        ..position = Vector2(i * 60, 50); // Adjust position as needed
      bricks.add(brick);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Add game logic here, e.g., paddle movement, ball collision, scoring, etc.
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Render game objects, e.g., bricks, paddle, ball, score, etc.
  }
}
