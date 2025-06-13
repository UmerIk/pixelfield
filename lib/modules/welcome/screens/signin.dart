import 'package:flutter/material.dart';
import 'package:test_task/modules/dashboard/screens/dashboard.dart';
import 'package:test_task/modules/welcome/widgets/primary_button.dart';
import 'package:test_task/modules/welcome/widgets/text_field_widget.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';
import 'package:utility_extensions/extensions/context_extensions.dart';
import 'package:utility_extensions/extensions/widget_utilities.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black2,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.vBox,
              BackButton(color: Colors.white),

              24.vBox,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
                      style: AppTextStyles.ebGaramond(
                        style: TextStyle(
                          color: AppColors.grey1,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    40.vBox,

                    TextFieldWidget(
                      label: "Email",
                      controller: email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    16.vBox,
                    TextFieldWidget(
                      label: "Password",
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),

                    40.vBox,

                    PrimaryButton(
                      text: "Continue",
                      onPressed: () {
                        context.pushAndRemoveUntil(child: Dashboard());
                      },
                    ),

                    40.vBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          "Can’t sign in?",
                          style: AppTextStyles.lato(
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey2,
                            ),
                          ),
                        ),
                        Text(
                          "Recover password",
                          style: AppTextStyles.lato(
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
