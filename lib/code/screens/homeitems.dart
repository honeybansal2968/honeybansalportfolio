import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helloworld/code/constants.dart';
import 'package:helloworld/code/screens/posts/posts.dart';

class HomeScreenItems {
  static Widget postBtn(Size size, context) {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 40,
          margin: EdgeInsets.only(
              top: 10,
              right: (size.width < 500)
                  ? 10
                  : (size.width < 800)
                      ? 50
                      : (size.width < 1000)
                          ? 100
                          : 200),
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.transparent)],
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Posts();
              }));
            },
            child: Text(
              "Posts",
              style: GoogleFonts.getFont(
                'Spinnaker',
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return const BorderSide(color: Colors.white, width: 2);
                }
                return BorderSide.none;
              }),
              mouseCursor: MaterialStateMouseCursor.clickable,
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.hovered)) {
                  return primaryColor;
                }
                return const Color.fromRGBO(40, 38, 38, 1);
              }),
            ),
          ),
        ));
  }

  static Widget name(Size size) {
    return Container(
      margin: EdgeInsets.only(
          top: (size.width < 500)
              ? 40
              : (size.width < 1000)
                  ? 60
                  : 70,
          left: (size.width < 500)
              ? 60
              : (size.width < 1000)
                  ? 70
                  : 200),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Honey",
            style: GoogleFonts.getFont(
              'Secular One',
              textStyle: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: (size.width < 500)
                      ? 40
                      : (size.width < 1000)
                          ? 60
                          : 67,
                  shadows: [
                    const Shadow(color: Colors.white, offset: Offset(-1, -1)),
                    const Shadow(color: Colors.white, offset: Offset(-1, 1)),
                    const Shadow(color: Colors.white, offset: Offset(1, 1)),
                    const Shadow(color: Colors.white, offset: Offset(1, -1))
                  ]),
            )),
        TextSpan(
            text: " Bansal",
            style: GoogleFonts.getFont('Secular One',
                textStyle: TextStyle(
                  fontSize: (size.width < 500)
                      ? 40
                      : (size.width < 1000)
                          ? 50
                          : 67,
                )))
      ])),
    );
  }

  static Widget skillTab(EdgeInsets edgeInsets, double fontSize1,
      double fontSize2, String text1, String text2) {
    return Container(
      margin: edgeInsets,
      // color: Colors.pink.withAlpha(1).withOpacity(0.2),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "$text1\n",
            style: GoogleFonts.getFont('Forum',
                textStyle:
                    TextStyle(fontSize: fontSize1, color: Colors.white))),
        TextSpan(
            text: text2,
            style: GoogleFonts.getFont('Forum',
                textStyle: TextStyle(fontSize: fontSize2, color: Colors.white)))
      ])),
    );
  }
}

class DottedCustomLines extends StatelessWidget {
  EdgeInsets edgeInsets;
  double lineLength;
  Axis direction;
  Color lineColor;
  DottedCustomLines(
      {Key? key,
      required this.edgeInsets,
      required this.lineLength,
      required this.direction,
      required this.lineColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      child: DottedLine(
        dashColor: lineColor,
        lineLength: lineLength,
        direction: direction,
        dashLength: 5,
        dashGapLength: 2,
        lineThickness: 5,
        dashRadius: 100,
      ),
    );
  }
}
