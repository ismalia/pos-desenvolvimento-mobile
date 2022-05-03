import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';

const double groundHeight = 32;

class BusRunGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    // Player
    final playerSpriteSheet = SpriteSheet(
      image: await images.load('DinoSprites - tard.png'),
      srcSize: Vector2(24, 24),
    );

    final spriteSize = Vector2(50, 50);

    final idleAnimation = playerSpriteSheet.createAnimation(row: 0, from: 0, to: 3, stepTime: 0.1);
    final runAnimation = playerSpriteSheet.createAnimation(row: 0, from: 4, to: 10, stepTime: 0.1);

    final playerComponent = SpriteAnimationComponent(
      animation: runAnimation,
      size: spriteSize,
    );

    playerComponent.height = playerComponent.width = size.x / 10;
    playerComponent.x = playerComponent.width;
    playerComponent.y = size.y - groundHeight - playerComponent.height + 10;

    // Parallax
    final parallaxLayer1 = await loadParallaxLayer(
      ParallaxImageData('parallax/plx-1.png'),
    );

    final parallaxLayer2 = await loadParallaxLayer(
      ParallaxImageData('parallax/plx-2.png'),
    );

    final parallaxLayer3 = await loadParallaxLayer(
      ParallaxImageData('parallax/plx-3.png'),
    );

    final parallaxLayer4 = await loadParallaxLayer(
      ParallaxImageData('parallax/plx-4.png'),
    );

    final parallaxLayer5 = await loadParallaxLayer(
      ParallaxImageData('parallax/plx-5.png'),
    );

    final parallaxLayer6 = await loadParallaxLayer(
      ParallaxImageData('parallax/plx-6.png'),
      fill: LayerFill.none,
    );

    final parallax = Parallax([
      parallaxLayer1,
      parallaxLayer2,
      parallaxLayer3,
      parallaxLayer4,
      parallaxLayer5,
      parallaxLayer6,
    ],
    baseVelocity: Vector2(100, 0),
    );

    final parallaxComponent = ParallaxComponent(
      parallax: parallax,
      
    );

    add(parallaxComponent);
    add(playerComponent);

    return super.onLoad();
  }
}