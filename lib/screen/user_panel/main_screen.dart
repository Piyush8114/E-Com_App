import 'package:e_com/screen/user_panel/All-Category-Screen.dart';
import 'package:e_com/screen/user_panel/All-flashsel-product.dart';
import 'package:e_com/screen/user_panel/Cart-Screen.dart';
import 'package:e_com/screen/user_panel/all-product-screen.dart';
import 'package:e_com/utils/app-constant.dart';
import 'package:e_com/widgets/all-product-widget.dart';
import 'package:e_com/widgets/banner-widgets.dart';
import 'package:e_com/widgets/category-widget.dart';
import 'package:e_com/widgets/custom-drawer-widgets.dart';
import 'package:e_com/widgets/flash-sale-widget.dart';
import 'package:e_com/widgets/heading-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class main_screen extends StatelessWidget {
  const main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName,style: TextStyle(color: AppConstant.appTextColor),),
        centerTitle: true,

        actions: [
          GestureDetector(
            onTap: ()=> Get.to(()=> CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart,color: AppConstant.appTextColor,),
            ),
          )
        ],
      ),
      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height/90.0,
              ),
              BannerWidget(),
              // SizedBox(height: Get.height/20,),

              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

              CategoryWidget(),

          HeadingWidget(
          headingTitle: "Flash Screen",
          headingSubTitle: "According to your budget",
          onTap: () => Get.to(() => AllFlashSelProduct()),

          buttonText: "See More >",
        ),

              FlashSaleWidget(),

              HeadingWidget(
                headingTitle: "All Details",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductScreen()),

                buttonText: "See More >",
              ),

              AllProductWidget()

            ],
          ),
        ),
      ),
    );
  }
}
