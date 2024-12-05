import 'package:flutter/material.dart';
import 'More.dart'; // 导入新的More页面

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SymptomCheckPage(),
    );
  }
}

class SymptomCheckPage extends StatefulWidget {
  @override
  _SymptomCheckPageState createState() => _SymptomCheckPageState();
}

class _SymptomCheckPageState extends State<SymptomCheckPage> {
  List<String> selectedSymptoms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Check'),
      ),
      body: Stack(
        children: [
          // 主体内容
          Center(
            child: Stack(
              children: [
                // 头部图片
                Center(
                  child: Image.asset(
                    'assets/head.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                // 口腔指示
                Positioned(
                  left: 550,
                  top: 400,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MorePage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CustomPaint(
                          size: Size(30, 30),
                          painter: ArrowPainter(),
                        ),
                        SizedBox(width: 5),
                        Text('口腔'),
                      ],
                    ),
                  ),
                ),
                // 腮腺指示
                Positioned(
                  left: 520,
                  top: 380,
                  child: GestureDetector(
                    onTap: () {
                      _showSymptomOptions(context, '腮腺');
                    },
                    child: Row(
                      children: [
                        CustomPaint(
                          size: Size(30, 30),
                          painter: ArrowPainter(),
                        ),
                        SizedBox(width: 5),
                        Text('腮腺'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 底部选择区域
          Positioned(
            left: 20,
            right: 120,
            bottom: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
               constraints: BoxConstraints(
              maxWidth: 200, // 修改部分：设置最大宽度为300
              ),
              child: Text('选项: ${selectedSymptoms.join(', ')}'),
            ),
          ),
          // 完成选择按钮
          Positioned(
            right: 20,
            bottom: 20,
            child: ElevatedButton(
              onPressed: () {
                // 处理完成选择的逻辑
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DepartmentSelection(option: selectedSymptoms.join(', ')),
                  ),
                );
              },
              child: Text('完成选择'),
            ),
          ),
        ],
      ),
    );
  }

  void _showSymptomOptions(BuildContext context, String area) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              title: Text('痛'),
              onTap: () {
                _addSelection('腮腺痛');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('肿'),
              onTap: () {
                _addSelection('腮腺肿');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('分泌物'),
              onTap: () {
                _addSelection('腮腺分泌物');
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  void _addSelection(String symptom) {
    setState(() {
      if (!selectedSymptoms.contains(symptom)) {
        selectedSymptoms.add(symptom);
      }
    });
  }

  void _handleCompleteSelection() {
    // 在这里处理完成选择按钮的逻辑，比如提交数据或显示确认信息
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('已完成选择'),
          content: Text('您选择的症状有: ${selectedSymptoms.join(', ')}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 5, size.height / 2 - 5);
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width - 5, size.height / 2 + 5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DepartmentSelection extends StatelessWidget {
  final String option;

  DepartmentSelection({required this.option});

  @override
  Widget build(BuildContext context) {
    String message;
    switch (option) {
      case '腮腺痛':
        message = '您选择的症状是腮腺痛。';
        break;
      case '腮腺肿':
        message = '您选择的症状是腮腺肿。';
        break;
      case '腮腺分泌物':
        message = '您选择的症状是腮腺分泌物。';
        break;
      default:
        message = '未知症状。';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('选项结果'),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}