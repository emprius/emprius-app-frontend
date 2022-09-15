import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/user_activity_navbar.dart';

class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(),
    );
  }
}
