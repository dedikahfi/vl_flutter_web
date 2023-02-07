import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vl/sections/footer.dart';

import '../../models/accordion.dart';
import '../../providers/theme_provider.dart';
import '../../sections/appbar.dart';
import '../../utils/themes.dart';

class FaqNarrow extends StatelessWidget {
  const FaqNarrow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Accordion> faq = getFaq2();

    return Consumer<ModelTheme>(builder: (context, themeNotifier, child) {
      return Scaffold(
        appBar: appbar(),
        endDrawer: AppBarSection().container(context, themeNotifier),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: edge.toDouble(),
                  ),
                  Center(
                    child: Text(
                      'faq.title'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    children: faq.map((e) {
                      return ListTileTheme(
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 8, left: 32, right: 32),
                          child: ExpansionTile(
                            collapsedIconColor: whiteColor,
                            collapsedBackgroundColor: greenColor,
                            backgroundColor: greenColor,
                            iconColor: whiteColor,
                            textColor: whiteColor,
                            title: Text(
                              e.title,
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
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
                  SizedBox(
                    height: edge.toDouble(),
                  ),
                ],
              ),
            ),

            //footer
            const FooterSection(),
          ],
        ),
      );
    });
  }
}
