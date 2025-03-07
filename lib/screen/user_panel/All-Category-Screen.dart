import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/model/product-model.dart';
import 'package:e_com/screen/user_panel/AllSingleCategoryProduct.dart';
import 'package:e_com/screen/user_panel/product-details-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import '../../model/CategoryModel.dart';
import '../../utils/app-constant.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppConstant.appTextColor,
          ),
          backgroundColor: AppConstant.appMainColor,
          title: Text(
            "All Categories",
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('categories').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("No category found"),
              );
            }
            if (snapshot.data != null) {
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1
                  ),
                itemBuilder: (context, index) {
                  CategoriesModel categoriesModel = CategoriesModel(
                    categoryId: snapshot.data!.docs[index]['categoryId'],
                    categoryImg: snapshot.data!.docs[index]['categoryImg'],
                    categoryName: snapshot.data!.docs[index]['categoryName'],
                    createdAt: snapshot.data!.docs[index]['createdAt'],
                    updatedAt: snapshot.data!.docs[index]['updateAt'],
                  );

                  // print("Category Image URL: ${categoriesModel.categoryImg}"); // Debug statement


                  return GestureDetector(
                    onTap: () => Get.to(()=>AllSingleCategoryProductsScreen(
                        categoryId: categoriesModel.categoryId,
                    ),),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),

                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 2.3,
                              heightImage: Get.height /8,
                              imageProvider: CachedNetworkImageProvider(
                                  categoriesModel.categoryImg),
                              title: Center(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    categoriesModel.categoryName,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )),
                              // footer: Text(''),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );

            }
            return Container();
          },
        ));
  }
}
