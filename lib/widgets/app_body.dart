import 'package:appointment/utilities/common_exports.dart';

class AppBody extends StatelessWidget {
  final String title;
  final Widget body;
  const AppBody({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppBar(
                  centerTitle: true,
                  title: Text(title),
                  leading: IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(flex: 10, child: body)
          ],
        ),
        Positioned(
          right: 0,
          child: Image.asset(
            AppIcons.curveImage,
          ),
        ),
      ],
    );
  }
}
