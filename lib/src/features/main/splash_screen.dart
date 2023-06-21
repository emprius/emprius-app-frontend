import 'package:empriusapp/src/features/main/auth_widget_builder.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final _cacheLoaderFutureProvider = FutureProvider.autoDispose<void>(
      (ref) async {
    await Future.wait([
      ref.watch(authProvider.notifier).loadUserAuthDataInMemory(),
      // ref.watch(authProvider.notifier).loadUserAuthDataInMemory(),
      // ref.watch(interestsProvider).loadInterestsInMemory(),
      // ref.watch(timeslotsProvider).loadTimeslotsInMemory(),
      // ref.watch(hobbiesProvider).loadHobbiesInMemory(),
      // ref.watch(campusesProvider).loadCampusesInMemory(),
      // ref.watch(programsProvider).loadProgramsInMemory(),
      // ref.watch(studentStatusesProvider).loadStudentStatusesInMemory(),
      // ref.watch(reactionTypesProvider).loadReactionTypesInMemory(),
      // ref.watch(campusSpotsProvider).loadCampusSpotsInMemory(),
    ]);
  },
);

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheLoaderFuture = ref.watch(_cacheLoaderFutureProvider);
    return cacheLoaderFuture.when(
      data: (_) => const AuthWidgetBuilder(),
      loading: () => const LottieAnimationLoader(),
      error: (error, st) => const Scaffold(
        body: Text("Error"),
        // todo(kon): implement error routes
        // ErrorResponseHandler(
        //   error: error,
        //   retryCallback: () => ref.refresh(_cacheLoaderFutureProvider),
        //   stackTrace: st,
        // ),
      ),
    );
  }
}


class LottieAnimationLoader extends StatelessWidget {
  const LottieAnimationLoader({super.key});

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
