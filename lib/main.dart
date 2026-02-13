import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyWidget());
}

class CircularLayout extends StatelessWidget {
  final double radius;
  final List<Widget> children;

  const CircularLayout({required this.radius, required this.children, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // The container needs to be large enough to hold the circle
      width: radius * 2 + 100, // +100 for button padding
      height: radius * 2 + 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Optional: A circle in the background to show the ring
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, // Color of the ring
                width: 2, // Thickness of the line
              ),
            ),
          ),

          // The buttons
          ...children.asMap().entries.map((entry) {
            final index = entry.key;
            final child = entry.value;

            // 1. Calculate the angle for this specific item
            // 2 * pi is a full circle (360 degrees)
            final double angle = (2 * pi * index) / children.length;

            // 2. Use Sine and Cosine to find the X and Y position
            // We subtract pi/2 to start at the top (12 o'clock) instead of right (3 o'clock)
            final double x = radius * cos(angle - pi / 2);
            final double y = radius * sin(angle - pi / 2);

            return Transform.translate(offset: Offset(x, y), child: child);
          }),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  // Class that creates the widget
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    currentImageName = getRandomNote();
    feedback2 = "Choose the correct note";
  }

  Color feedbackColor = Colors.black;
  String currentLetter = "";
  String currentImageName = "";
  String feedback2 = "";
  final random = Random();

  String getRandomNote() {
    int value = random.nextInt(17);
    switch (value) {
      case 0:
        return "a4";
      case 1:
        return "a5";
      case 2:
        return "b4";
      case 3:
        return "b5";
      case 4:
        return "c3";
      case 5:
        return "c4";
      case 6:
        return "c5";
      case 7:
        return "d3";
      case 8:
        return "d4";
      case 9:
        return "d5";
      case 10:
        return "e3";
      case 11:
        return "e4";
      case 12:
        return "e5";
      case 13:
        return "f3";
      case 14:
        return "g4";
      case 15:
        return "g3";
      case 16:
        return "g4";
      default:
        return "";
    }
  }

  void checkAnswer() {
    String correctAnswer = currentImageName[0].toUpperCase();

    setState(() {
      if (currentLetter == correctAnswer) {
        feedback2 = "That is correct!";
        feedbackColor = Colors.green;
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            setState(() {
              currentImageName = getRandomNote();
              feedback2 = "Choose the correct note";
              feedbackColor = Colors.black;
            });
          }
        });
      } else {
        feedback2 = "Try again!";
        feedbackColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/alto_clef/$currentImageName.png',
                        width: 320,
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Text(
                          feedback2,
                          style: TextStyle(
                            fontSize: 24,
                            color: feedbackColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: Colors.amber[50],
                child: CircularLayout(
                  radius: 120, // How big the circle is
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "A";
                          checkAnswer();
                        });
                      },
                      child: Text("A"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "B";
                          checkAnswer();
                        });
                      },
                      child: Text("B"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "C";
                          checkAnswer();
                        });
                      },
                      child: Text("C"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "D";
                          checkAnswer();
                        });
                      },
                      child: Text("D"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "E";
                          checkAnswer();
                        });
                      },
                      child: Text("E"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "F";
                          checkAnswer();
                        });
                      },
                      child: Text("F"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        setState(() {
                          currentLetter = "G";
                          checkAnswer();
                        });
                      },
                      child: Text("G"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
