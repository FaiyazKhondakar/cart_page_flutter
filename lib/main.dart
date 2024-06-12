import 'package:cart_page/MyBagRoute.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/myBag',
      routes: {
        '/myBag' :(context)=>MyBagRoute(),

      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
                color: Colors.black,
                size: 30
            )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.red.shade600,
          ),

        ),
        // primarySwatch: Colors.black,
      ),
    );
  }

}




