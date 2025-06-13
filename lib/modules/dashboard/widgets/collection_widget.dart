import 'package:flutter/material.dart';
import 'package:test_task/models/collection_model.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';
import 'package:utility_extensions/extensions/context_extensions.dart';

import '../../../generated/assets.dart';
import '../screens/collection_detail.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({Key? key, required this.collection}) : super(key: key);

  final CollectionModel collection;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.push(child: CollectionDetail(collection: collection,));
      },
      child: Container(
        decoration: BoxDecoration(color: AppColors.black1),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image(image: AssetImage(Assets.imagesBottle))),
            Container(
              padding: EdgeInsets.all(16).copyWith(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(collection.name,
                    style: AppTextStyles.ebGaramond(
                      style: TextStyle(color: AppColors.grey1,
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  Text("${collection.year} #${collection.code}",
                    style: AppTextStyles.ebGaramond(
                      style: TextStyle(color: AppColors.grey1,
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  Text("(${collection.bottleNumber}/${collection.totalBottles})",
                    style: AppTextStyles.ebGaramond(
                      style: TextStyle(color: AppColors.textWhite,
                        fontSize: 12,
                      )
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
}
