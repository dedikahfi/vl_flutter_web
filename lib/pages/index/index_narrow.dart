import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vl/pages/index/index_function.dart';
import 'package:vl/sections/appbar.dart';
import 'package:vl/sections/footer.dart';
import 'package:vl/utils/themes.dart';

import '../../firebase_options.dart';
import '../../models/accordion.dart';
import '../../models/healthfacilities.dart';
import '../../providers/master_provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/vl_provider.dart';
import '../../utils/components.dart';

class IndexNarrow extends StatefulWidget {
  const IndexNarrow({super.key});

  @override
  State<IndexNarrow> createState() => _IndexNarrowState();
}

class _IndexNarrowState extends State<IndexNarrow> {
  //vaiable
  String? provinceCode;
  String? districtCode;
  HealthFacilities? healthFacilities;
  //controller
  final scrollController = ScrollController();

  initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAnalytics.instance.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    final List<Accordion> faq = getFaq();
    //provider
    var masterProvider = context.watch<MasterProvider>();
    var vlProvider = context.watch<VlProvider>();
    //call function
    initFirebase();

    return Consumer<ModelTheme>(builder: (context, themeNotifier, child) {
      return Scaffold(
        appBar: appbar(),
        endDrawer: AppBarSection().container(context, themeNotifier),
        body: ListView(
          controller: scrollController,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Opacity(
                    opacity: 0.1,
                    child: ComponentsApp().logoMaskotVl1(width: 330),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          'banner.text-1'.tr(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'banner.text-2'.tr(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: edge.toDouble() / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Transform.scale(
                            scale: 0.9,
                            child: CupertinoButton(
                                color: greenColor,
                                child: Text(
                                  'banner.button-1'.tr(),
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: FontWeight.w700),
                                ),
                                onPressed: () {
                                  scrollController.animateTo(290,
                                      curve: Curves.ease,
                                      duration: const Duration(seconds: 1));
                                })),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: edge.toDouble(), bottom: edge / 2),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 32,
                            color: themeNotifier.isDark
                                ? blackLightColor
                                : whiteColor.withOpacity(0.9),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Center(
                                  child: Text(
                                    'content.title-1'.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'content.text-footer-1'.tr(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                ComponentsApp().dropdownProvince(masterProvider,
                                    (value) {
                                  setState(() {
                                    provinceCode =
                                        value!.provinceCode.toString();
                                  });
                                }),
                                const SizedBox(
                                  height: 16,
                                ),
                                ComponentsApp().dropdownDistrict(masterProvider,
                                    (value) {
                                  setState(() {
                                    districtCode = value!.districtCode;
                                  });
                                }, provinceCode),
                                const SizedBox(
                                  height: 16,
                                ),
                                ComponentsApp().dropdownHealthFacility(
                                    masterProvider, (value) {
                                  setState(() {
                                    healthFacilities = value!;
                                  });
                                }, districtCode),
                                const SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Transform.scale(
                                    scale: 0.9,
                                    child: CupertinoButton(
                                      color: greenColor,
                                      onPressed: () => IndexFunction().cekVl(
                                          context,
                                          healthFacilities,
                                          vlProvider,
                                          themeNotifier,
                                          IndexFunction.KEY_NARROW),
                                      child: Text('content.button-1'.tr(),
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: edge.toDouble() / 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
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
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 32, right: 32),
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
                  const SizedBox(
                    height: 32,
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
