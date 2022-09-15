import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentBookingsScreen extends ConsumerStatefulWidget {
  const CurrentBookingsScreen({Key? key}) : super(key: key);

  @override
  createState() => _CurrentBookingsScreenState();
}

class _CurrentBookingsScreenState extends ConsumerState<CurrentBookingsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UserAppbar("En curs"),
      body: ListView(),
    );
  }
}
