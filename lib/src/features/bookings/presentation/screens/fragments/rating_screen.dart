import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingScreen extends ConsumerStatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UserAppbar("Rating"),
      body: ListView(),
    );
  }
}
