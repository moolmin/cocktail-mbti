import 'package:cocktail_mbti/widget/test_widget.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:share_plus/share_plus.dart';
import 'package:flip_card/flip_card.dart';


class ReusableResultWidget extends StatelessWidget {
  final String imageUrl;
  final String frontImagePath;
  final String backImagePath;

  const ReusableResultWidget({
    required this.imageUrl,
    required this.frontImagePath,
    required this.backImagePath,
  });

  void _downloadImage() {
    html.AnchorElement(href: imageUrl)
      ..target = 'blank'
      ..download = 'image.jpg'
      ..click();
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 20,),
                  Container(
                    width: 260,
                    child: Image.asset('assets/images/your.png'),
                  ),
                  Container(
                    width: 300,
                    height: 450,
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Image.asset(frontImagePath),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Image.asset(backImagePath),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 300,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      '🔼 Tap card to see details',
                      style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Share.share(
                              """🍹 Let's find out which cocktail best suits your unique vibe! 🎉\n\nCheck out the link below:\nhttps://cocktail-personality.netlify.app""");
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.share_rounded, size: 20,),
                            SizedBox(width: 5,),
                            Text('Share')
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      ElevatedButton(
                        onPressed: _downloadImage,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.file_download, size: 20,),
                            SizedBox(width: 5,),
                            Text('Download')
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TestWidget()),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.replay, size: 20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


