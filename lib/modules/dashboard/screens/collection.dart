import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/modules/dashboard/bloc/collection_bloc.dart';
import 'package:test_task/modules/dashboard/bloc/collection_state.dart';
import 'package:test_task/modules/dashboard/widgets/collection_widget.dart';
import 'package:test_task/utils/app_text_styles.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        if (!state.networkEnabled) {
          return Center(child: Text("No Internet Connection",
            style: AppTextStyles.ebGaramond(
              style: TextStyle(
                color: AppColors.grey1,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),);
        }
        return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My collection",
                      style: AppTextStyles.ebGaramond(
                        style: TextStyle(
                          color: AppColors.grey1,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Image(
                      image: AssetImage(Assets.iconsNotification),
                      width: 40,
                    ),
                  ],
                ),

                Expanded(
                  child: state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 24),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.52173913043,
                              ),
                          itemBuilder: (ctx, i) {
                            return CollectionWidget(
                              collection: state.collection[i],
                            );
                          },
                          itemCount: state.collection.length,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
