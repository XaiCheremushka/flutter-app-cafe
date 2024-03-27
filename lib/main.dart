import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/data_buy_products.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course/src/app.dart';


void main() {
  runZonedGuarded(() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DataBuyProducts()),
        ],
        child: const CoffeeShopApp(),
      ),
  ), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

