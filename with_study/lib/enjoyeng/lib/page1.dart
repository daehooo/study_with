import 'package:enjoyeng/widgets/todo_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'navigator_exam.dart';


class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  void _navigateToExample(BuildContext context, String exampleTitle) {
    Navigator.push(
      context,
      Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoPageRoute(
              builder: (context) => ExamplePage(title: exampleTitle),
            )
          : MaterialPageRoute(
              builder: (context) => ExamplePage(title: exampleTitle),
            ),
    );
  }

  void _showScreen(Widget widget){
    Navigator.push(
      context,
      Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoPageRoute(
              builder: (context) => widget,
            )
          : MaterialPageRoute(
              builder: (context) => widget,
            ),
    );
  
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예제목록'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('예제1'),
            onTap: () => _navigateToExample(context, '예제1'),
          ),
          ListTile(
            title: Text('예제2'),
            onTap: () => _navigateToExample(context, '예제2'),
          ),
          ListTile(
            title: Text('예제3'),
            onTap: () => _navigateToExample(context, '예제3'),
          ),
          ListTile(
            title: Text('예제4'),
            onTap: () => _showScreen(FirstScreen()),
          ),
          ListTile(
            title: Text('예제5'),
            onTap: () => _showScreen(TodoListView()),
          ),
        ],
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  final String title;

  ExamplePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Theme.of(context).platform == TargetPlatform.iOS
                ? Icons.arrow_back_ios
                : Icons.arrow_back,
          ),
        ),
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title 화면',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
/*

      예제 목록 

예제1
예제2
예제3
.....

예제1을 누르면 새로운 화면으로 이동하는데. 화면 전체 크기로 보여주고 싶고, 그 화면 좌측 상단엔 이전 화면으로 돌아가는 '< '버튼이 있고 싶다.


- StatefulWidget
   - PlatformScaffold
     - PlatformAppBar
       - Text ('예제목록')
      - SizedBox
          - Column( children: [ Text ('예제1'), Text('예제2'), Text('예제3') ] )



*/