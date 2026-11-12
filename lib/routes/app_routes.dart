import '../core/app_export.dart';
import '../presentation/loan_options_screen/loan_options_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String loanOptions = '/loan-options';
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.initial,
      builder: (context, state) => const LoanOptionsScreen(),
    ),
  ],
);
