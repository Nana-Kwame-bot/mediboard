import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:mediboard/logger/logger.dart";

class MediAutoRouteObserver extends AutoRouterObserver {
  @override
  Future<void> didPush(Route<void> route, Route<void>? previousRoute) async {
    logger.t(
      "New route pushed: ${route.settings.name} from ${previousRoute?.settings.name}",
    );
  }

  // Only override to observer tab routes.
  @override
  Future<void> didInitTabRoute(
    TabPageRoute route,
    TabPageRoute? previousRoute,
  ) async {
    logger.t("Tab route visited: ${route.name}");
  }

  @override
  Future<void> didChangeTabRoute(
    TabPageRoute route,
    TabPageRoute previousRoute,
  ) async {
    logger.t("Tab route re-visited: ${route.name}");
  }

  @override
  Future<void> didPop(Route<void> route, Route<void>? previousRoute) async {
    logger.t("Route popped: ${route.settings.name}");
  }

  @override
  Future<void> didRemove(Route<void> route, Route<void>? previousRoute) async {
    logger.t("Route removed: ${route.settings.name}");
  }

  @override
  Future<void> didReplace({
    Route<void>? newRoute,
    Route<void>? oldRoute,
  }) async {
    logger.t("Route replaced: ${newRoute?.settings.name}");
  }
}
