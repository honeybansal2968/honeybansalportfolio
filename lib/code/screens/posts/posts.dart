import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helloworld/code/constants.dart';
import 'package:helloworld/code/models/contentObjects.dart';
import 'package:helloworld/code/screens/homepage.dart';
import 'package:helloworld/utils/constants.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart' as URLLaucher;

abstract class URL {
  static launchUrl(String url) async {
    url = Uri.encodeFull(url);
    if (await URLLaucher.canLaunch(url)) {
      await URLLaucher.launch(url);
    } else {
      throw 'Unknown error, can\'t launch the URL. Холбоост нэвтрэхэд алдаа гарлаа';
    }
  }
}

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          },
          icon: Icon(Icons.home_filled),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            mouseCursor: MaterialStateMouseCursor.clickable,
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.hovered)) {
                return Color(0xff0043fb); // set the hover color here
              }
              return Colors.white; // set the default color here
            }),
          ),
        ),
        title: Text(
          "Posts",
          style: GoogleFonts.getFont(
            'Spinnaker',
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveValue(
                        context,
                        defaultValue: 25.0,
                        valueWhen: [
                          const Condition.smallerThan(
                              name: MOBILE, value: 25.0),
                          Condition.largerThan(
                            name: MOBILE,
                            value: size.width * 0.33,
                          )
                        ],
                      ).value!,
                      vertical: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: allModels[index].image!.isEmpty
                              ? Container()
                              : Container(
                                  height: 400,
                                  child:
                                      Image.network(allModels[index].image![0]),
                                ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          allModels[index].title!,
                          style: GoogleFonts.getFont('Spinnaker',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text("H",
                                  style: GoogleFonts.getFont('Spinnaker',
                                      fontSize: 20,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Honey Bansal",
                              style: GoogleFonts.getFont('Spinnaker',
                                  fontSize: 16.8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Published on ${allModels[index].publishingDate}",
                              style: GoogleFonts.getFont(
                                'Spinnaker',
                                fontSize: 12,
                                color: fadeColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          allModels[index].subtitle!,
                          style: GoogleFonts.getFont(
                            'Spinnaker',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.new_label,
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, left: 5),
                              height: 30,
                              width: ResponsiveValue(
                                context,
                                defaultValue: 300.0,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: MOBILE, value: 300.0),
                                  Condition.largerThan(
                                    name: MOBILE,
                                    value: 300.0,
                                  )
                                ],
                              ).value!,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: allModels[index].labels!.length,
                                itemBuilder: (BuildContext context, int idx) {
                                  return Container(
                                    child: Text(
                                      "${allModels[index].labels![idx]}, ",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            URLLaucher.launchUrl(
                                Uri.parse(allModels[index].codeLink!));
                          },
                          child: Text(
                            allModels[index].isGotoToCode == true
                                ? "Get Code"
                                : "Read more",
                            style: GoogleFonts.getFont(
                              'Spinnaker',
                            ),
                          ),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18),
                            ),
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Color(
                                    0xff0043fb); // set the hover color here
                              }
                              return linkcolor; // set the default color here
                            }),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: size.width * 0.8,
                            height: 1,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
