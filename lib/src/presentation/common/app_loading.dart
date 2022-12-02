import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatefulWidget {
  const AppLoading({Key? key, required this.size, this.strokeWidth = 5})
      : super(key: key);

  final double size;
  final double strokeWidth;

  @override
  AppLoadingState createState() =>
      AppLoadingState(size: size, strokeWidth: strokeWidth);
}

class AppLoadingState extends State<AppLoading> {
  final double size;
  final double strokeWidth;

  AppLoadingState({required this.strokeWidth, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Lottie.asset(
          'assets/lottie/loading.json',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
