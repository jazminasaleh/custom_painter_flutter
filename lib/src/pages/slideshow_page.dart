import 'package:diseno/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidesShowPages extends StatelessWidget {
  const SlidesShowPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidesShow(
        slides: [
           SvgPicture.asset( 'assets/slide-1.svg'),
           SvgPicture.asset( 'assets/slide-2.svg'),
           SvgPicture.asset( 'assets/slide-3.svg'),
           SvgPicture.asset( 'assets/slide-4.svg'),
        ],
      )
    );
  }
}
