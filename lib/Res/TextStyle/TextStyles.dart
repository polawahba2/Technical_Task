import 'package:flutter/rendering.dart';
import 'package:inovola_technical_task/Res/TextStyle/ResponsiveTextSize.dart';

import '../Colors/AppColor.dart';

TextStyle headLineStyle(context) => TextStyle(
      color: AppColor.grey,
      fontSize: const ResponsiveTextSize().getResponsiveTextSize(context, 16),
      fontWeight: FontWeight.bold,
    );

TextStyle secoundTextStyle(context) => TextStyle(
      color: AppColor.grey,
      fontSize: const ResponsiveTextSize().getResponsiveTextSize(context, 12),
      fontWeight: FontWeight.bold,
    );
