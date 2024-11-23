import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/features/admin_authentication/presentation/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Container(
        color: const Color(0xFF205560),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(
              height: 45,
              width: 40,
            ),
            const SizedBox(height: 20),
            ProgressBar(
              activeColor: Colors.teal.lighter,
            ),
          ],
        ),
      ),
    );
  }
}
