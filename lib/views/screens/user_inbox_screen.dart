import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/utils/local_storage.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/user_image_picker.dart';
import 'package:empriusapp/views/widgets/user_map.dart';
import 'package:empriusapp/views/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_model.dart';
import '../widgets/inbox_navbar_widget.dart';

class UserInboxScreen extends ConsumerStatefulWidget {
  const UserInboxScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserInboxState();
}

class _UserInboxState extends ConsumerState<UserInboxScreen> {
  int currentIndex = 0;
  onTab(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UserAppbar("Missatges"),
      body: ListView(),
      bottomNavigationBar: InboxNavbarWidget(onTab, currentIndex),
    );
  }
}
