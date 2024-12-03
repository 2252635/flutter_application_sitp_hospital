import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页面'),
      ),
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter: HumanFigurePainter(),
            ),
          ),
          Positioned(
            left: 100,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/hospitalNva');
              },
              child: Text('院内导航'),
            ),
          ),
          Positioned(
            right: 100,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/departmentSelection');
              },
              child: Text('健康追踪管理'),
            ),
          ),
          Positioned(
            left: 90,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/symptomCheck');
              },
              child: Text('智能问诊'),
            ),
          ),
          Positioned(
            right: 90,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/medicalScience');
              },
              child: Text('口腔科普'),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text('点击屏幕与我互动吧!', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class HumanFigurePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(size.width / 2, size.height / 4), 30, paint);

    canvas.drawLine(
      Offset(size.width / 2, size.height / 4 + 30),
      Offset(size.width / 2, size.height / 2 + 30),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2 - 50, size.height / 3),
      Offset(size.width / 2 + 50, size.height / 3),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, size.height / 2 + 30),
      Offset(size.width / 2 - 50, size.height / 2 + 100),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2 + 30),
      Offset(size.width / 2 + 50, size.height / 2 + 100),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}