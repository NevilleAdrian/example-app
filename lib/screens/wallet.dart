import 'package:finance_app/constants/constant.dart';
import 'package:finance_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Wallet extends StatelessWidget {
  static String id = 'wallet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: secondaryColor,
          ),
        ),
        actions: [SvgPicture.asset('assets/images/avatar.svg')],
      ),
      body: Padding(
        padding: defaultPadding.copyWith(bottom: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: 'Accounts',
              ),
              Container(
                padding: defaultPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0XFF82C6EB),
                      Color(0XFFC8A9F9),
                      Color(0XFFA0B8F8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [SvgPicture.asset('assets/images/badge.svg')],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upgrade your account',
                          style: whiteColor.copyWith(fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  LinearCards(
                    title: 'Main Wallet',
                    amount: '\$2049.95',
                    percent: ' 32%',
                    color: Colors.red,
                  ),
                  LinearCards(
                    title: 'Savings Wallet',
                    amount: '\$2049.95',
                    percent: ' 32%',
                    color: Colors.green,
                  ),
                  LinearCards(
                    title: 'Summer Wallet',
                    amount: '\$2049.95',
                    percent: ' 32%',
                    color: Colors.purple,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LinearCards extends StatelessWidget {
  const LinearCards({
    Key? key,
    required this.title,
    required this.amount,
    required this.percent,
    required this.color,
  }) : super(key: key);

  final String title;
  final String amount;
  final String percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xffCFECF8).withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 20,
            offset: Offset(0, 5), // changes position of shadow
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: smallPrimaryColor.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount,
                style: headingPrimaryColor.copyWith(fontSize: 20),
              ),
              Text(
                '${color == Colors.red ? '-' : '+'}$percent',
                style: headingPrimaryColor.copyWith(fontSize: 20, color: color),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearPercentIndicator(
                lineHeight: 5.0,
                percent: 0.5,
                progressColor: color,
              ),
            ],
          )
        ],
      ),
    );
  }
}
