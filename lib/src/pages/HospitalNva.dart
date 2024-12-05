import 'package:flutter/material.dart';

class HospitalNvaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Navigation'),
      ),
      body: Center(
        child: Align(
          alignment: Alignment(0.0, -0.5), // 设置Y轴偏移量为-0.5，即偏上
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              '请选择诊室：',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}