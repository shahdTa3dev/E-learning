import 'package:auto_route/auto_route.dart';
import 'package:e_learning_app/features/auth/fill_profile_page.dart';
import 'package:e_learning_app/features/auth/login_page.dart';
import 'package:e_learning_app/features/auth/register_page.dart';
import 'package:e_learning_app/features/onboarding/smooth_page_indicator.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: IntroductionRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: FillProfileRoute.page,
        ),
      ];
}
