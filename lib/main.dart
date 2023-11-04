import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final log = Logger('LoggingExample');
void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
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
      home: const MyHomePage(title: 'AppMusic'),
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
  // 选中的图标
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  Image todayPic = Image.asset(
    'images/today.png',
    width: 300,
    fit: BoxFit.cover,
  );
  void onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void onRecentPlayPressed() {
    log.info('最近播放按钮点击');
  }

  bool isPlaying = true;
  void onPlayPressed() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  get playStateIcon {
    if (isPlaying) {
      return const Icon(
        Icons.pause_rounded,
        color: Colors.white,
        size: 40,
      );
    } else {
      return const Icon(
        Icons.play_arrow_rounded,
        color: Colors.white,
        size: 40,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: [
          Stack(children: [
            ListView(children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: const Row(
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
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('最新发行',
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
              ),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                      height: 400,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          const SizedBox(
                            width: 15, // 水平间距10px
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: todayPic,
                          ),
                          const SizedBox(
                            width: 10, // 水平间距10px
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: todayPic,
                          ),
                          const SizedBox(
                            width: 10, // 水平间距10px
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: todayPic,
                          )
                        ],
                      ))),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        onPressed: onRecentPlayPressed,
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
                        style: const ButtonStyle(
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.only(top: 3)),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: onRecentPlayPressed,
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 17,
                        ),
                        color: const Color.fromARGB(255, 141, 140, 145),
                      ),
                    ],
                  )),
              const SizedBox(height: 10),
              SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const SizedBox(
                        width: 15, // 水平间距10px
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: todayPic,
                      ),
                      const SizedBox(
                        width: 10, // 水平间距10px
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: todayPic,
                      ),
                      const SizedBox(
                        width: 10, // 水平间距10px
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: todayPic,
                      )
                    ],
                  )),
            ]),
            Positioned(
              bottom: 0,
              left: 10,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 50,
                      color: const Color.fromARGB(193, 34, 32, 32),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: todayPic,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Love Like This',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: onPlayPressed,
                              icon: playStateIcon),
                          const Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ]),
          placeHolderPage('浏览页'),
          placeHolderPage('广播页'),
          placeHolderPage('资料库页'),
          placeHolderPage('搜索页'),
        ][currentPageIndex],
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.black),
            child: BottomNavigationBar(
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
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.music_video_rounded,
                    ),
                    label: '资料库',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: '搜索',
                  ),
                ],
                currentIndex: currentPageIndex,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                unselectedItemColor: const Color(0XFF837d7f),
                selectedItemColor: const Color(0Xfff42f43),
                onTap: onItemTapped,
                backgroundColor: const Color.fromARGB(147, 0, 0, 0),
                landscapeLayout: BottomNavigationBarLandscapeLayout.centered)));
  }
}

// 占位页
Widget placeHolderPage(String pageName) {
  return Center(
    child: Text(
      pageName,
      style: const TextStyle(color: Colors.white, fontSize: 40),
    ),
  );
}
