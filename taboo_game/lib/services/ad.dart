import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdvertService {
  static String get bannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-4906644238896374/2494902214"
      : "ca-app-pub-4906644238896374/2494902214";

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = new BannerAd(
        size: AdSize.largeBanner,
        adUnitId: bannerAdUnitId,
        request: AdRequest(),
        listener: AdListener(
            // Called when an ad is successfully received.
            onAdLoaded: (Ad ad) => print('Ad loaded.'),
            // Called when an ad request failed.
            onAdFailedToLoad: (Ad ad, LoadAdError error) {
              print('Ad failed to load: $error');
            },
            // Called when an ad opens an overlay that covers the screen.
            onAdOpened: (Ad ad) => print('Ad opened.'),
            // Called when an ad removes an overlay that covers the screen.
            onAdClosed: (Ad ad) => print('Ad closed.'),
            // Called when an ad is in the process of leaving the application.
            onApplicationExit: (Ad ad) => print('Left application.')));

    return ad;
  }
}
