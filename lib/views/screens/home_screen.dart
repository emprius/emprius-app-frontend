import 'package:empriusapp/routes/routes.dart';
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
      appBar: AppBar(
        title: const Text('Future widget navbar'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.person),
          tooltip: 'El meu perfil',
          onPressed: (){
                Navigator.pushNamed(context, userProfileScreenRoute);
          },
          )],
      ),
      body: const Text("Home Screen"),
    );
  }
}
