import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helloworld/code/constants.dart';
import 'package:helloworld/code/screens/wrokItems.dart';

class Work extends StatelessWidget {
  String title;
  List<String> circleImage;
  List<String> date;
  List<String> event;
  Work(
      {Key? key,
      required this.title,
      required this.circleImage,
      required this.date,
      required this.event})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: primaryColor,
      child: Column(children: [
        SizedBox(
          height: (size.width < 500)
              ? 28
              : (size.width < 1000)
                  ? 34
                  : 50,
        ),
        Center(
          child: SizedBox(
              width: (size.width < 500)
                  ? 195
                  : (size.width < 1000)
                      ? 240
                      : 350,
              child: Text(
                textAlign: TextAlign.left,
                title,
                style: GoogleFonts.getFont('Secular One',
                    textStyle: TextStyle(
                        fontSize: (size.width < 500)
                            ? 28
                            : (size.width < 1000)
                                ? 34
                                : 50,
                        color: Colors.white,
                        fontWeight: (size.width < 500)
                            ? FontWeight.w200
                            : FontWeight.bold)),
              )),
        ),
        SizedBox(
          height: size.width < 500
              ? 30
              : size.width < 1000
                  ? 40
                  : 50,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: event.length,
            itemBuilder: (context, index) {
              return WorkItems(
                circleImage: circleImage[index],
                date: date[index],
                event: event[index],
              );
            }),
        SizedBox(
          height: (size.width < 500)
              ? 28
              : (size.width < 1000)
                  ? 34
                  : 50,
        )
      ]),
    );
  }
}
