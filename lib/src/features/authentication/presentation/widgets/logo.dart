import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.url = 'assets/otoscopia.svg', this.height = 30, this.width});
  final String? url;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center, 
      child: SvgPicture.asset(
      url!,
      height: height,
      width: width,
    ) 
    );
  }
}