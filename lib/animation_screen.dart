import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _equalizerController;
  late AnimationController _progressController;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _equalizerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 180),
    );
  }

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;

      if (isPlaying) {
        _rotationController.repeat();
        _equalizerController.repeat();
        _progressController.forward();
      } else {
        _rotationController.stop();
        _equalizerController.stop();
        _progressController.stop();
      }
    });
  }

  Widget equalizerBar(int index) {
    return AnimatedBuilder(
      animation: _equalizerController,
      builder: (context, child) {
        final height = 15 +
            35 *
                (0.5 +
                    0.5 *
                        math.sin(
                          _equalizerController.value * 2 * math.pi +
                              index,
                        ));

        return Container(
          width: 7,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF6C4AB6),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _equalizerController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FC),
      appBar: AppBar(
        title: const Text('Music Animation'),
        backgroundColor: const Color(0xFF6C4AB6),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                'NOW PLAYING',
                style: TextStyle(
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C4AB6),
                ),
              ),
              const SizedBox(height: 30),

              RotationTransition(
                turns: _rotationController,
                child: Container(
                  width: 230,
                  height: 230,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(0xFF333333),
                        Color(0xFF111111),
                        Color(0xFF555555),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF6C4AB6),
                      ),
                      child: const Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Neeli Meghamulalo',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Your Favourite Music',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  7,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: equalizerBar(index),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              AnimatedBuilder(
                animation: _progressController,
                builder: (context, child) {
                  return Column(
                    children: [
                      Slider(
                        value: _progressController.value,
                        onChanged: (value) {
                          _progressController.value = value;
                        },
                        activeColor: const Color(0xFF6C4AB6),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0:00'),
                          Text('3:00'),
                        ],
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 75,
                height: 75,
                decoration: const BoxDecoration(
                  color: Color(0xFF6C4AB6),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: togglePlay,
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                isPlaying ? 'Playing Animation' : 'Tap to Play',
                style: const TextStyle(
                  color: Color(0xFF6C4AB6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}