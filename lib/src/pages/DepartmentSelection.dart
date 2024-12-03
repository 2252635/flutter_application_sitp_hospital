import 'package:flutter/material.dart';

class DepartmentSelectionPage extends StatefulWidget {
  @override
  _DepartmentSelectionPageState createState() => _DepartmentSelectionPageState();
}

class _DepartmentSelectionPageState extends State<DepartmentSelectionPage> {
  int _currentIndex = 0; // 当前选中的页面索引
  bool isDepartmentSelected = false; // 判断是否选择了科室
  bool isTreatmentSelected = false; // 判断是否选择了诊疗项目

  final List<String> departmentList = [
    "正畸",
    "修复",
    "牙体牙髓",
    "口腔颌面外科",
    "儿童口腔",
    "种植",
    "牙园",
    "洁牙中心",
    "黏膜"
  ];

  final List<String> treatmentList = [
    "洗牙",
    "口腔健康检查",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 侧边栏
          Container(
            width: 200, // 侧边栏宽度
            color: Colors.grey[200],
            child: Column(
              children: [
                // 显示医院 logo
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/logo.png', // logo 的路径
                    height: 80, // 调整 logo 高度
                  ),
                ),
                SizedBox(height: 50),
                _buildSidebarTile("诊室选择", 0),
                _buildSidebarTile("诊疗项目", 1),
                _buildSidebarTile("注意事项", 2),
              ],
            ),
          ),
          // 主内容区域
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题和返回按钮
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Row(
                        children: [
                          Text("2024-12-01 | 12:45 PM | 晴天",
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 16),
                          DropdownButton<String>(
                            value: '中文',
                            underline: SizedBox(),
                            items: <String>['中文', 'English'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // 切换语言逻辑
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // 动态内容区域
                  Expanded(
                    child: IndexedStack(
                      index: _currentIndex,
                      children: [
                        // 主内容区布局（科室选择）
                        Row(
                          children: [
                            // 左边小人部分
                            Container(
                              width: 150, // 左侧小人宽度
                              margin: EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/character.png', // 小人图片路径
                                    height: 150, // 调整小人图片高度
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    isDepartmentSelected
                                        ? "已选择科室，点击进入诊疗项目"
                                        : "请选择您本次就诊的科室",
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            // 右边科室选择
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, // 每行显示4个选择项
                                  crossAxisSpacing: 16.0, // 网格横向间距
                                  mainAxisSpacing: 16.0, // 网格纵向间距
                                  childAspectRatio: 1.5, // 每个网格的宽高比
                                ),
                                itemCount: departmentList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = 1; // 跳转到诊疗项目页面
                                        isDepartmentSelected = true; // 标记已选择科室
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: Center(
                                        child: Text(
                                          departmentList[index],
                                          style: TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // 诊疗项目页面
                        Row(
                          children: [
                            // 左边小人部分
                            Container(
                              width: 150, // 左侧小人宽度
                              margin: EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/character.png', // 小人图片路径
                                    height: 150, // 调整小人图片高度
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    isTreatmentSelected
                                        ? "已选择诊疗项目，点击确认"
                                        : "请选择您本次就诊的主要治疗",
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            // 右边诊疗项目选择
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 每行显示2个选择项
                                  crossAxisSpacing: 16.0, // 网格横向间距
                                  mainAxisSpacing: 16.0, // 网格纵向间距
                                  childAspectRatio: 1.5, // 每个网格的宽高比
                                ),
                                itemCount: treatmentList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isTreatmentSelected = true; // 标记已选择诊疗项目
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: Center(
                                        child: Text(
                                          treatmentList[index],
                                          style: TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // 注意事项页面
                        Center(
                          child: Text(
                            '注意事项内容加载中...',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarTile(String title, int index) {
    return Container(
      color: _currentIndex == index ? Colors.blue[100] : Colors.transparent,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: _currentIndex == index ? Colors.blue : Colors.black,
            fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
