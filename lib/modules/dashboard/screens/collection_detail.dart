import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task/modules/dashboard/widgets/history_widget.dart';
import 'package:test_task/modules/dashboard/widgets/note_widget.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';
import 'package:utility_extensions/extensions/widget_utilities.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../../../generated/assets.dart';
import '../../../models/collection_model.dart';

class CollectionDetail extends StatefulWidget {
  const CollectionDetail({super.key, required this.collection});

  final CollectionModel collection;

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black3,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 30,
              children: [
                headerWidget(),
                genuineWidget(),
                Image(image: AssetImage(Assets.imagesBottle)),
                dataBox(),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                  ),
                  onPressed: (){},
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: AppColors.black3),
                          10.hBox,
                          Text("Add to my collection",
                            style: AppTextStyles.ebGaramond(
                                style: TextStyle(
                                    color: AppColors.black3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: AppColors.black3),
          child: Text(
            "Genesis Collection",
            style: AppTextStyles.lato(
              style: TextStyle(fontSize: 12, color: AppColors.grey1),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            context.pop();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.black3,
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.close, color: AppColors.grey1)),
          ),
        ),
      ],
    );
  }

  Widget genuineWidget() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.black3),
      child: Row(
        spacing: 8,
        children: [
          Image(image: AssetImage(Assets.iconsGenuine), width: 24),
          Expanded(
            child: Text(
              "Genuine Bottle (Unopened)",
              style: AppTextStyles.lato(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey1,
                ),
              ),
            ),
          ),
          Image(image: AssetImage(Assets.iconsArrow), width: 15),
        ],
      ),
    );
  }

  Widget dataBox() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.black1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bottle ${widget.collection.bottleNumber}/${widget.collection.totalBottles}",
            style: AppTextStyles.lato(
              style: TextStyle(fontSize: 12, color: AppColors.grey2),
            ),
          ),

          RichText(
            text: TextSpan(
              text: "${widget.collection.name} ",
              style: AppTextStyles.ebGaramond(
                style: TextStyle(
                  color: AppColors.grey1,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                TextSpan(
                  text: "${DateTime.now().year - widget.collection.year} Year old",
                  style: AppTextStyles.ebGaramond(
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextSpan(text: "\n#${widget.collection.code}"),
              ],
            ),
          ),

          selectionWidget(),

          if (selected == "Details")
            detailsWidget()
          else if (selected == "Tasting Notes")
            notesWidget()
          else
            historyWidget(),
        ],
      ),
    );
  }

  String selected = "Details";

  Widget selectionWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.black2,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          selectionItemWidget("Details"),
          selectionItemWidget("Tasting Notes"),
          selectionItemWidget("History"),
        ],
      ),
    );
  }

  Widget selectionItemWidget(String text) {
    bool isSelected = selected == text;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selected = text;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : null,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(6),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.lato(
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? AppColors.black3 : AppColors.grey3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailsWidget() {
    return Container(
      child: Column(
        children: [
          detailsItemWidget("Distillery", widget.collection.distillery),
          detailsItemWidget("Region", widget.collection.region),
          detailsItemWidget("Country", widget.collection.country),
          detailsItemWidget("Type", widget.collection.type),
          detailsItemWidget("Age statement", widget.collection.ageStatement),
          detailsItemWidget("Filled", widget.collection.filled),
          detailsItemWidget("Bottle", widget.collection.bottled),
          detailsItemWidget("Cask number", widget.collection.caskNumber),
          detailsItemWidget("ABV", widget.collection.abv),
          detailsItemWidget("Size", widget.collection.size),
          detailsItemWidget("Finish", widget.collection.finish),
        ],
      ),
    );
  }

  Widget detailsItemWidget(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.lato(
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Text(
            text,
            style: AppTextStyles.lato(
              style: TextStyle(fontSize: 16, color: AppColors.grey2),
            ),
          ),
        ],
      ),
    );
  }

  Widget notesWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            width: double.infinity,
            color: AppColors.black3,
            child: Center(child: Icon(Icons.play_arrow, color: Colors.white)),
          ),

          20.vBox,
          Text(
            "Tasting notes",
            style: AppTextStyles.ebGaramond(
              style: TextStyle(
                color: AppColors.grey1,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "by Charles MacLean MBE",
            style: AppTextStyles.lato(
              style: TextStyle(color: AppColors.grey2, fontSize: 16),
            ),
          ),


          for(var note in widget.collection.tastingNotes)
            NoteWidget(title: note.title, description: note.description),


          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your notes",
                  style: AppTextStyles.ebGaramond(
                    style: TextStyle(
                      color: AppColors.grey1,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.arrow_back, color: Colors.white),
              ],
            ),
          ),
          for(var note in widget.collection.tastingNotes)
            NoteWidget(title: note.title, description: note.description),
        ],
      ),
    );
  }


  double historyHeight = 0.0;
  Widget historyWidget() {
    return Container(
      child: Stack(
        children: [

          if(historyHeight != 0)...[
            Positioned(
              bottom: 12,
              left: 11.5,
              child: Container(
                width: 1,
                height: historyHeight - 40,
                color: AppColors.primary,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 12 - 1.5,
              child: Transform.rotate(
                angle: 45 * (pi / 180),
                child: Container(
                  width: 3,
                  height: 3,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],

          SizeNotifier(
            size: (size){
              setState(() {
                historyHeight = size.height;
              });
            },
            child: Column(
              children: [
                for(var history in widget.collection.history)
                  HistoryWidget(title: history.title, description: history.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
