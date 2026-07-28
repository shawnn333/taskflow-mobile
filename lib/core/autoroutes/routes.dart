import 'package:auto_route/auto_route.dart';
import 'package:taskflow_mobile/core/autoroutes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TodoRoute.page, initial: true),
      ];
}
