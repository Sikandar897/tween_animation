/*Thats wow splash screen using tween Animation */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tween Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      home: const MyHomePage(title: 'Splash Screen using tween Anim'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //that " with SingleTickerProviderStateMixin"  is required for below vsync and have to refrence it with this keyword bya ba mu duration set kawo

  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 200.0).animate(
        animationController); //values kom wee 0 na 200 kom wee haga ba de 4 sec ki intervall bandy divide kege de wajy animation smoot she de values pa help colors size etc har sa chnnage kwe sho

    animationController.addListener(() {
      // ignore: avoid_print
      // print(animation.value); //just cheaking the values chy shta ka na

      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Center(
              child: SizedBox(
            width: animation.value,
            height: animation.value,
            child: Image.asset('assets/images/logo.png'),
          )),
        ));
  }
}
