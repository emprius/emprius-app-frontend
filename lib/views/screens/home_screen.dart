import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/user_drawer.dart';
import 'package:empriusapp/views/widgets/custom_map.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppbar("Home"),
      drawer: UserDrawer(),
      body: Column(
          children: [
            Text("Home Screen"),
            Expanded(child: CustomMap()),
        ],
      ),
    );
  }
}
