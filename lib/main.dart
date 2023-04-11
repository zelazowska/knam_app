import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonsApp());
}

class ButtonsApp extends StatelessWidget {
  const ButtonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Help me change colors!',
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              RainbowButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class RainbowButton extends StatefulWidget {
  const RainbowButton({super.key});

  @override
  State<RainbowButton> createState() => RainbowButtonState();
}

class RainbowButtonState extends State<RainbowButton> {
  static const _colorArray = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
  ];

  var colorIndex = 0;

  void pressedCallback() => setState(() {
        // color index was reset to 0 eveyr time build was called in build
        // hence it should be in rainbowButtonState class
        colorIndex == _colorArray.length ? colorIndex = 0 : colorIndex++;
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
        onPressed: pressedCallback,
        backgroundColor: _colorArray[colorIndex],
        child: const Icon(
          Icons.looks_outlined,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
