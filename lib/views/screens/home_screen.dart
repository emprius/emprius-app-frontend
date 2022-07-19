import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/user_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UserAppbar(),
      drawer: UserDrawer(),
      body: Text("Home Screen"),
    );
  }
}
