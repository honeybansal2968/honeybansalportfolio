import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkItems extends StatelessWidget {
  String circleImage;
  String date;
  String event;
  WorkItems(
      {Key? key,
      required this.circleImage,
      required this.date,
      required this.event})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.network(
                    circleImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                radius: (size.width < 500)
                    ? 30
                    : (size.width < 1000)
                        ? 40
                        : 50,
              ),
            ),
            SizedBox(
              width: (size.width < 500)
                  ? 10
                  : (size.width < 1000)
                      ? 30
                      : 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date,
                    style: GoogleFonts.getFont('Forum',
                        textStyle: TextStyle(
                            fontSize: (size.width < 500)
                                ? 16
                                : (size.width < 1000)
                                    ? 18
                                    : 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w100))),
                SizedBox(
                  width: (size.width < 500)
                      ? 300
                      : (size.width < 1000)
                          ? 400
                          : 600,
                  child: Text(event,
                      style: GoogleFonts.getFont('Forum',
                          textStyle: TextStyle(
                              fontSize: (size.width < 500)
                                  ? 25
                                  : (size.width < 1000)
                                      ? 30
                                      : 45,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
