import 'package:flutter/material.dart';
import 'package:intro_screen/homepage.dart';
import 'package:intro_screen/introScreen/introScreen1.dart';
import 'package:intro_screen/introScreen/introScreen2.dart';
import 'package:intro_screen/introScreen/introScreen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  PageController _controller = PageController();

  bool lastpage = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                lastpage = (index == 2);
              });
            },
            children: [
            Introscreen1(),
            Introscreen2(),
            Introscreen3()
            ],
          ),
          Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(2);
                  },
                  child: Text("Skip")
                  ),

                SmoothPageIndicator(controller: _controller, count: 3),

                 lastpage ?
                 GestureDetector(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Homepage();
                   }));
                  },
                  child: Text("Done")
                  )
                  :
                   GestureDetector(
                  onTap: (){
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  child: Text("Next")
                  ),

              ],
            ))
        ],
      )
    );
  }
}