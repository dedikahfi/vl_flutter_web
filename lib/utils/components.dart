import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vl/models/healthfacilities.dart';
import 'package:vl/models/quotahf.dart';
import 'package:vl/providers/master_provider.dart';
import 'package:vl/providers/theme_provider.dart';
import 'package:vl/utils/themes.dart';

import '../models/district.dart';
import '../models/province.dart';

class ComponentsApp {
  var logoAppDark = Image.asset(
    'images/yki-dark.png',
    width: 80,
  );

  var logoAppLight = Image.asset(
    'images/yki-light.png',
    width: 80,
  );

  var logoMaskotVl1 = ({width}) {
    return Image.asset(
      'images/maskot-vl-1.png',
      width: width,
    );
  };

  var dropdownProvince = (MasterProvider masterProvider,
          Function(Province?) onChanged) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'content.text-province'.tr(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownSearch<Province>(
              popupProps: const PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  label: Text('content.text-sub-province'.tr()),
                ),
              ),
              asyncItems: (filter) => masterProvider.getProvince(),
              itemAsString: (item) => item.toString(),
              onChanged: onChanged,
            ),
          ),
        ],
      );

  var dropdownDistrict = (MasterProvider masterProvider, onChanged,
          provinceCode) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'content.text-district'.tr(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownSearch<District>(
              popupProps: const PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  label: Text('content.text-sub-district'.tr()),
                ),
              ),
              asyncItems: (filter) => masterProvider.getDistrict(provinceCode),
              itemAsString: (item) => item.toString(),
              onChanged: onChanged,
            ),
          ),
        ],
      );

  var dropdownHealthFacility = (MasterProvider masterProvider, onChanged,
          districtCode) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'content.text-hf'.tr(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownSearch<HealthFacilities>(
              popupProps: const PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  label: Text('content.text-sub-hf'.tr()),
                ),
              ),
              asyncItems: (filter) =>
                  masterProvider.getHealthFacilities(districtCode),
              itemAsString: (item) => item.toString(),
              onChanged: onChanged,
            ),
          ),
        ],
      );

  alertDialogVl(context, QuotaHf quotaHf, HealthFacilities healthFacilities,
      ModelTheme themeNotifier) async {
    String? timeHistory;

    if (quotaHf.stokLastUpdate != 'null') {
      await Jiffy.locale("id");
      timeHistory = Jiffy(quotaHf.stokLastUpdate, "yyyy-MM-dd").fromNow();
    } else {
      timeHistory = '-';
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: themeNotifier.isDark
              ? Color.fromARGB(255, 43, 42, 42)
              : whiteColor,
          content: Container(
            // color: grayColor,
            height: MediaQuery.of(context).size.height - edge * 2,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Visibility(visible: false, child: Icon(Icons.abc)),
                    Text('Status Kuota VL HIV',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        )),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    // color: whiteColor,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image.asset(
                          quotaHf.stokKetersediaan == 'Tersedia'
                              ? 'images/maskot-vl-2.png'
                              : quotaHf.stokKetersediaan == 'Belum Update'
                                  ? 'images/maskot-vl-4.png'
                                  : 'images/maskot-vl-3.png',
                          width: 150,
                        ),
                        Text(healthFacilities.healthFacilitiesName.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                        Text(
                          'Pemeriksaan Viral Load HIV:',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Builder(builder: ((context) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: quotaHf.stokKetersediaan == 'Tersedia'
                              ? greenColor
                              : quotaHf.stokKetersediaan == 'Belum Update'
                                  ? Colors.blue
                                  : Color.fromARGB(255, 182, 17, 6),
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Text(
                            quotaHf.stokKetersediaan == 'Tersedia'
                                ? 'TERSEDIA'
                                : quotaHf.stokKetersediaan == 'Belum Update'
                                    ? 'BELUM DIPERBARUI '
                                    : 'BELUM TERSEDIA',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        color: whiteColor,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Periode perhitungan: ${quotaHf.stokLastUpdate}',
                              style: blackTextStyle,
                            ),
                            Text(
                              'Terakhir diupdate $timeHistory',
                              style: blackTextStyle.copyWith(
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        color: blueColor,
                        child: Center(
                          child: Text(
                            quotaHf.stokKetersediaan == 'Tersedia'
                                ? 'Segera ke fasyankes atau hubungi petugas kesehatan atau petugas pendamping tempat Anda berobat untuk konfirmasi kehadiran!'
                                : 'Mohon menghubungi petugas kesehatan atau petugas pendamping untuk memastikan kuota dan cek secara berkala.',
                            textAlign: TextAlign.center,
                            style: blackTextStyle,
                          ),
                        ),
                      ),
                    ],
                  );
                })),
              ],
            ),
          ),
        );
      },
    );
  }

  alertDialogVlMobile(context, QuotaHf quotaHf,
      HealthFacilities healthFacilities, ModelTheme themeNotifier) async {
    String? timeHistory;
    if (quotaHf.stokLastUpdate != 'null') {
      await Jiffy.locale("id");
      timeHistory = Jiffy(quotaHf.stokLastUpdate, "yyyy-MM-dd").fromNow();
    } else {
      timeHistory = '-';
    }

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Scaffold(
            body: Center(
          child: Container(
            // color: whiteColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Visibility(visible: false, child: Icon(Icons.abc)),
                      Text('Status Kuota VL HIV',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      // color: whiteColor,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Image.asset(
                            quotaHf.stokKetersediaan == 'Tersedia'
                                ? 'images/maskot-vl-2.png'
                                : quotaHf.stokKetersediaan == 'Belum Update'
                                    ? 'images/maskot-vl-4.png'
                                    : 'images/maskot-vl-3.png',
                            width: 150,
                          ),
                          Text(healthFacilities.healthFacilitiesName.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                          Text(
                            'Pemeriksaan Viral Load HIV:',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: quotaHf.stokKetersediaan == 'Tersedia'
                            ? greenColor
                            : quotaHf.stokKetersediaan == 'Belum Update'
                                ? Colors.blue
                                : Color.fromARGB(255, 182, 17, 6),
                        shape: BoxShape.rectangle),
                    child: Center(
                      child: Text(
                        quotaHf.stokKetersediaan == 'Tersedia'
                            ? 'TERSEDIA'
                            : quotaHf.stokKetersediaan == 'Belum Update'
                                ? 'BELUM DIPERBARUI '
                                : 'BELUM TERSEDIA',
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Periode perhitungan: ${quotaHf.stokLastUpdate}',
                  ),
                  Text(
                    'Terakhir diupdate $timeHistory',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: blueColor,
                    child: Center(
                      child: Text(
                        quotaHf.stokKetersediaan == 'Tersedia'
                            ? 'Segera ke fasyankes atau hubungi petugas kesehatan atau petugas pendamping tempat Anda berobat untuk konfirmasi kehadiran!'
                            : 'Mohon menghubungi petugas kesehatan atau petugas pendamping untuk memastikan kuota dan cek secara berkala.',
                        textAlign: TextAlign.center,
                        style: blackTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  alertDialogAttention(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Perhatian'),
              content: const Text('Pilih fasyankes terlebih dahulu!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: Text(
                    'Coba lagi',
                    style: Theme.of(context).brightness == Brightness.dark
                        ? whiteTextStyle
                        : blackTextStyle,
                  ),
                ),
              ],
            ));
  }
}
