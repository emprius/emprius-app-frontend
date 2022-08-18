import 'package:empriusapp/features/user/views/widgets/user_appbar.dart';
import 'package:empriusapp/features/user/views/widgets/user_drawer.dart';
import 'package:empriusapp/core/widgets/common/emprius_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../user/providers/user_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    return Scaffold(
      appBar: UserAppbar("Home"),
      drawer: UserDrawer(),
      body: Column(
          children: [
            Text("Home Screen"),
            Expanded(child: EmpriusMap(
              initialCenter: user.location,
            )),
        ],
      ),
    );
  }
}
