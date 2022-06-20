import 'package:flutter/material.dart';

class VirticallySpace extends StatelessWidget {
  dynamic number = 0.01;
  VirticallySpace({Key? key, number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * number,
    );
  }
}
