import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inovola_technical_task/Res/Colors/AppColor.dart';

class SeparatorContainer extends StatelessWidget {
  const SeparatorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.liteGrey,
      width: double.infinity,
      height: 1,
    );
  }
}
