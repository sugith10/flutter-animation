import 'package:flutter/material.dart';

class SampelScreen extends StatefulWidget {
  const SampelScreen({super.key});

  @override
  State<SampelScreen> createState() => _SampelScreenState();
}

class _SampelScreenState extends State<SampelScreen> {
  bool _state = false;
  double _margin = 0;
  double _width = 250;
  Color _color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          color: _color,
          margin: EdgeInsets.all(_margin),
          width: _width,
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      if (_state) {
                        _margin = 50;
                        _color = Colors.yellow;
                        _width = 300;
                        _state = !_state;
                      } else {
                        _margin = 0;
                        _color = Colors.red;
                        _width = 250;
                        _state = !_state;
                      }
                    },
                  );
                },
                child: const Text("Animate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
