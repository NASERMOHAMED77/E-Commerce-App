
import 'package:flutter/material.dart';
import 'package:shopapp/view/constants.dart';

class Account extends StatelessWidget {
  Account({Key? key, required this.text, required this.icon}) : super(key: key);
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: Const().styletitlesproduct,
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        Container(
          height: .4,
          color: Colors.grey,
        ),
      ],
    );
  }
}
