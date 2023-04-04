import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'constants/const.dart';
import 'constants/dimens.dart';

class SolarSystem extends StatefulWidget {
  String skill;
  List<String> skillImage;
  List<String> skillName;
  SolarSystem(
      {Key? key,
      required this.skill,
      required this.skillImage,
      required this.skillName})
      : super(key: key);

  @override
  _SolarSystemState createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  final List<Widget> _firstCircleImages = [];
  final List<Widget> _secondCircleImages = [];
  final List<Widget> _thirdCircleImages = [];

  @override
  void initState() {
    generateImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularRotation(
      circularRotationProperty: CircularRotationModel(
        firstCircleRadius: 35,
        secondCircleRadius: 50,
        thirdCircleRadius: 50,
        defaultCircleStrokeWidth: 2,
        defaultCircleStrokeColor: Colors.white,
        startAnimation: true,
        repeatAnimation: true,
        firstCircleAnimationDuration:
            Constants.firstCircleAnimationDurationInMilliseconds,
        secondCircleAnimationDuration:
            Constants.secondCircleAnimationDurationInMilliseconds,
        thirdCircleAnimationDuration:
            Constants.thirdCircleAnimationDurationInMilliseconds,
        centerWidget: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            widget.skill,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          radius: Dimens.radiusLarge,
        ),
        firstCircleWidgets: _firstCircleImages,
        secondCircleWidgets: _secondCircleImages,
        thirdCircleWidgets: _thirdCircleImages,
        // thirdCircleRadians: Dimens.thirdCircleRadians,
        // secondCircleRadians: Dimens.secondCircleRadians,
        // firstCircleRadians: Dimens.firstCircleRadians,
      ),
    );
  }

  void generateImages() {
    /// Adding images into first circle.
    _firstCircleImages.add(
      _GetProfile(name: widget.skillName[4], image: widget.skillImage[4]),
    );
    _firstCircleImages.add(
      _GetProfile(name: widget.skillName[3], image: widget.skillImage[3]),
    );
    _firstCircleImages.add(
      _GetProfile(name: widget.skillName[6], image: widget.skillImage[6]),
    );

    /// Adding images into second circle.
    _secondCircleImages.add(
      _GetProfile(name: widget.skillName[1], image: widget.skillImage[1]),
    );
    _secondCircleImages.add(
      _GetProfile(name: widget.skillName[2], image: widget.skillImage[2]),
    );
    _secondCircleImages.add(
      _GetProfile(name: widget.skillName[5], image: widget.skillImage[5]),
    );

    /// Adding images into third circle.
    _thirdCircleImages.add(
      _GetProfile(name: widget.skillName[0], image: widget.skillImage[0]),
    );
  }
}

class _GetProfile extends StatelessWidget {
  const _GetProfile({
    required this.name,
    required this.image,
    this.radius = Dimens.radiusNormal,
    Key? key,
  }) : super(key: key);
  final String name;
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CircularImage(image: image, radius: radius),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}

class _CircularImage extends StatelessWidget {
  const _CircularImage({required this.image, required this.radius, Key? key})
      : super(key: key);
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(image),
      backgroundColor: Colors.transparent,
    );
  }
}
