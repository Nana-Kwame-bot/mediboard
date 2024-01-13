import "dart:async";

import "package:bloc/bloc.dart";
import "package:flutter/widgets.dart";
import "package:mediboard/bloc_observer/app_bloc_observer.dart";
import "package:mediboard/logger/logger.dart";

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    logger.e(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder());
}
