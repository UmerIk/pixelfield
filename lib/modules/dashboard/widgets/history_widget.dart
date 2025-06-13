import 'dart:math';

import 'package:flutter/material.dart';
import 'package:utility_extensions/extensions/widget_utilities.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                10.vBox,
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                ),
                30.vBox,
                buildBox(3),
                5.vBox,
                buildBox(8),
                5.vBox,
                buildBox(3),
              ],
            ),
            30.hBox,
            Expanded(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Label",
                    style: AppTextStyles.lato(
                      style: TextStyle(color: AppColors.grey1, fontSize: 12),
                    ),
                  ),
                  Text(
                    title,
                    style: AppTextStyles.ebGaramond(
                      style: TextStyle(color: AppColors.grey1, fontSize: 22),
                    ),
                  ),
                  Text(
                    description,
                    style: AppTextStyles.lato(
                      style: TextStyle(color: AppColors.grey1, fontSize: 16),
                    ),
                  ),
        
                  Container(
                    padding: EdgeInsets.all(8),
                    color: AppColors.black3,
                    child: Column(
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Image(image: AssetImage(Assets.iconsAttachment), width: 16,),
                            Text("Attachments",
                              style: AppTextStyles.lato(
                                style: TextStyle(
                                  color: AppColors.grey1,
                                  fontSize: 12,
                                )
                              ),
                            ),
                          ],
                        ),
                        10.vBox,
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  color: Color(0xffD9D9D9),
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
          ],
        ),
      ),
    );
  }

  Widget buildBox(double size){
    return Transform.rotate(
      angle: 45 * (pi / 180),
      child: Container(
        width: size,
        height: size,
        color: AppColors.primary,
      ),
    );
  }
}
