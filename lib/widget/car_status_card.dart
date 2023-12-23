import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:mod_android/theme.dart';

class CarStatusCard extends StatelessWidget {
  final String lable;
  final String icon;
  final String value;
  const CarStatusCard(this.lable, this.icon, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isTextOverflow = value.length > 25;
    return Container(
      height: 67,
      width: 239,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: statusCardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: primaryTextStyle.copyWith(
              fontSize: 10,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Image.asset(
                icon,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5.8,
                height: 20,
                child: isTextOverflow
                    ? Marquee(
                        text: value,
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        blankSpace: 30.0, // Adjust the blankSpace as needed
                      )
                    : Text(
                        value,
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
