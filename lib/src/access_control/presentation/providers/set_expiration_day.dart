import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_expiration_day.g.dart';

@Riverpod(keepAlive: true)
class SetExpirationDay extends _$SetExpirationDay {
  @override
  String build() {
    return '60 days';
  }

  void setDay(String day) {
    state = day;
  }
}
