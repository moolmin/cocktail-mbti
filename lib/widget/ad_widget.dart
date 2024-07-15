import 'package:flutter/material.dart';
import 'package:flutter_ad_manager_web/flutter_ad_manager_web.dart';

class AdWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String adUnitCode = """
      <ins class="kakao_ad_area" style="display:none;"
data-ad-unit = "DAN-KyS0C6wBsrrkHStc"
data-ad-width = "320"
data-ad-height = "50"></ins>
<script type="text/javascript" src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
    """;

    return FlutterAdManagerWeb(
      adUnitCode: adUnitCode, // Set to false in production
    );
  }
}



