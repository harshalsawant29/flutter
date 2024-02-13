import 'package:flutter/material.dart';
import '/widgets/new_transaction.dart';
import '/widgets/transactions_list.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', amount: 69.99, date: DateTime.now(), title: 'New Shoes'),
    Transaction(
        id: 't2',
        amount: 50.99,
        date: DateTime.now(),
        title: 'Weekly Groceries'),
  ];

  void _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
        amount: txAmount,
        date: DateTime.now(),
        title: txTitle,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransactions),
        TransactionsList(_userTransactions),
      ],
    );
  }
}
