import 'package:e_commmerce_addtocart/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/view/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => home_provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => home_screen(),
        },
      ),
    ),
  );
}