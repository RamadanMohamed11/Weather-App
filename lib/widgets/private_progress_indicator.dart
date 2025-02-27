import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PrivateProgessIndicator extends StatelessWidget {
  const PrivateProgessIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
        indicatorType: Indicator.ballClipRotateMultiple,

        /// Required, The loading type of the widget
        colors: [Colors.white],

        /// Optional, The color collections
        strokeWidth: 5,

        /// Optional, The stroke of the line, only applicable to widget which contains line
        backgroundColor: Colors.transparent,

        /// Optional, Background of the widget
        pathBackgroundColor: Colors.black

        /// Optional, the stroke backgroundColor
        );
  }
}
