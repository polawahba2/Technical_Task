import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inovola_technical_task/Models/BookingModel.dart';
import 'package:inovola_technical_task/Res/Colors/AppColor.dart';
import 'package:inovola_technical_task/Res/CustomWidgets/ImagesSlider.dart';
import 'package:inovola_technical_task/Res/CustomWidgets/SeparatorContainer.dart';
import 'package:inovola_technical_task/Res/CustomWidgets/VirticallySpace.dart';
import 'package:inovola_technical_task/Res/TextStyle/ResponsiveTextSize.dart';
import 'package:inovola_technical_task/ViewModels/BookingViewModel.dart';
import 'package:intl/intl.dart';

import '../Res/CustomWidgets/ScreenDetailsBuilder.dart';
import '../Res/TextStyle/TextStyles.dart';

class BookingView extends StatefulWidget {
  BookingView({Key? key}) : super(key: key);

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  var bookingViewModel = BookingViewModel();

  late Future dataFuture;
  @override
  void initState() {
    dataFuture = bookingViewModel.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 13,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.33,
                  width: double.infinity,
                  child: ImagesSlider(
                    bookingViewModel: bookingViewModel,
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: dataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.waiting) {
                        var date = bookingViewModel.bookingModel!.date;
                        var dateTime = DateTime.parse(date.toString());
                        var myObject = bookingViewModel.bookingModel!;

                        return ScreenDetailsBuilder(
                          myObject: myObject,
                          size: size,
                          dateTime: dateTime,
                          bookingViewModel: bookingViewModel,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColor.buttonColor,
              child: Center(
                  child: Text(
                bookingViewModel.buttonTitle,
                style: const TextStyle(
                  color: AppColor.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
