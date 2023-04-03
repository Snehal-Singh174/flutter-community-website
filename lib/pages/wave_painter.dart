import 'package:flutter/material.dart';

class WaveHeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: CustomPaint(
        painter: _WavePainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO OUR EVENT',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: Text('REGISTER NOW'),
              style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(TextStyle(color: Colors.white)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue[700]!,
          Colors.blue[400]!,
          Colors.blue[200]!,
        ],
      ).createShader(Rect.fromLTRB(0, 0, 0, size.height));
    Path path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.35,
          size.width * 0.5, size.height * 0.45)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.55, size.width, size.height * 0.45)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) => false;
}
