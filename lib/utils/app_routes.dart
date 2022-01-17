import 'package:finance_app/screens/accounts.dart';
import 'package:finance_app/screens/home.dart';
import 'package:finance_app/screens/transactions.dart';
import 'package:finance_app/screens/wallet.dart';

var appRoutes = {
  Home.id: (context) => Home(),
  TransactionScreen.id: (context) => TransactionScreen(),
  Account.id: (context) => Account(),
  Wallet.id: (context) => Wallet(),
};
