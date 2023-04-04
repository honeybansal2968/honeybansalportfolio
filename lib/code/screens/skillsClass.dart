import 'package:flutter/material.dart';
import 'package:helloworld/code/solarSytem/constants/images.dart';
import 'package:helloworld/code/solarSytem/constants/strings.dart';
import 'package:helloworld/code/solarSytem/solarSystem.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 500) {
        return Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // color: Colors.grey,
                width: (size.width < 500)
                    ? size.width
                    : (size.width < 1000)
                        ? 400
                        : 500,
                height: (size.width < 500)
                    ? 400
                    : (size.width < 1000)
                        ? 400
                        : 500,
                child: SolarSystem(
                  skill: "AppDev",
                  skillImage: appDevImages,
                  skillName: AppDev,
                )),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // color: Colors.grey,
                width: (size.width < 500)
                    ? size.width
                    : (size.width < 1000)
                        ? 400
                        : 500,
                height: (size.width < 500)
                    ? 400
                    : (size.width < 1000)
                        ? 400
                        : 500,
                child: SolarSystem(
                  skill: "AIML",
                  skillImage: aimlImages,
                  skillName: AIML,
                ))
          ],
        );
      } else {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // color: Colors.grey,
                width: (size.width < 500)
                    ? size.width
                    : (size.width < 1000)
                        ? 350
                        : 490,
                height: (size.width < 500)
                    ? 400
                    : (size.width < 1000)
                        ? 350
                        : 490,
                child: SolarSystem(
                  skill: "AppDev",
                  skillImage: appDevImages,
                  skillName: AppDev,
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                // color: Colors.grey,
                width: (size.width < 500)
                    ? size.width
                    : (size.width < 1000)
                        ? 350
                        : 490,
                height: (size.width < 500)
                    ? 400
                    : (size.width < 1000)
                        ? 350
                        : 490,
                child: SolarSystem(
                  skill: "AIML",
                  skillImage: aimlImages,
                  skillName: AIML,
                ))
          ]),
        );
      }
    });
  }
}
