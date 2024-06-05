import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReusableLoadingIndicator extends StatelessWidget {
  const ReusableLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("asset/animation_ image/Animation - 1713631341476.json"),
      );
  }
}