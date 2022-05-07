import 'package:flutter/material.dart';

import '../../constants.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget(
    this.check, {
    Key? key,
  }) : super(key: key);
  final bool? check;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Card(
        shape: const RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.white)),
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Result", style: cTextStyleTitle.copyWith(fontSize: 40)),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: (check == null)
                    ? Colors.transparent
                    : (check!)
                        ? Colors.green
                        : Colors.red,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
