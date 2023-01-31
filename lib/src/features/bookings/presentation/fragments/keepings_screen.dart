import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeepingsScreen extends ConsumerStatefulWidget {
  const KeepingsScreen({Key? key}) : super(key: key);

  @override
  createState() => _KeepingsScreenState();
}

class _KeepingsScreenState extends ConsumerState<KeepingsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UserAppbar("Custodies"),
      drawer: UserDrawer(),
      body: Text("Mostrar eines custodiades"),
    );
  }
}
