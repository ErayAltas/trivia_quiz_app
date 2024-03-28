// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  final int id;
  final String name;
  final dynamic icon;
  final Color? color;
  Category(this.id, this.name, {this.icon, this.color});
}

final List<Category> categories = [
  Category(9, "General Knowledge", icon: FontAwesomeIcons.earthAsia, color: const Color(0xffFFC107)),
  Category(10, "Books", icon: FontAwesomeIcons.bookOpen, color: const Color(0xff795548)),
  Category(11, "Film", icon: FontAwesomeIcons.video, color: const Color(0xffF44336)),
  Category(12, "Music", icon: FontAwesomeIcons.music, color: const Color(0xff9C27B0)),
  Category(13, "Musicals & Theatres", icon: FontAwesomeIcons.masksTheater, color: const Color(0xffE91E63)),
  Category(14, "Television", icon: FontAwesomeIcons.tv, color: const Color(0xff2196F3)),
  Category(15, "Video Games", icon: FontAwesomeIcons.gamepad, color: const Color(0xff03A9F4)),
  Category(16, "Board Games", icon: FontAwesomeIcons.chessBoard, color: const Color(0xff00BCD4)),
  Category(17, "Science & Nature", icon: FontAwesomeIcons.microscope, color: const Color(0xff009688)),
  Category(18, "Computer", icon: FontAwesomeIcons.laptopCode, color: const Color(0xff4CAF50)),
  Category(19, "Maths", icon: FontAwesomeIcons.arrowDown, color: const Color(0xff8BC34A)),
  Category(20, "Mythology", icon: Icons.abc, color: const Color(0xffCDDC39)),
  Category(21, "Sports", icon: FontAwesomeIcons.footballBall, color: const Color(0xffFF5722)),
  Category(22, "Geography", icon: FontAwesomeIcons.mountain, color: const Color(0xff795548)),
  Category(23, "History", icon: FontAwesomeIcons.monument, color: const Color(0xff9E9E9E)),
  Category(24, "Politics", icon: FontAwesomeIcons.landmark, color: const Color(0xff607D8B)),
  Category(25, "Art", icon: FontAwesomeIcons.paintBrush, color: const Color(0xffFF9800)),
  Category(26, "Celebrities", icon: FontAwesomeIcons.star, color: const Color(0xffFF5722)),
  Category(27, "Animals", icon: FontAwesomeIcons.paw, color: const Color(0xff4CAF50)),
  Category(28, "Vehicles", icon: FontAwesomeIcons.car, color: const Color(0xff2196F3)),
  Category(29, "Comics", icon: FontAwesomeIcons.book, color: const Color(0xffE91E63)),
  Category(30, "Gadgets", icon: FontAwesomeIcons.mobileAlt, color: const Color(0xff9C27B0)),
  Category(31, "Japanese Anime & Manga", icon: FontAwesomeIcons.kaaba, color: const Color(0xffF44336)),
  Category(32, "Cartoon & Animation", icon: FontAwesomeIcons.theaterMasks, color: const Color(0xffFFC107)),
];
