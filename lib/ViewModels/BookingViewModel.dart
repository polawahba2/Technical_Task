import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Models/BookingModel.dart';

class BookingViewModel {
  final String buttonTitle = 'قم بالحجز الان';
  final String priceTitle = 'تكلفة الدورة';
  final String countTitle = 'العدد';
  final String occasionDetailsTitle = 'تفاصيل المناسبة';
  final List<Image> images = [
    Image.asset(
      'assets/images/MainImage.png',
      fit: BoxFit.fill,
      width: double.infinity,
    ),
    Image.asset(
      'assets/images/image2.jpg',
      fit: BoxFit.fill,
      width: double.infinity,
    ),
    Image.asset(
      'assets/images/image3.jpg',
      fit: BoxFit.fill,
      width: double.infinity,
    ),
    Image.asset(
      'assets/images/image4.jpg',
      fit: BoxFit.fill,
      width: double.infinity,
    ),
  ];
  var currentIndex = 0;
  String trainerImage = 'assets/images/TrainerImage.jpg';
  BookingModel? bookingModel;

  Future getData() async {
    try {
      var response = await Dio()
          .get('https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34');
      bookingModel = BookingModel.fromJson(response.data);
    } catch (e) {
      // print(e);
    }
  }
}
