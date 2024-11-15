import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart' as carousel;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com/controller/banner-controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final carousel.CarouselController carouselController = carousel.CarouselController(); // Use aliased import
  final bannersController _bannerController = Get.put(bannersController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return CarouselSlider(
          items: _bannerController.bannerUrls.map((imageUrls) => ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: imageUrls,
              fit: BoxFit.cover,
              width: Get.width - 10,
              placeholder: (context, url) => ColoredBox(
                color: Colors.white,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 2.5,
            viewportFraction: 1,
          ),
        );
      }),
    );
  }
}
