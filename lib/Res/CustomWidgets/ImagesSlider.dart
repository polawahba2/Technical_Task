import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inovola_technical_task/ViewModels/BookingViewModel.dart';

import '../Colors/AppColor.dart';

class ImagesSlider extends StatefulWidget {
  BookingViewModel bookingViewModel;
  ImagesSlider({Key? key, required this.bookingViewModel}) : super(key: key);

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        CarouselSlider(
          items: widget.bookingViewModel.images,
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) {
              setState(() {
                widget.bookingViewModel.currentIndex = index;
              });
            },
            height: double.infinity,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayInFiniteScroll: true,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.height * 0.02,
          ),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.share,
                  color: AppColor.white,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                const Icon(
                  Icons.star_border,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.height * 0.02,
          ),
          child: const Align(
            alignment: AlignmentDirectional.topStart,
            child: Icon(
              Icons.navigate_before,
              color: AppColor.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: size.height * 0.02,
            left: size.height * 0.03,
          ),
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: CarouselIndicator(
              count: widget.bookingViewModel.images.length,
              index: widget.bookingViewModel.currentIndex,
              color: AppColor.grey,
              height: size.height * 0.009,
              width: size.width * 0.02,
              activeColor: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
