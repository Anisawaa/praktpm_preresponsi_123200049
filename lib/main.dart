import 'package:flutter/material.dart';
import 'view/dashboard.dart';
import 'model/selected_weapon.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedWeapon>(
      create: (_) => SelectedWeapon(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Genshin Impact App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Dashboard(),
      ),
    );
  }
}

