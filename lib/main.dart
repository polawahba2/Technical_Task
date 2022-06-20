import 'package:flutter/material.dart';
import 'package:inovola_technical_task/Views/BookingView.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: BookingView(),
      ),
    ),
  );
}
