import 'package:designsprit/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/*
Design Spirit is a full service real estate,
 interior and exterior design company located in Cairo,
 specializing in residential and commercial design.
 whether you need a quick refresh look,
 the optimal use of spaces or cost- effective design,
 we can provide the expertise to make sure the project runs smoothly and gives you the best results possible.
*/
List<PageViewModel> pages = [
  PageViewModel(
    title: "Design Spirit is a full service real estate",
    body: "interior and exterior design company located in Cairo, specializing in residential and commercial design.",
    image: Center(
      child: Image.asset(AssetsData.imagesOnboarding1),
    ),
  ),
  PageViewModel(
    title: "whether you need a quick refresh look,",
    body:
        "the optimal use of spaces or cost- effective design,",
    image: Center(
      child: Image.asset(AssetsData.imagesOnboarding2),
    ),
  ),
  PageViewModel(
    title: "we can provide the expertise",
    body: "to make sure the project runs smoothly and gives you the best results possible.",
    image: Center(
      child: Image.asset(AssetsData.imagesOnboarding3),
    ),
  ),
];
