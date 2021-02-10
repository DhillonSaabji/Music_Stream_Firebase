import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mymusicstreaming/screens/home.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:wave/config.dart';
//import 'package:wave/wave.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LEERHX',
        home: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("lib/assets/images/splashbg.png"),
                  fit: BoxFit.cover)),
          child: AnimatedSplashScreen(
            duration: 3000,
            splash: 'lib/assets/images/leerhxlogo.png',
            //splash: Icons.home,
            nextScreen: SplashScreen(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Color.fromRGBO(24, 27, 44, 1),
            splashIconSize: 500,
            animationDuration: Duration(seconds: 5),
          ),
        ));
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("lib/assets/images/splashbg.png"),
              fit: BoxFit.cover)),
      child: AnimatedSplashScreen(
        duration: 3000,
        splash: 'lib/assets/images/leerhximgtransparant.png',
        //splash: Icons.satellite,
        nextScreen: Home(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        splashIconSize: 900,
        backgroundColor: Color.fromRGBO(24, 27, 44, 1),
        animationDuration: Duration(seconds: 3),
      ),
//      child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
//        children: [
////        Padding(
////          padding: const EdgeInsets.only(top:4.0),
//////          child: WaveWidget(
//////              duration: 2,
//////              config: CustomConfig(
//////                gradients: [
//////                  [Colors.green, Colors.white],
//////                  [Colors.yellow, Colors.white],
//////                  [Colors.cyan, Colors.white],
//////                  [Colors.purple, Colors.white],
//////
//////                ],
//////                durations: [35000, 19440, 10800, 20000],
//////                heightPercentages: [0.20, 0.23, 0.25, 0.30],
//////                blur: MaskFilter.blur(BlurStyle.outer, 1),
//////                gradientBegin: Alignment.bottomLeft,
//////                gradientEnd: Alignment.bottomLeft,
//////              ),
//////              // waveAmplitude: 1.0,
//////              backgroundColor: Colors.transparent,
//////              size: Size(double.infinity, 50.0)),
////        ),
//          AnimatedSplashScreen(
//            duration: 3000,
//            splash: 'lib/assets/images/leerhximgtransparant.png',
//            //splash: Icons.satellite,
//            nextScreen: Home(),
//            splashTransition: SplashTransition.fadeTransition,
//            pageTransitionType: PageTransitionType.leftToRightWithFade,
//            splashIconSize: 900,
//            backgroundColor: Color.fromRGBO(24, 27, 44, 1),
//            animationDuration:Duration(seconds: 3),
//          ),
////        Padding(
////          padding: const EdgeInsets.only(top:4.0),
////          child: WaveWidget(
////              duration: 2,
////              config: CustomConfig(
////                gradients: [
////                  [Colors.green, Colors.white],
////                  [Colors.yellow, Colors.white],
////                  [Colors.cyan, Colors.white],
////                  [Colors.purple, Colors.white],
////
////                ],
////                durations: [35000, 19440, 10800, 20000],
////                heightPercentages: [0.20, 0.23, 0.25, 0.30],
////                blur: MaskFilter.blur(BlurStyle.outer, 1),
////                gradientBegin: Alignment.bottomLeft,
////                gradientEnd: Alignment.bottomLeft,
////              ),
////              // waveAmplitude: 1.0,
////              backgroundColor: Colors.transparent,
////              size: Size(double.infinity, 50.0)),
////        ),
//        ],
//      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("lib/assets/images/dashboardimg.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
