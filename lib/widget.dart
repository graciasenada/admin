import 'package:fluent_ui/fluent_ui.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(title, style: TextStyle(color: Colors.white),),
              Text(value, style: TextStyle(color: Colors.white),),
            ],
          ),
        ],
      ),
    );
  }
}
