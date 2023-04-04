import 'package:flutter/material.dart';
import 'package:helloworld/code/constants.dart';
import 'package:helloworld/code/screens/emotes.dart';
import 'package:helloworld/code/screens/homeitems.dart';
import 'package:helloworld/code/screens/skillsClass.dart';
import 'package:helloworld/code/screens/work.dart';
import 'package:helloworld/code/screens/workConstants.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: primaryColor,
                    width: size.width,
                    height: ResponsiveValue(
                      context,
                      defaultValue: size.height,
                      valueWhen: [
                        Condition.smallerThan(name: MOBILE, value: 400.0),
                        Condition.smallerThan(name: TABLET, value: 500.0),
                        Condition.equals(
                          name: DESKTOP,
                          value: 600.0,
                        ),
                        Condition.equals(
                          name: TABLET,
                          value: 500.0,
                        ),
                        Condition.largerThan(
                          name: TABLET,
                          value: 600.0,
                        )
                      ],
                    ).value!,
                  ),
                  HomeScreenItems.postBtn(size, context),
                  HomeScreenItems.name(size),
                  DottedCustomLines(
                      edgeInsets: EdgeInsets.fromLTRB(
                          (size.width < 500)
                              ? 140
                              : (size.width < 1000)
                                  ? 220
                                  : 400,
                          (size.width < 500)
                              ? 100
                              : (size.width < 1000)
                                  ? 140
                                  : 150,
                          0,
                          0),
                      lineLength: (size.width < 500)
                          ? 170
                          : (size.width < 1000)
                              ? 200
                              : 202,
                      direction: Axis.vertical,
                      lineColor: Colors.white),
                  DottedCustomLines(
                      edgeInsets: EdgeInsets.fromLTRB(
                          (size.width < 500)
                              ? 112
                              : (size.width < 1000)
                                  ? 192
                                  : 372,
                          (size.width < 500)
                              ? 114
                              : (size.width < 1000)
                                  ? 160
                                  : 179,
                          0,
                          0),
                      lineLength: (size.width < 500)
                          ? 100
                          : (size.width < 1000)
                              ? 250
                              : 257,
                      direction: Axis.horizontal,
                      lineColor: Colors.white),
                  HomeScreenItems.skillTab(
                      EdgeInsets.fromLTRB(
                          (size.width < 500)
                              ? 215
                              : (size.width < 1000)
                                  ? 450
                                  : 640,
                          (size.width < 500)
                              ? 90
                              : (size.width < 1000)
                                  ? 120
                                  : 140,
                          0,
                          0),
                      (size.width < 500)
                          ? 24
                          : (size.width < 1000)
                              ? 35
                              : 45,
                      (size.width < 500)
                          ? 30
                          : (size.width < 1000)
                              ? 45
                              : 45,
                      "App",
                      "Developer"),
                  HomeScreenItems.skillTab(
                      EdgeInsets.fromLTRB(
                          (size.width < 500)
                              ? 120
                              : (size.width < 1000)
                                  ? 195
                                  : 360,
                          (size.width < 500)
                              ? 260
                              : (size.width < 1000)
                                  ? 340
                                  : 350,
                          0,
                          0),
                      (size.width < 500)
                          ? 24
                          : (size.width < 1000)
                              ? 35
                              : 40,
                      (size.width < 500)
                          ? 35
                          : (size.width < 1000)
                              ? 45
                              : 50,
                      "AI-ML",
                      "Engineer"),
                ],
              ),
              Emotes(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              SizedBox(
                height: ResponsiveValue(
                  context,
                  defaultValue: 30.0,
                  valueWhen: [
                    Condition.smallerThan(name: MOBILE, value: 30.0),
                    Condition.smallerThan(name: TABLET, value: 50.0),
                    Condition.equals(
                      name: DESKTOP,
                      value: 60.0,
                    ),
                    Condition.equals(
                      name: TABLET,
                      value: 50.0,
                    ),
                    Condition.largerThan(
                      name: TABLET,
                      value: 60.0,
                    )
                  ],
                ).value!,
              ),
              const Skills(),
              SizedBox(
                height: (size.width < 500)
                    ? 24
                    : (size.width < 1000)
                        ? 30
                        : 40,
              ),
              Work(
                title: "Activites & Participations",
                circleImage: Activities.circleImage,
                date: Activities.date,
                event: Activities.event,
              ),
              SizedBox(
                height: (size.width < 500)
                    ? 28
                    : (size.width < 1000)
                        ? 34
                        : 50,
              ),
              Work(
                title: "Experience",
                circleImage: Experience.circleImage,
                date: Experience.date,
                event: Experience.event,
              ),
            ],
          ),
        ));
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.7);

    var firstControlPoint = Offset(
        size.width / 4,
        size.height *
            (size.width < 500 ? 0.8 : (size.width < 800 ? 0.9 : 0.8)));
    var firstPoint = Offset(
        size.width / 2,
        size.height *
            (size.width < 500 ? 0.8 : (size.width < 800 ? 0.9 : 0.8)));
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(
        size.width - (size.width / 4),
        size.height *
            (size.width < 500 ? 0.8 : (size.width < 800 ? 0.9 : 0.8)));
    var secondPoint = Offset(size.width, size.height * 0.7);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
