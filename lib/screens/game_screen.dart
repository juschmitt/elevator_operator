import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game_state.dart';
import '../widgets/building_widget.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  Duration _prevElapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameStateProvider.notifier).startGame();
      _ticker = createTicker(_onTick)..start();
    });
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  void _onTick(Duration curElapsed) {
    final Duration deltaTime = curElapsed - _prevElapsed;
    _prevElapsed = curElapsed;

    ref.read(gameStateProvider.notifier).tick(deltaTime);
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Elevator Operator - Score: ${gameState.score}'),
      ),
      body: Stack(
        // Use Stack for layering
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Expanded(flex: 3, child: BuildingWidget())],
            ),
          ),
          // --- Game Over Overlay ---
          if (gameState.isGameOver)
            Positioned.fill(
              child: Container(
                color: Colors.black.withAlpha((255 * 0.7).round()),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Game Over',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: Colors.redAccent),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Final Score: ${gameState.score}',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 40), // Add some space
                      ElevatedButton(
                        onPressed: () {
                          _ticker?.stop();
                          ref.read(gameStateProvider.notifier).resetGame();
                          _prevElapsed = Duration.zero;
                          _ticker?.start();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey, // Button color
                          foregroundColor: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        child: Text('Restart Game'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
