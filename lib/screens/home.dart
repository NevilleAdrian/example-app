import 'package:finance_app/constants/constant.dart';
import 'package:finance_app/data/mock_data.dart';
import 'package:finance_app/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  static const String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: secondaryColor,
        ),
        actions: [SvgPicture.asset('assets/images/avatar.svg')],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              title: 'Cards',
            ),
            SizedBox(
              height: 200, // card height
              child: PageView.builder(
                itemCount: 10,
                controller: PageController(viewportFraction: 0.85),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: Container(
                      padding: defaultPadding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/images/visa.svg'),
                              SvgPicture.asset('assets/images/3dot.svg'),
                            ],
                          ),
                          Text(
                            '88842  2394  2399  1293',
                            style: headingPrimaryColor.copyWith(
                                color: Colors.white, fontSize: 22.0),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Card Holder',
                                    style: whiteColor.copyWith(fontSize: 10.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text('Emma Larsen', style: whiteColor),
                                ],
                              ),
                              const SizedBox(
                                width: 50.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expiry',
                                    style: whiteColor.copyWith(fontSize: 10.0),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text('06/22', style: whiteColor),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: defaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Transactions', style: headingPrimaryColor),
                  SvgPicture.asset('assets/images/grey-dot.svg')
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: transactions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, String> trans = transactions[index];
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, TransactionScreen.id),
                      child: Tiles(
                        icon: trans['icon'],
                        leading: trans['leading'],
                        trailing: trans['trailing'],
                        amount: trans['amount'],
                        date: trans['date'],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: headingPrimaryColor,
          ),
          Row(
            children: [
              Text(
                'ADD NEW',
                style: smallPrimaryColor,
              ),
              const SizedBox(
                width: 5.0,
              ),
              const Icon(
                Icons.add,
                color: secondaryColor,
                size: 14,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  Tiles({
    required this.icon,
    required this.leading,
    required this.trailing,
    required this.amount,
    required this.date,
  });

  final dynamic icon;
  final dynamic leading;
  final dynamic trailing;
  final dynamic amount;
  final dynamic date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset(
                    icon,
                    height: 30,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffCFECF8).withOpacity(0.4),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leading,
                    style: headingPrimaryColor.copyWith(
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    trailing,
                    style: smallPrimaryColor.copyWith(fontSize: 10),
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: headingPrimaryColor.copyWith(
                    color: const Color(0XFFEE6B8D), fontSize: 16),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                date,
                style: smallPrimaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
