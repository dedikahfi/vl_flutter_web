import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vl/sections/footer.dart';
import 'package:vl/utils/themes.dart';

import '../../models/accordion.dart';
import '../../providers/theme_provider.dart';
import '../../sections/appbar.dart';

class FaqUltrawide extends StatelessWidget {
  final scrollController = ScrollController();

  FaqUltrawide({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Accordion> faq = getFaq2();

    return Consumer<ModelTheme>(builder: (context, themeNotifier, child) {
      return Scaffold(
        body: ListView(
          children: [
            AppBarSection().container(context, themeNotifier),

            //faqs
            Container(
              width: MediaQuery.of(context).size.width,
              // color: grayColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: edge * 2, vertical: edge.toDouble()),
                child: Column(
                  children: [
                    Text(
                      'faq.title'.tr(),
                      style: const TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: edge.toDouble() / 2,
                    ),
                    Column(
                      children: faq.map((e) {
                        return ListTileTheme(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: ExpansionTile(
                              collapsedIconColor: whiteColor,
                              collapsedBackgroundColor: greenColor,
                              backgroundColor: greenColor,
                              iconColor: whiteColor,
                              textColor: whiteColor,
                              title: Text(
                                e.title,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: whiteColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: edge.toDouble(),
                                      horizontal: edge.toDouble() / 2,
                                    ),
                                    child: Text(
                                      e.body,
                                      style: blackTextStyle,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const FooterSection()
          ],
        ),
      );
    });
  }
}
