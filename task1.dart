import 'package:flutter/material.dart';

class MyAnimatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedHomePage extends StatefulWidget {
  @override
  _AnimatedHomePageState createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool _isVisible = true;

  void _changeContainerProperties() {
    setState(() {
      _width = _width == 200 ? 300 : 200;
      _height = _height == 200 ? 100 : 200;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
      _borderRadius =
          _borderRadius == BorderRadius.circular(8)
              ? BorderRadius.circular(40)
              : BorderRadius.circular(8);
    });
  }

  void _toggleOpacity() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Widgets Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeContainerProperties,
              child: Text('Animate Container'),
            ),
            SizedBox(height: 40),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                'This is animated text!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleOpacity,
              child: Text(_isVisible ? 'Hide Text' : 'Show Text'),
            ),
          ],
        ),
      ),
    );
  }
}
