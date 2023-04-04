import 'package:helloworld/code/models/contentModel.dart';
import 'package:flutter/material.dart';

ContentModel object1 = ContentModel(
  title: "Sign In and Sign out Authentication",
  subtitle: "User account creation, Login and Reset password features",
  publishingDate: "10 March 2023",
  isGotoToCode: true,
  codeLink: "https://github.com/honeybansal2968/signInAuth",
  image: [
    "https://raw.githubusercontent.com/honeybansal2968/signInAuth/main/assets/project%20photoes/Screenshot_2023_03_10_20_51_24_37_81ed552cd1c1836cae333bd2e65db383.png",
  ],
  labels: ["Flutter", "Dart", "Firebase", "Google Analytics"],
);
ContentModel object2 = ContentModel(
    title: "Timeline UI",
    subtitle: "Timeline UI",
    publishingDate: "10 March 2023",
    isGotoToCode: true,
    codeLink: "https://github.com/honeybansal2968/Timeline",
    image: [
      "https://raw.githubusercontent.com/honeybansal2968/Timeline/main/images/Screenshot_2023_03_10_20_17_25_19_838ff96ffe1ffb79ae429a3bf023b762.png"
    ],
    labels: [
      "Flutter",
      "Dart",
    ]);
List<ContentModel> allModels = [object1, object2];
