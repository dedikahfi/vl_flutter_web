import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:vl/models/healthfacilities.dart';
import 'package:vl/providers/theme_provider.dart';
import 'package:vl/providers/vl_provider.dart';

import '../../models/quotahf.dart';
import '../../utils/components.dart';

class IndexFunction {
  static const KEY_NARROW = 'key_narrow';
  static const KEY_WIDE = 'key_wide';
  static const KEY_ULTRAWIDE = 'key_ultrawide';

  var cekVl = (context,
      HealthFacilities? healthFacilities,
      VlProvider vlProvider,
      ModelTheme themeNotifier,
      String keyPlatform) async {
    String? param = healthFacilities?.healthFacilitiesCode;

    if (param == null) {
      await FirebaseAnalytics.instance.logEvent(
        name: "select_checkvl",
        parameters: {
          "content_type": "button",
          "faskes": 'null',
        },
      );
      ComponentsApp().alertDialogAttention(context);
    } else {
      vlProvider.getQuotaHf(param).then((value) async {
        QuotaHf quotaHf = QuotaHf.fromJson(value);
        if (keyPlatform == KEY_NARROW) {
          ComponentsApp().alertDialogVlMobile(
              context, quotaHf, healthFacilities!, themeNotifier);
        } else {
          ComponentsApp().alertDialogVl(
              context, quotaHf, healthFacilities!, themeNotifier);
        }
        await FirebaseAnalytics.instance.logEvent(
          name: "select_checkvl",
          parameters: {
            "content_type": "button",
            "faskes": param,
          },
        );
      });
    }
  };
}
