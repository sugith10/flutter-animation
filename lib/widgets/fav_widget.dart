import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animationColor;
  late Animation<double?> _animationSize;
  late Animation<double> _curve;

  bool isFav = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    _animationColor =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);

    _animationSize = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 30),
        TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50),
      ],
    ).animate(_curve);

    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          isFav = true;
        }

        if (status == AnimationStatus.dismissed) {
          isFav = false;
        }
      },
    );

    // _animationController.addListener(() {
    //   print(_animationController.value);
    // });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return GestureDetector(
            onTap: () {
              isFav
                  ? _animationController.reverse()
                  : _animationController.forward();
            },
            child: Icon(
              Icons.favorite,
              color: _animationColor.value,
              size: _animationSize.value,
            ),
          );
        });
  }
}
