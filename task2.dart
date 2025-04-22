import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationExample());
  }
}

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Tween
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    // Create a Tween to animate from 0.0 to 1.0 (left to right)
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Add a listener to rebuild the widget whenever the animation updates
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  // Toggle the animation on button press
  void _toggleAnimation() {
    if (_isAnimating) {
      _controller.stop();
    } else {
      _controller.forward();
    }
    setState(() {
      _isAnimating = !_isAnimating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimationController Example")),
      body: Center(
        child: Stack(
          children: [
            // Animated position of the container
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  left: MediaQuery.of(context).size.width * _animation.value,
                  top: 100.0,
                  child: child!,
                );
              },
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
            // Button to start/stop the animation
            Positioned(
              bottom: 50.0,
              left: 100.0,
              child: ElevatedButton(
                onPressed: _toggleAnimation,
                child: Text(
                  _isAnimating ? "Stop Animation" : "Start Animation",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
