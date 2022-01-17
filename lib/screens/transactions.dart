import 'package:finance_app/constants/constant.dart';
import 'package:finance_app/data/mock_data.dart';
import 'package:finance_app/screens/accounts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionScreen extends StatelessWidget {
  static const id = 'trans';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: defaultVHPadding.copyWith(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$5623,67',
                      style: headingPrimaryColor.copyWith(fontSize: 48),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'June 01, 2019',
                      style: smallPrimaryColor.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      defaultVHPadding.copyWith(top: 30.0, left: 5, right: 5),
                  child: Image.asset('assets/images/graph.png')),
              Padding(
                  padding: defaultPadding,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Accounts', style: headingPrimaryColor),
                          SvgPicture.asset('assets/images/grey-dot.svg')
                        ],
                      ),
                    ],
                  )),
              InkWell(
                onTap: () => Navigator.pushNamed(context, Account.id),
                child: Cards(
                  data: account,
                  type: 'account',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({required this.data, required this.type});

  List<Map<String, String>> data;
  String type;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: type == 'account' ? 160 : 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffCFECF8).withOpacity(0.6),
              spreadRadius: 3,
              blurRadius: 20,
              offset: Offset(0, 5), // changes position of shadow
            )
          ],
        ),
        padding: defaultVHPadding.copyWith(
            // top: 30.0,
            left: 20,
            right: 0,
            bottom: 0,
            top: 0),
        child: ListView.separated(
          separatorBuilder: (context, _) => const SizedBox(
            width: 30.0,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> acc = data[index];

            return Container(
              width: 225,
              padding: defaultPadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      type == 'account'
                          ? Text(acc['icon'],
                              style: smallPrimaryColor.copyWith(fontSize: 48))
                          : SvgPicture.asset(acc['icon']),
                      type == 'account'
                          ? SvgPicture.asset('assets/images/3dot.svg')
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    acc['amount'],
                    style: headingPrimaryColor.copyWith(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    acc['date'],
                    style: smallPrimaryColor.copyWith(fontSize: 10.0),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
