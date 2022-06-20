import 'package:flutter/material.dart';
import 'package:inovola_technical_task/Res/CustomWidgets/VirticallySpace.dart';
import 'package:intl/intl.dart';

import '../../Models/BookingModel.dart';
import '../../ViewModels/BookingViewModel.dart';
import '../Colors/AppColor.dart';
import '../TextStyle/TextStyles.dart';
import 'SeparatorContainer.dart';

class ScreenDetailsBuilder extends StatelessWidget {
  const ScreenDetailsBuilder({
    Key? key,
    required this.myObject,
    required this.size,
    required this.dateTime,
    required this.bookingViewModel,
  }) : super(key: key);

  final BookingModel myObject;
  final Size size;
  final DateTime dateTime;
  final BookingViewModel bookingViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''#${myObject.interest}\n${myObject.reservTypes![0].name}''',
                style: secoundTextStyle(context),
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: AppColor.grey,
                    size: size.height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      DateFormat.yMMMEd().format(dateTime),
                      style: secoundTextStyle(context),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColor.grey,
                    size: size.height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${myObject.address}',
                      style: secoundTextStyle(context),
                    ),
                  ),
                ],
              ),
              VirticallySpace(number: 0.02),
              const SeparatorContainer(),
              VirticallySpace(),
              Row(
                children: [
                  CircleAvatar(
                    radius: size.height * 0.025,
                    backgroundImage: AssetImage(
                      bookingViewModel.trainerImage,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    '${myObject.trainerName}',
                    style: headLineStyle(context),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: Text(
                  '${myObject.trainerInfo}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: secoundTextStyle(context),
                ),
              ),
              const SeparatorContainer(),
              Text(
                bookingViewModel.occasionDetailsTitle,
                style: headLineStyle(context),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.16,
                child: Text(
                  '${myObject.occasionDetail}'.replaceAll('\n', ''),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: secoundTextStyle(context),
                ),
              ),
              VirticallySpace(),
              const SeparatorContainer(),
              VirticallySpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bookingViewModel.priceTitle,
                    style: secoundTextStyle(context),
                  ),
                  Text(
                    '${myObject.price}',
                    style: secoundTextStyle(context),
                  ),
                ],
              ),
              VirticallySpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bookingViewModel.countTitle,
                    style: secoundTextStyle(context),
                  ),
                  Text(
                    '${myObject.reservTypes![0].count}',
                    style: secoundTextStyle(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
