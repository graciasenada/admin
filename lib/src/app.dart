import 'package:admin/src/features/authentication/authentication.dart';
import 'package:fluent_ui/fluent_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Returning the FluentApp widget with the necessary configurations
    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen()
    );
  }
}
