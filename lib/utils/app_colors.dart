import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const purple = Color(0xffbb93f5);
  static const lightBlue = Color(0xff809fff);
  static const darkPink = Color(0xffff5e6c);
  static const lightPink = Color(0xffffc2df);
  static const matterhorn = Color(0xFF525252);
  static const darkGreen = Color(0xff3f800f);
  static const darkBlue = Color(0xFF203574);

  /// Circular chart colors
  static const personalGrout = Color(0xF0FECF55);
  static const moneyFinance = Color(0xFF65B458);
  static const careerBusiness = Color(0xFFEF5A3C);
  static const homeFamily = Color(0xFFFEA255);
  static const partnersLove = Color(0xFFFF9AE3);
  static const socialFriends = Color(0xFF61BAFB);
  static const healthSports = Color(0xFFFF80DB);
  static const funAndRecreation = Color(0xFFC3F161);
  static const other = Color(0xFFBB93F5);

  static const chocolate = Color(0xFF993003);
  static const raisinBlack = Color(0xFF222222);
  static const black = Color(0xFF000000);
  static const chineseBlack = Color(0xFF171717);
  static const white = Color(0xffffffff);
  static const jaguar = Color(0xff252528);
  static const blackMarlin = Color(0xff3a3a3c);
  static const gray = Color(0xFF666666);
  static const nickel = Color(0xFF959595);
  static const grayRegular = Color(0xFFC4C4C4);
  static const lightGray = Color(0xffd4d4d4);
  static const brightGray = Color(0xffeaeaea);
  static const whiteSmock = Color(0xfff6f6f6);
  static const extraLightGray = Color(0xfffafafa);
  static const burgundy = Color(0xff56012b);
  static const chineseRed = Color(0xffb3222f);
  static const lightRed = Color(0xffcb402f);
  static const flamingo = Color(0xffef5a3c);
  static const orange = Color(0xfffea255);
  static const yellowPolka = Color(0xfffbb861);
  static const autumnOrange = Color(0xffef9d54);
  static const avatarYellow = Color(0xfff2d36f);
  static const avatarLightYellow = Color(0xfff9dcb9);
  static const goldPlate = Color(0xffe5bc90);
  static const butterum = Color(0xffc68e63);
  static const Brown = Color(0xffa36135);
  static const darkBrown = Color(0xff5d4437);
  static const saddleBrown = Color(0xff9b5b33);
  static const extraDarkBrown = Color(0xff2a1c19);
  static const darkBlonde = Color(0xffad834d);
  static const blondeGolden = Color(0xffd0b479);
  static const blown = Color(0xff6b4336);
  static const blownDark = Color(0xff46322d);
  static const pastelPink = Color(0xffe89b99);
  static const blue = Color(0xff030fd2);
  static const platinum = Color(0xffe9ddc2);
  static const dupont = Color(0xffb9401f);
  static const silver = Color(0xffe7e1e1);
  static const red = Color(0xffeb4444);
  static const success = Color(0xff56c568);
  static const alert = Color(0xffffc400);
  static const pink = Color(0xffff5f69);

  ///todo should be deleted
  static const yellow = Color(0xFFFEAE1C);
  static const charcoal = Color(0xFF212121);
  static const chalkboardBlack = Color(0xFF262C2E);
  static const blackHeadlines = Color(0xFF262C2E);
  static const graySubtitles = Color(0xFF65616A);
  static const zambezi = Color(0xFF585858);
  static const darkGray = Color(0xFF65616A);
  static const grayMedium = Color(0xFFA9A7A3);
  static const green = Color(0xFF3EAA42);
  static const brightRed = Color(0xFFE40000);
  static const lightGreen = Color(0xFF3AC984);
  static const darkModeBlack = Color(0xFF383838);
  static const darkTextFillColor = Color(0xFF363640);
  static const dark = Color(0xFF000000);
  static const grayTabBackground = Color(0xFFA6A3A9);
  static const grayTileTrailing = Color(0xFFBEC4CB);
  static const divider = Color(0xFFE3E0E3);
  static const appBarSelectedBlack = Color(0xFF25282A);
  static const shadowColor = Color(0xFFA4A9AD);
  static const shadowColor2 = Color(0xFF323B62);
  static const yellowButtonDisabledColor = Color(0xFFFFDEA1);
  static const burgundyButtonDisabledColor = Color(0xFFBF98AE);
  static const textButtonDisabledColor = Color(0xFFFDFBF8);
  static const darkLiver = Color(0xFF505051);

  static const error = Color(0xFFFF453A);
  static const listTitleBlack = blackHeadlines;
  static const listSubTitleBlack = graySubtitles;
  static const myLocationActive = yellow;
  static const myLocationInactive = yellow;

  ///gradients
  static const orangeToFlamingo = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.orange,
      AppColors.flamingo,
    ],
  );

  static const rewardGreen = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffffff04),
      Color(0xff4f6401),
    ],
  );

  static const rewardBlue = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xff04eefb),
      Color(0xff024dc1),
    ],
  );
  static const rewardPurple = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffff36ff),
      Color(0xff7c0f97),
    ],
  );
  static const rewardYellow = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffffff04),
      Color(0xffff8902),
    ],
  );
  static const rewardRed = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xfffe7037),
      Color(0xFF9B0911),
    ],
  );

  static const locked = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffa3a3a3),
      Color(0xff4f4f52),
    ],
  );


  /// from figma
  static const hintColor = Color.fromRGBO(164, 164, 164, 1);
  static const fieldColor = Color.fromRGBO(242, 242, 242, 1);
  static const errorColor = Color.fromRGBO(193, 18, 31, 1);
}