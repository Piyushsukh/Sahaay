import 'dart:math';
import 'package:flutter/material.dart';

class FloatingTextBackground extends StatefulWidget {
  final Widget child;

  const FloatingTextBackground({super.key, required this.child});

  @override
  State<FloatingTextBackground> createState() => _FloatingTextBackgroundState();
}

class _FloatingTextBackgroundState extends State<FloatingTextBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> floatingWords = [
    'Hope',
    'Light',
    'Growth',
    'Enough',
    'Balance',
    'Calm',
    'Worthy',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFloatingText(String word, int index) {
    final random = Random(index);
    final top = random.nextDouble() * 600;
    final left = random.nextDouble() * 300;
    final fontSize = 14 + random.nextDouble() * 10;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final offsetY = sin(_controller.value * 2 * pi + index) * 10;
        final offsetX = cos(_controller.value * 2 * pi + index) * 10;

        return Positioned(
          top: top + offsetY,
          left: left + offsetX,
          child: Opacity(
            opacity: 0.1 + random.nextDouble() * 0.2,
            child: Text(
              word,
              style: TextStyle(
                fontSize: fontSize,
                color: const Color.fromARGB(255, 24, 153, 140),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...floatingWords.asMap().entries.map(
          (entry) => _buildFloatingText(entry.value, entry.key),
        ),
        widget.child,
      ],
    );
  }
}
