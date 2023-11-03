import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final log = Logger('LoggingExample');
void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '支付宝'),
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
  int selectedIndex = 1;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('现在就听',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2)),
                    Icon(
                      Icons.person_outline_rounded,
                      color: Color.fromRGBO(244, 50, 73, 1),
                      size: 50,
                    ),
                  ]),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Row(
                    children: [
                      Text(
                        '精选推荐',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2),
                      ),
                    ],
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('最近添加',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 122, 122, 122),
                      )),
                  Text('专属推荐',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 122, 122, 122),
                      )),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/today.png',
                              width: 160,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10, // 水平间距10px
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/today.png',
                              width: 160,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10, // 水平间距10px
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/today.png',
                              width: 160,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ))),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          log.info('点击了最近播放');
                        },
                        child: const Text(
                          '最近播放',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 2),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          log.info('点击了最近播放');
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        color: const Color.fromARGB(255, 141, 140, 145),
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/today.png',
                          width: 160,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10, // 水平间距10px
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/today.png',
                          width: 160,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10, // 水平间距10px
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/today.png',
                          width: 160,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_circle,
            ),
            label: '现在就听',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_compact_alt_rounded,
            ),
            label: '浏览',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.broadcast_on_personal_outlined,
            ),
            label: '广播',
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: const Color(0XFF837d7f),
        selectedItemColor: const Color(0Xfff42f43),
        onTap: onItemTapped,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
