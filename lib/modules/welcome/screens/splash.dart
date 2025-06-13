import 'package:flutter/material.dart';
import 'package:test_task/modules/welcome/screens/welcome.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../../../generated/assets.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100)).then((_){
      context.pushReplacement(child: Welcome());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.black3,
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Image(image: AssetImage(Assets.imagesLogo),
          width: 140,
        )),
      ),
    );
  }
}
