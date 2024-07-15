import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import '../model/test_model.dart';
import '../widget/button_widget.dart';
import '../model/result_card_model.dart';
import '../widget/ad_widget.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // semi-transparent black background
      body: Center(
        child: CircularProgressIndicator(), // circular loading indicator
      ),
    );
  }
}


class TestWidget extends StatefulWidget {
  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int currentQuestionIndex = 0;
  List<dynamic> mbti_count = [];
  bool isImageLoaded = false;
  bool isResultPageLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Use precacheImage to load the image before rendering the widget
    precacheImage(AssetImage('assets/images/test_background.png'), context)
        .then((_) {
      setState(() {
        isImageLoaded = true;
      });
    });
  }


  Future<void> navigateToResultPage(BuildContext context) async {
    setState(() {
      isResultPageLoading = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the overlay by tapping outside
      builder: (BuildContext context) {
        return LoadingOverlay();
      },
    );
    await Future.delayed(Duration(seconds: 1));

    int iCount = mbti_count.where((element) => element == 'i').length;
    int sCount = mbti_count.where((element) => element == 's').length;
    int tCount = mbti_count.where((element) => element == 't').length;
    int jCount = mbti_count.where((element) => element == 'j').length;
    int eCount = mbti_count.where((element) => element == 'e').length;
    int nCount = mbti_count.where((element) => element == 'n').length;
    int fCount = mbti_count.where((element) => element == 'f').length;
    int pCount = mbti_count.where((element) => element == 'p').length;

    if (iCount >= 2 && sCount >= 2 && tCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ISTJ_result()),
      );
    } else if (iCount >= 2 && sCount >= 2 && fCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ISFJ_result()),
      );
    } else if (iCount >= 2 && nCount >= 2 && fCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => INFJ_result()),
      );
    } else if (iCount >= 2 && nCount >= 2 && tCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => INTJ_result()),
      );
    } else if (iCount >= 2 && sCount >= 2 && tCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ISTP_result()),
      );
    } else if (iCount >= 2 && sCount >= 2 && fCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ISFP_result()),
      );
    } else if (iCount >= 2 && nCount >= 2 && fCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => INFP_result()),
      );
    } else if (iCount >= 2 && nCount >= 2 && tCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => INTP_result()),
      );
    } else if (eCount >= 2 && sCount >= 2 && tCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ESTP_result()),
      );
    } else if (eCount >= 2 && sCount >= 2 && fCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ESFP_result()),
      );
    } else if (eCount >= 2 && nCount >= 2 && fCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ENFP_result()),
      );
    } else if (eCount >= 2 && nCount >= 2 && tCount >= 2 && pCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ENTP_result()),
      );
    } else if (eCount >= 2 && sCount >= 2 && tCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ESTJ_result()),
      );
    } else if (eCount >= 2 && sCount >= 2 && fCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ESFJ_result()),
      );
    } else if (eCount >= 2 && nCount >= 2 && fCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ENFJ_result()),
      );
    } else if (eCount >= 2 && nCount >= 2 && tCount >= 2 && jCount >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ENTJ_result()),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    if (!isImageLoaded) {
      return LoadingOverlay();
    }

    Question currentQuestion = questionsList[currentQuestionIndex];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/test_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: 260,
                    child: Image.asset('assets/images/title.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: FAProgressBar(
                            size: 20,
                            currentValue: ((currentQuestionIndex) / questionsList.length) * 100,
                            direction: Axis.horizontal,
                            backgroundColor: Colors.grey.withOpacity(0.6),
                            progressGradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color(0xFFA3E9FD),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(width: 10), // 조절 가능한 간격
                        Text(
                          '${currentQuestionIndex}/${questionsList.length}', // 현재 인덱스를 표시
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
                          child: Text(
                            currentQuestion.question,
                            style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: 'Pretendard'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(
                            "Q",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: QuestionButton(
                      label: currentQuestion.option1,
                      onPressed: () {
                        setState(() {
                          mbti_count.add(currentQuestion.option1_answer);
                          currentQuestionIndex += 1;
                          if (currentQuestionIndex == 12) {
                            navigateToResultPage(context);
                          }
                        }
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: QuestionButton(
                      label: currentQuestion.option2,
                      onPressed: () {
                        setState(() {
                          mbti_count.add(currentQuestion.option2_answer);
                          currentQuestionIndex += 1;
                          if (currentQuestionIndex == 12) {
                            navigateToResultPage(context);
                          }
                        }
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 50,),
                  AdWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


