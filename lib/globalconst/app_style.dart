import 'dart:ui';

import 'package:flutter/material.dart';


const Color kBrown = Color.fromARGB(255, 2, 75, 69);
const Color kDarkBrown = Color.fromARGB(255, 17, 73, 66);
const Color kGrey = Color(0xFFa4aaad);
const Color kDarkGrey = Color(0xFF878787);
const Color kLightGrey = Color(0xFFededed);

const Color kWhite = Color(0xffffffff);

const Color kBlack = Color.fromARGB(255, 5, 167, 170);

const Color kYellow = Color(0xffffd33c);

const double kBorderRadius = 12.0;

const double kPaddingHorizontal = 24.0;

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: const BorderSide(
    color: kLightGrey,
  ),
);
final kEncodeSansBold = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);

final kEncodeSansSemiBold = TextStyle(color: Colors.black,fontWeight: FontWeight.w600);

final kEncodeSansMedium = TextStyle(color: Colors.black,fontWeight: FontWeight.w400);

final kEncodeSansRegular = TextStyle(color: Colors.black,fontWeight: FontWeight.w300);