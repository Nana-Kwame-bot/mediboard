import "package:bloc/bloc.dart";
import "package:mediboard/logger/logger.dart";

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.t("onChange(${bloc.runtimeType}, ${change.runtimeType})");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.e("onError(${bloc.runtimeType}, $error, $stackTrace)");
    super.onError(bloc, error, stackTrace);
  }
}
