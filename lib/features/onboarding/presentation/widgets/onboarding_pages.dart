import 'package:designsprit/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> pages = [
  PageViewModel(
    title: "Title of orange text and bold page 1",
    body:
        "This is a description on a page with an orange title and bold, big body.",
    image: Center(
      child: Image.asset(AssetsData.imagesOnboarding1),
    ),
  ),
  PageViewModel(
    title: "Title of orange text and bold page 2",
    body:
        "This is a description on a page with an orange title and bold, big body.",
    image: Center(
      child: Image.asset(AssetsData.imagesOnboarding2),
    ),
  ),
  PageViewModel(
    title: "Title of orange text and bold page 3",
    body:
        "This is a description on a page with an orange title and bold, big body.",
    image: Center(
      child: Image.asset(AssetsData.imagesOnboarding3),
    ),
  ),
];
