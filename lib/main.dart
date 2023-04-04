import 'package:flutter/material.dart';
import 'package:helloworld/code/screens/homepage.dart';
import 'package:helloworld/code/screens/posts/posts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 2460,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1600, name: DESKTOP),
              ResponsiveBreakpoint.resize(2460, name: "4K"),
            ],
            background: Container(color: Color(0xFFF5F5F5)));
      },
      title: 'Honey Bansal',
      home: HomeScreen(),
    );
  }
}
