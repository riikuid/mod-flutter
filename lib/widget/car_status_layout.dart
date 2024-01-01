// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mod_android/model/car_status.dart';
import 'package:mod_android/provider/car_status_provider.dart';
import 'package:mod_android/theme.dart';
import 'package:mod_android/widget/car_status_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CarStatusLayout extends StatefulWidget {
  const CarStatusLayout({Key? key}) : super(key: key);

  @override
  State<CarStatusLayout> createState() => _CarStatusLayoutState();
}

class _CarStatusLayoutState extends State<CarStatusLayout> {
  CarStatus? carStatus;
  Timer? timer;

  @override
  void initState() {
    getCarStatus();
    timer = Timer.periodic(Duration(seconds: 60), (Timer t) => getCarStatus());
    super.initState();
  }

  Future<void> getCarStatus() async {
    try {
      await Provider.of<CarStatusProvider>(context, listen: false)
          .getCarStatus();
      setState(() {
        carStatus =
            Provider.of<CarStatusProvider>(context, listen: false).carStatus;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<CarStatusProvider>(context, listen: false).getCarStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator or circular progress while waiting for data
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stasiun Asal",
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
                            "assets/icon_asal.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stasiun Berikutnya",
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
                            "assets/icon_train.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stasiun Tujuan",
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
                            "assets/icon_tujuan.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Suhu Ruangan",
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
                            "assets/icon_suhu.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          // Show an error message if there's an error
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CarStatusCard(
                  'Stasiun Asal',
                  "assets/icon_asal.png",
                  "Error 404",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarStatusCard(
                  'Stasiun Berikutnya',
                  "assets/icon_train.png",
                  "Error 404",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarStatusCard(
                  'Stasiun Tujuan',
                  "assets/icon_tujuan.png",
                  "Error 404",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarStatusCard(
                  'Suhu Ruangan',
                  "assets/icon_suhu.png",
                  "Error 404",
                ),
              ),
            ],
          );
        } else if (carStatus != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CarStatusCard(
                  'Stasiun Asal',
                  "assets/icon_asal.png",
                  carStatus!.origin,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarStatusCard(
                  'Stasiun Berikutnya',
                  "assets/icon_train.png",
                  carStatus!.nextStation,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarStatusCard(
                  'Stasiun Tujuan',
                  "assets/icon_tujuan.png",
                  carStatus!.destination,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarStatusCard(
                  'Suhu Ruangan',
                  "assets/icon_suhu.png",
                  "${carStatus!.temperature}\u00B0 C",
                ),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stasiun Asal",
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
                            "assets/icon_asal.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stasiun Berikutnya",
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
                            "assets/icon_train.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stasiun Tujuan",
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
                            "assets/icon_tujuan.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 67,
                  width: 239,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundSecondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Suhu Ruangan",
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
                            "assets/icon_suhu.png",
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: backgroundSecondary,
                            highlightColor: Colors.white24,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5.8,
                              height: 20,
                              color: backgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
