import 'package:flutter/material.dart';

class ContentModel {
  String? title;
  String? subtitle;
  String? publishingDate;
  List<String>? image;
  List<String>? labels;
  Widget? widget;
  bool? doesHavePictures;
  bool? isGotoToCode;
  String? codeLink;
  ContentModel(
      {this.title,
      this.subtitle,
      this.publishingDate,
      this.image,
      this.labels,
      this.doesHavePictures,
      this.isGotoToCode,
      this.codeLink,
      this.widget});
}
