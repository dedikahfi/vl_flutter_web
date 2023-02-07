import 'package:go_router/go_router.dart';
import 'package:vl/utils/responsive.dart';

import '../pages/faq/faq_narrow.dart';
import '../pages/faq/faq_ultrawide.dart';
import '../pages/faq/faq_wide.dart';
import '../pages/index/index_narrow.dart';
import '../pages/index/index_ultrawide.dart';
import '../pages/index/index_wide.dart';

class RouterApp {
  static var router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ResponsiveApp(
            ultraWideLayoutScaffold: IndexUltrawide(),
            wideLayoutScaffold: IndexWide(),
            narrowLayoutScaffold: IndexNarrow()),
      ),
      GoRoute(
        path: '/faq',
        builder: (context, state) => ResponsiveApp(
            ultraWideLayoutScaffold: FaqUltrawide(),
            wideLayoutScaffold: FaqWide(),
            narrowLayoutScaffold: const FaqNarrow()),
      )
    ],
  );
}
