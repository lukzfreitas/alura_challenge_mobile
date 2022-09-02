import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsSvg {
  static const String user = 'assets/icons/user.svg';
  static const String centerFoco = 'assets/icons/center_foco.svg';
  static const String cached = 'assets/icons/cached.svg';
  static const String wallet = 'assets/icons/wallet.svg';

  static loadIconSvg(String iconsSvg) {
    return SvgPicture.asset(
      iconsSvg,
      clipBehavior: Clip.antiAlias,
    );
  }
}
