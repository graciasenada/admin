import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckboxProvider2 extends StateNotifier<bool?> {
  CheckboxProvider2() : super(false);

  void toggle(bool? value) {
    state = value;
  }
}

final checkboxProvider2 =
    StateNotifierProvider<CheckboxProvider2, bool?>((ref) {
  return CheckboxProvider2();
});
