import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckboxProvider extends StateNotifier<bool?> {
  CheckboxProvider(): super(false);
  
  void toggle(bool? value) {
    state = value;
  }
}

final checkboxProvider = StateNotifierProvider<CheckboxProvider,bool?>((ref) {
  return CheckboxProvider();
});