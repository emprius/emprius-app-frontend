import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/utils/local_storage.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/bottom_image_selector.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:empriusapp/views/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_model.dart';

class UserActivityScreen extends ConsumerStatefulWidget {
  const UserActivityScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserActivityState();
}

class _UserActivityState extends ConsumerState<UserActivityScreen> {

  @override
  Widget build(BuildContext context) {
    //var user = ref.watch(userProvider);
    //final user = UserPreferences.getUser();

    return Scaffold(
      appBar: UserAppbar("La meva activitat"),
      body: Container(
        color: Colors.teal,
      )
    );
  }
}



