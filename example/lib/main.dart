import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:test_pl/test_pl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // DataHelper().isNullOrBlank('val');
    dynamic checkValue = DataHelper.isNullOrBlank('val');
    print('checkValue, $checkValue');

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await DataHelper.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            Center(
              child: Text('Check Value is Null: ${DataHelper.isNullOrBlank('')}\n'),
            ),
            Center(
              child: Text('isInteger("1"): ${DataHelper.isInteger('1')}\n'),
            ),
            Center(
              child: Text('isNumeric("1.2"): ${DataHelper.isNumeric('1')}\n'),
            ),
            Center(
              child: Text('Running on: ${DataHelper.toNumber('100')}\n'),
            ),
            //[10, '', '', null, 20, 0, 40, 50, false]
            Center(
              child: Text('Concat : ${DataHelper.concat([1], [3])}\n'),
            ),
            Center(
              child: Text('Difference From First : ${DataHelper.differenceFromFirst([
                    {'a': 1},
                    2,
                    3,
                    4,
                    5,
                    6,
                    7
                  ], [
                    3,
                    5,
                    4,
                    11,
                    6,
                    7,
                    9
                  ])}\n'),
            ),
            Center(
              child: Text('Difference : ${DataHelper.difference([
                    {'a': 1},
                    2,
                    3,
                  ], [
                    3,
                    5,
                    {'b': 4},
                    11
                  ])}\n'),
            ),
            Center(
              child: Text('remove At : ${DataHelper.removeAt([1, 2, 3, 4, 5], 2)}\n'),
            ),

            Center(
              child: Text('Find Index : ${DataHelper.findIndex([
                    {'abc': 'Nitin2', 't': '1'},
                    {'abc': 'Nitin3', 't': '1'},
                    {'abc': 'Nitin', 't': '1'},
                    {'abc': 'Nitin', 't': '1'},
                    // {'abc': 'Nitin'},
                    // {'abc': 'krushant'},
                  ], {
                    'abc': 'Nitin',
                    't': '1'
                  })}\n'),
            ),

            /// findLastIndex
            Center(
              child: Text('Last Index : ${DataHelper.findLastIndex([
                    {'abc': 'Nitin2'},
                    {'abc': 'Nitin', 'text': '2'},
                    {'abc': 'Nitin', 'text': '1'},
                    {'abc': 'krushant', 'text': '2'},
                    {'abc': 'Nitin', 'text': '2'},
                  ], {
                    'abc': 'Nitin',
                    'text': '2'
                  })}\n'),
            ),

            /// contains
            Center(
              child: Text('Contains : ${DataHelper.contains([1, 2, 3, 4, 6, 7], 5)}\n'),
            ),

            /// containsfromList
            Center(
              child: Text('Contains From List : ${DataHelper.containsfromList({1: 'Jupiter', 2: 'Saturn'}, 'Jupiter')}\n'),
            ),

            /// fold
            ///  ${DataHelper.fold([10, 2, 5, 0.5])}
            ///   ${DataHelper.fold([10, 2, 5, 0.5],initialValue: 100)}
            Center(
              child: Text('Fold : ${DataHelper.fold([10, 2, 5, 0.5], initialValue: 100)}\n'),
            ),

            ///skip
            Center(
              child: Text('Skip : ${DataHelper.skip([10, 2, 5, 0.5], 2)}\n'),
            ),

            ///take
            Center(
              child: Text('take : ${DataHelper.take([10, 2, 5, 0.5], 4)}\n'),
            ),

            ///join
            Center(
              child: Text('join : ${DataHelper.join([10, 2, 5, 0.5], '-')}\n'),
            ),

            ///last
            Center(
              child: Text('last : ${DataHelper.last([10, 2, 5, 0.5])}\n'),
            ),

            ///first
            Center(
              child: Text('first : ${DataHelper.first([10, 2, 5, 0.5])}\n'),
            ),

            ///remove
            Center(
              child: Text('remove : ${DataHelper.remove([
                    {'abx': 1},
                    {'abx': 2},
                    {'abx': 3}
                  ], [
                    {'abx': 2}
                  ])}\n'),
            ),
          ],
        ),
      ),
    );
  }
}
