import 'package:adaptive_divider/adaptive_divider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text('This is a horizontal divider'),
              AdaptiveDivider(
                radius: 8,
                thickness: 3,
                color: Colors.amber,
              ),
              Row(
                children: [
                  Text('This is a vertical divider'),
                  AdaptiveDivider(
                    radius: 8,
                    crossAxisExtent: 10,
                    thickness: 3,
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}