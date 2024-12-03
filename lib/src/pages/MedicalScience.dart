import 'package:flutter/material.dart';

class MedicalSciencePage extends StatefulWidget {
  @override
  _MedicalSciencePageState createState() => _MedicalSciencePageState();
}

class _MedicalSciencePageState extends State<MedicalSciencePage> {
  int _currentIndex = 0; // 当前选中的页面索引

  final List<String> departmentList = [
    "口腔科室科普",
    "日常口腔护理",
    "儿童口腔常见问题",
    "老年口腔常见问题"
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
                // 侧边栏选项
                _buildSidebarTile("口腔百科", 0),
                _buildSidebarTile("视频介绍", 1),
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
                    child: Row(
                      children: [
                        // 只在口腔百科页面显示左侧小人部分
                        if (_currentIndex == 0)
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
                                  "小人",
                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        // 右边动态内容
                        Expanded(
                          child: IndexedStack(
                            index: _currentIndex,
                            children: [
                              // 口腔百科页面
                              GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 1.5,
                                ),
                                itemCount: departmentList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = 1; // 切换到视频介绍页面
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
                              // 视频介绍页面
                              Center(
                                child: Text(
                                  '视频介绍内容加载中...',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
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
