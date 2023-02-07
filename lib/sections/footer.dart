import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vl/constants/references.dart';
import 'package:vl/utils/components.dart';
import 'package:vl/utils/themes.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  listSocialMedia() {
    return Row(
      children: [
        InkWell(
            onTap: () async {
              Uri uri = Uri.parse(urlToTwitter);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.platformDefault);
              } else {
                throw 'Could not launch $uri';
              }
            },
            child:
                const Icon(Ionicons.logo_twitter, color: whiteColor, size: 20)),
        const SizedBox(width: 8),
        InkWell(
            onTap: () async {
              Uri uri = Uri.parse(urlToFacebook);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.platformDefault);
              } else {
                throw 'Could not launch $uri';
              }
            },
            child: const Icon(Ionicons.logo_facebook,
                color: whiteColor, size: 20)),
        const SizedBox(width: 8),
        InkWell(
            onTap: () async {
              Uri uri = Uri.parse(urlToInstagram);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.platformDefault);
              } else {
                throw 'Could not launch $uri';
              }
            },
            child: const Icon(Ionicons.logo_instagram,
                color: whiteColor, size: 20)),
        const SizedBox(width: 8),
        InkWell(
            onTap: () async {
              Uri uri = Uri.parse(urlToYoutube);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.platformDefault);
              } else {
                throw 'Could not launch $uri';
              }
            },
            child:
                const Icon(Ionicons.logo_youtube, color: whiteColor, size: 20)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > dimenUltraWide ||
          constraints.maxWidth > dimenWide) {
        return Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          color: blackLightColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge.toDouble() * 2,
              vertical: edge.toDouble(),
            ),
            child: Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - edge * 3,
                height: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ComponentsApp().logoAppLight,
                      Row(
                        children: [
                          const Icon(
                            Icons.copyright,
                            color: whiteColor,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'footer.text-1'.tr(),
                            style: whiteTextStyle.copyWith(
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'footer.text-2'.tr(),
                        style: whiteTextStyle.copyWith(
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(height: edge.toDouble() / 2),
                      listSocialMedia(),
                    ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - edge,
                height: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'footer.text-contact'.tr(),
                        style: whiteTextStyle.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'footer.text-desc-addr'.tr(),
                        style: whiteTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        emailSupport,
                        style: whiteTextStyle,
                      ),
                    ]),
              ),
            ]),
          ),
        );
      } else {
        //mobile
        return Container(
          color: blackLightColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: edge.toDouble() / 2,
              ),
              ComponentsApp().logoAppLight,
              Row(
                children: [
                  const Icon(
                    Icons.copyright,
                    color: whiteColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'footer.text-1'.tr(),
                    style: whiteTextStyle.copyWith(
                      fontSize: 11,
                    ),
                  )
                ],
              ),
              Text(
                'footer.text-2'.tr(),
                style: whiteTextStyle.copyWith(
                  fontSize: 11,
                ),
              ),
              SizedBox(height: edge.toDouble() / 2),
              listSocialMedia(),
              SizedBox(
                height: edge.toDouble(),
              )
            ]),
          ),
        );
      }
    });
  }
}
