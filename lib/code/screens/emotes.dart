import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Emotes extends StatelessWidget {
  EdgeInsets margin;
  Emotes({Key? key, required this.margin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          emotePick(
              ResponsiveValue(
                context,
                defaultValue: 50.0,
                valueWhen: [
                  Condition.smallerThan(name: MOBILE, value: 50.0),
                  Condition.smallerThan(name: TABLET, value: 60.0),
                  Condition.equals(
                    name: DESKTOP,
                    value: 80.0,
                  ),
                  Condition.equals(
                    name: TABLET,
                    value: 70.0,
                  ),
                  Condition.largerThan(
                    name: TABLET,
                    value: 100.0,
                  )
                ],
              ).value!,
              "https://raw.githubusercontent.com/honeybansal2968/portfolio/main/computer-svgrepo-com.svg"),
          custommSizedBox(context),
          emotePick(50,
              'https://raw.githubusercontent.com/honeybansal2968/portfolio/main/student-graduating-svgrepo-com%20(1).svg'),
          custommSizedBox(context),
          emotePick(50,
              "https://raw.githubusercontent.com/honeybansal2968/portfolio/main/clock-svgrepo-com%20(2).svg")
        ],
      ),
    );
  }

  Widget emotePick(double radius, String imgLink) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: Image.network(
        imgLink,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget custommSizedBox(BuildContext context) {
    return SizedBox(
      height: ResponsiveValue(
        context,
        defaultValue: 30.0,
        valueWhen: [
          Condition.smallerThan(name: MOBILE, value: 30.0),
          Condition.smallerThan(name: TABLET, value: 50.0),
          Condition.equals(
            name: DESKTOP,
            value: 70.0,
          ),
          Condition.equals(
            name: TABLET,
            value: 60.0,
          ),
          Condition.largerThan(
            name: TABLET,
            value: 70.0,
          )
        ],
      ).value!,
    );
  }
}
