import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_pw_grace_period.g.dart';

@Riverpod(keepAlive: true)
class SetPwGracePeriod extends _$SetPwGracePeriod {
  @override
  String build() {
    return "1 day";
  }

  void setGracePeriod(String gracePeriod) {
    state = gracePeriod;
  }
}
