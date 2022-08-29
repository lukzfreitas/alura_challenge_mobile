import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsSvg {
  static const String USER = 'assets/icons/user.svg';
  static const String CENTER_FOCO = 'assets/icons/center_foco.svg';
  static const String CACHED = 'assets/icons/cached.svg';
  static const String WALLET = 'assets/icons/wallet.svg';
}

SvgPicture LoadIconSvg(String iconsSvg) {
  return SvgPicture.asset(
    iconsSvg,
    clipBehavior: Clip.antiAlias,
  );
}
