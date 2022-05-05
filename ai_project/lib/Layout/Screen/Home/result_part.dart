import 'package:flutter/material.dart';

import '../../constants.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Result", style: cTextStyleTitle.copyWith(fontSize: 40)),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
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
