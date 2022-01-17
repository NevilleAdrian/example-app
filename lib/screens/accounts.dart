import 'package:finance_app/constants/constant.dart';
import 'package:finance_app/data/mock_data.dart';
import 'package:finance_app/screens/transactions.dart';
import 'package:finance_app/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum timeState {
  daily,
  weekly,
  monthly,
}

class Account extends StatefulWidget {
  static const id = 'account';

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  timeState state = timeState.daily;
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
        actions: [
          SvgPicture.asset(
            'assets/images/avatar.svg',
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Padding(
                padding: defaultPadding.copyWith(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Pills(
                        text: 'Daily',
                        decoration: state == timeState.daily
                            ? BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffCFECF8).withOpacity(0.6),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  )
                                ],
                                borderRadius: state == timeState.daily
                                    ? BorderRadius.circular(30)
                                    : BorderRadius.zero)
                            : BoxDecoration(),
                        onTap: () {
                          setState(() {
                            state = timeState.daily;
                          });
                        }),
                    Pills(
                        text: 'Weekly',
                        decoration: state == timeState.weekly
                            ? BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffCFECF8).withOpacity(0.6),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  )
                                ],
                                borderRadius: state == timeState.weekly
                                    ? BorderRadius.circular(30)
                                    : BorderRadius.zero)
                            : BoxDecoration(),
                        onTap: () {
                          setState(() {
                            state = timeState.weekly;
                            print('state: $state');
                          });
                        }),
                    Pills(
                        text: 'Monthly',
                        decoration: state == timeState.monthly
                            ? BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffCFECF8).withOpacity(0.6),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  )
                                ],
                                borderRadius: state == timeState.monthly
                                    ? BorderRadius.circular(30)
                                    : BorderRadius.zero)
                            : BoxDecoration(),
                        onTap: () {
                          setState(() {
                            state = timeState.monthly;
                            print('state: $state');
                          });
                        }),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Week 3',
                    style: headingPrimaryColor.copyWith(
                        fontSize: 48, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'June 18 - June 25',
                    style: smallPrimaryColor.copyWith(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Image.asset(
                  'assets/images/stats.png',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, Wallet.id),
                child: Cards(
                  data: expenditure,
                  type: '',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Pills extends StatelessWidget {
  Pills({
    required this.text,
    required this.decoration,
    required this.onTap,
  });

  final String text;
  final BoxDecoration decoration;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            defaultPadding.copyWith(left: 30, right: 30, top: 10, bottom: 10),
        decoration: decoration,
        child: Center(
            child: Text(
          text,
          style: smallPrimaryColor.copyWith(fontSize: 16),
        )),
      ),
    );
  }
}
