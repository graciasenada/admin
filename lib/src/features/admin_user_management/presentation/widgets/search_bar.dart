import 'package:fluent_ui/fluent_ui.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;

  const SearchBar({super.key, required this.controller});

  @override
  //TODO: change plans: change this to filtering/sorting options (doc rentor comments)
  //TODO: first option is sort name from A to Z oe Z to A?
  //TODO: second option is filter by role?
  Widget build(BuildContext context) {
    return TextBox(
      placeholder: 'Search by name or role',
      controller: controller,
    );
  }
}
