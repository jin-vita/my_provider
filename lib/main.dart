import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => User(),
        ),
      ],
      child: const MaterialApp(
        home: MyHomePage(title: '내가 만든 앱'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void changeName(String name) {
    User user = Provider.of(context, listen: false);
    user.count ??= 0;
    var count = user.count! + 1;
    user.applyData(name: name, count: count);
  }

  @override
  void initState() {
    super.initState();

    print('initState 호출 됨');

    User user = Provider.of<User>(context, listen: false);
    user.setData(
      name: '미정',
      count: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.yellow,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Consumer<User>(
                builder: (context, data, child) {
                  return Text(
                    '이름 : ${data.name}\n클릭 수 : ${data.count}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 18,
                ),
                label: const Text('확인'),
                onPressed: () {
                  changeName('홍길동');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
