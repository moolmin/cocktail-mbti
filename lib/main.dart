import 'package:flutter/material.dart';
import 'package:cocktail_mbti/widget/test_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Pretendard',
      ),
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    // 여기에서 로딩 작업을 수행하거나 다음 화면으로 이동하기 전에 작업을 수행할 수 있습니다.
    _navigateToHomeScreen();
  }

  // 로딩 화면을 표시하고 일정 시간 후에 HomeScreen으로 이동하는 함수
  void _navigateToHomeScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWaveSpinner(
              color: Colors.blue, // 로딩 애니메이션 색상
              size: 70.0, // 로딩 애니메이션 크기
            ),
            SizedBox(height: 20),
            Text(
              'LOADING',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_background.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 100),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestWidget()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/start_button.png',
                    width: 165,
                    height: 100,
                  ),
                ),
              ),
              // SpinKitPouringHourGlassRefined(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

