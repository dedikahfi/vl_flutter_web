import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vl/models/accordion.dart';
import 'package:vl/models/healthfacilities.dart';
import 'package:vl/providers/master_provider.dart';
import 'package:vl/providers/vl_provider.dart';
import 'package:vl/sections/appbar.dart';
import 'package:vl/sections/footer.dart';
import 'package:vl/utils/components.dart';
import 'package:vl/utils/themes.dart';

import '../../firebase_options.dart';
import '../../providers/theme_provider.dart';
import 'index_function.dart';

class IndexUltrawide extends StatefulWidget {
  const IndexUltrawide({super.key});

  @override
  State<IndexUltrawide> createState() => _IndexUltrawideState();
}

class _IndexUltrawideState extends State<IndexUltrawide> {
  final List<Accordion> _faq = getFaq();
  String? provinceCode;
  String? districtCode;
  HealthFacilities? healthFacilities;
  final itemKey = GlobalKey();
  final scrollController = ScrollController();

  initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAnalytics.instance.logAppOpen();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var masterProvider = context.watch<MasterProvider>();
    var vlProvider = context.watch<VlProvider>();
    initFirebase();

    return Consumer<ModelTheme>(builder: (context, themeNotifier, child) {
      return Scaffold(
        body: ListView(
          controller: scrollController,
          children: [
            //Appbar
            AppBarSection().container(context, themeNotifier),

            //banner
            Container(
              color: themeNotifier.isDark ? blackLightColor : greenColor,
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge.toDouble() * 2,
                  vertical: edge.toDouble(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 2.5 / 4 -
                          edge * 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'banner.text-1'.tr(),
                                style: whiteTextStyle.copyWith(
                                  fontSize: 44,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Text(
                              'banner.text-2'.tr(),
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: edge.toDouble() / 2,
                            ),
                            CupertinoButton(
                                color: whiteColor,
                                onPressed: () {
                                  scrollController.animateTo(600,
                                      curve: Curves.ease,
                                      duration: Duration(seconds: 1));
                                },
                                child: Text(
                                  'banner.button-1'.tr(),
                                  style: blackTextStyle.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.w700),
                                )),
                          ]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1.5 / 4 -
                          edge * 2,
                      child: ComponentsApp().logoMaskotVl1(),
                    ),
                  ],
                ),
              ),
            ),

            //Kuota check
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: edge * 2),
                child: Column(children: [
                  SizedBox(
                    height: edge.toDouble(),
                  ),
                  Text(
                    'content.title-1'.tr(),
                    key: itemKey,
                    style: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(
                    height: edge.toDouble() / 2,
                  ),
                  Container(
                    color: themeNotifier.isDark ? blackLightColor : whiteColor,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: edge.toDouble() / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ComponentsApp()
                                    .dropdownProvince(masterProvider, (value) {
                                  setState(() {
                                    provinceCode =
                                        value!.provinceCode.toString();
                                  });
                                })),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ComponentsApp()
                                  .dropdownDistrict(masterProvider, (value) {
                                setState(() {
                                  districtCode = value!.districtCode;
                                });
                              }, provinceCode),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ComponentsApp().dropdownHealthFacility(
                                  masterProvider, (value) {
                                setState(() {
                                  healthFacilities = value!;
                                });
                              }, districtCode),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                color: greenColor,
                                onPressed: () => IndexFunction().cekVl(
                                    context,
                                    healthFacilities,
                                    vlProvider,
                                    themeNotifier,
                                    IndexFunction.KEY_ULTRAWIDE),
                                child: Text(
                                  'content.button-1'.tr(),
                                  style: whiteTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: themeNotifier.isDark ? blackLightColor : blueColor,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: Text(
                        'content.text-footer-1'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),

            //FAQ
            SizedBox(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge * 2),
                    child: Column(children: [
                      SizedBox(
                        height: edge.toDouble() * 2,
                      ),
                      Text(
                        'faq.title'.tr(),
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      SizedBox(
                        height: edge.toDouble() / 2,
                      ),
                      Column(
                        children: _faq.map((e) {
                          return ListTileTheme(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
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
                                    color: themeNotifier.isDark
                                        ? blackLightColor
                                        : whiteColor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: edge.toDouble(),
                                        horizontal: edge.toDouble() / 2,
                                      ),
                                      child: Text(
                                        e.body,
                                        style: themeNotifier.isDark
                                            ? whiteTextStyle
                                            : blackTextStyle,
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
                        height: 200,
                      ),
                    ]))),

            //Footer
            const FooterSection(),
          ],
        ),
      );
    });
  }
}
