import 'package:flutter/material.dart';
import 'package:test_task/modules/welcome/screens/signin.dart';
import 'package:test_task/modules/welcome/widgets/primary_button.dart';
import 'package:test_task/utils/app_text_styles.dart';
import 'package:utility_extensions/extensions/context_extensions.dart';
import 'package:utility_extensions/extensions/widget_utilities.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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

        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: AppColors.black1
              ),
              child: Column(
                children: [
                  Text("Welcome!",
                    style: AppTextStyles.ebGaramond(
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  Text("Text text text",
                    style: AppTextStyles.lato(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )
                    ),
                  ),

                  24.vBox,
                  PrimaryButton(
                    text: "Scan bottle",
                    onPressed: (){
                      context.push(child: Signin());
                    },
                  ),
                  24.vBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Text("Have an account?",
                        style: AppTextStyles.lato(
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey2,

                          )
                        ),
                      ),
                      Text("Have an account?",
                        style: AppTextStyles.lato(
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
