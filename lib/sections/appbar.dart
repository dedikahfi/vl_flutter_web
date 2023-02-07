import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vl/constants/references.dart';

import '../utils/components.dart';
import '../utils/themes.dart';

class AppBarSection {
  String menuHome = 'menu.home'.tr();
  String menuQuota = 'menu.quota'.tr();
  String menuFaq = 'menu.faq'.tr();
  String menuAdmin = 'menu.admin'.tr();

  container(context, themeNotifier) =>
      LayoutBuilder(builder: (context, constraints) {
        //ontap menu
        onTapFaq() => context.go('/faq');
        onTapHome() => context.go('/');
        onTapYki() async {
          Uri uri = Uri.https(urlToYki);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.platformDefault);
          } else {
            throw 'Could not launch $uri';
          }
        }

        //body appbar
        if (constraints.maxWidth > dimenUltraWide ||
            constraints.maxWidth > dimenWide) {
          //UltraWide & wide layout
          return SizedBox(
            height: 64,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth > dimenUltraWide
                      ? edge * 2
                      : edge.toDouble()),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: themeNotifier.isDark
                        ? ComponentsApp().logoAppLight
                        : ComponentsApp().logoAppDark,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: InkWell(
                              onTap: onTapYki,
                              child: Text(
                                menuHome,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: InkWell(
                              onTap: onTapHome,
                              child: Text(
                                menuQuota,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: InkWell(
                              onTap: onTapFaq,
                              child: Text(
                                menuFaq,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Builder(builder: ((context) {
                      return IconButton(
                        icon: Icon(
                            Theme.of(context).brightness == Brightness.light
                                ? Icons.light_mode
                                : Icons.dark_mode),
                        onPressed: () {
                          themeNotifier.isDark
                              ? themeNotifier.isDark = false
                              : themeNotifier.isDark = true;
                        },
                      );
                    })),
                  )
                ],
              ),
            ),
          );
        } else {
          return Drawer(
            child: Column(children: [
              DrawerHeader(
                  child: IconButton(
                icon: Icon(Theme.of(context).brightness == Brightness.light
                    ? Icons.light_mode
                    : Icons.dark_mode),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
              )),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: Text(menuHome),
                onTap: onTapYki,
              ),
              ListTile(
                leading: const Icon(Icons.ac_unit_sharp),
                title: Text(menuQuota),
                onTap: onTapHome,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(menuFaq),
                onTap: onTapFaq,
              ),
            ]),
          );
        }
      });
}
