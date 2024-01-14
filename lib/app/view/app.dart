import "package:flutter/material.dart";
import "package:mediboard/blocs/medi_blocs.dart";
import "package:mediboard/l10n/l10n.dart";
import "package:mediboard/routes/medi_auto_router.dart";
import "package:mediboard/routes/observer/medi_auto_route_observer.dart";
import "package:mediboard/theme/app_text_theme.dart";

final _appRouter = MediAutoRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.textTheme;

    return MediBlocs(
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          textTheme: textTheme,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [MediAutoRouteObserver()],
        ),
        builder: (context, router) {
          return router ?? const Text("This error should never happen");
        },
      ),
    );
  }
}
