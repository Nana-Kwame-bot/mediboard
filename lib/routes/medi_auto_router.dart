import "package:auto_route/auto_route.dart";
import "package:mediboard/routes/medi_auto_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class MediAutoRouter extends $MediAutoRouter {
  MediAutoRouter();

  @override
  List<AutoRoute> get routes {
    return [AutoRoute(page: HomePage.page, initial: true)];
  }
}
