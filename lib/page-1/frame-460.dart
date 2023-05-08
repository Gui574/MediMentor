import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class HomeElder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // frame460y9D (28:8015)
        width: double.infinity,
        height: 904 * fem,
        child: Container(
          // darktheme05sVV (27:6406)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff000000),
            boxShadow: [
              BoxShadow(
                color: Color(0x3db3bbcb),
                offset: Offset(0 * fem, 0 * fem),
                blurRadius: 12 * fem,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                // terafeira25deabrilJKu (27:6410)
                left: 16 * fem,
                top: 147 * fem,
                child: Align(
                  child: SizedBox(
                    width: 353 * fem,
                    height: 40 * fem,
                    child: Text(
                      'Terça-feira, 25 de Abril',
                      style: SafeGoogleFont(
                        'Gothic A1',
                        fontSize: 32 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff0e0e0e),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // autogroupzcd14iP (VevtAkoJ37GdDq7iK9zcD1)
                left: 0 * fem,
                top: 316 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      23 * fem, 12 * fem, 28 * fem, 74 * fem),
                  width: 390 * fem,
                  height: 413 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogrouplsj3Voh (VevrT4ARMprW1ecgGrLsJ3)
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 0 * fem, 0 * fem, 65 * fem),
                        height: 89 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // imageplaceholderyis (27:6411)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 29 * fem, 0 * fem),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 87 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/page-1/images/image-bg-D5D.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // ngK (27:6413)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 37 * fem, 1 * fem),
                              child: Text(
                                '9:00',
                                style: SafeGoogleFont(
                                  'Gothic A1',
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.25 * ffem / fem,
                                  color: Color(0xff0e0e0e),
                                ),
                              ),
                            ),
                            Container(
                              // statuspillrw5 (27:6417)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 15 * fem, 0 * fem, 16 * fem),
                              width: 140 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff0ba348),
                                borderRadius: BorderRadius.circular(1000 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'TOMADO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Gothic A1',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4285714286 * ffem / fem,
                                    color: Color(0xff0e0e0e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogrouppn8krpb (VevrwYLxQmFxvquFzwPN8K)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 17 * fem, 49 * fem),
                        height: 89 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // imageplaceholderYBd (27:6414)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 30 * fem, 0 * fem),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 87 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/page-1/images/image-bg-chZ.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // K5u (27:6415)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 66 * fem, 1 * fem),
                              child: Text(
                                '11:00',
                                style: SafeGoogleFont(
                                  'Gothic A1',
                                  fontSize: 22 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.25 * ffem / fem,
                                  color: Color(0xff0e0e0e),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupwmrmB87 (VevsGCUXyZ4sqKeLnpWmRM)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              width: 80 * fem,
                              height: 80 * fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-wmrm.png',
                                width: 80 * fem,
                                height: 80 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // tarde1medicamentoEs5 (27:6598)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 41 * fem, 0 * fem),
                        child: Text(
                          'Tarde: 1 medicamento',
                          style: SafeGoogleFont(
                            'Gothic A1',
                            fontSize: 28 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.25 * ffem / fem,
                            color: Color(0xff0e0e0e),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // autogroupyqjjtgj (VevsoWugg6PYvZ51uQYqJj)
                left: 0 * fem,
                top: 729 * fem,
                child: Align(
                  child: SizedBox(
                    width: 390 * fem,
                    height: 175 * fem,
                    child: Image.asset(
                      'assets/page-1/images/auto-group-yqjj.png',
                      width: 390 * fem,
                      height: 175 * fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // manh2medicamentosvtK (27:6596)
                left: 16 * fem,
                top: 248 * fem,
                child: Align(
                  child: SizedBox(
                    width: 319 * fem,
                    height: 35 * fem,
                    child: Text(
                      'Manhã: 2 medicamentos',
                      style: SafeGoogleFont(
                        'Gothic A1',
                        fontSize: 28 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff0e0e0e),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // navigationbarksM (27:6418)
                left: 0 * fem,
                top: 44 * fem,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12 * fem,
                      sigmaY: 12 * fem,
                    ),
                    child: Container(
                      width: 390 * fem,
                      height: 76 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xcc333333),
                      ),
                      child: ClipRect(
                        // largetitlebarb7H (I27:6418;3207:13522)
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 12 * fem,
                            sigmaY: 12 * fem,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                16 * fem, 8 * fem, 16 * fem, 2 * fem),
                            width: double.infinity,
                            height: double.infinity,
                            child: Container(
                              // autogroup2wksq1d (VevxDJj99Kix2R2TyP2Wks)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 282 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 10 * fem, 0 * fem, 0 * fem),
                              width: 76 * fem,
                              height: double.infinity,
                              child: Container(
                                // largetitlegrp7E3 (I27:6418;3207:13524)
                                width: double.infinity,
                                height: double.infinity,
                                child: Text(
                                  'Painel',
                                  style: SafeGoogleFont(
                                    'Gothic A1',
                                    fontSize: 26 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2307692308 * ffem / fem,
                                    color: Color(0xff0e0e0e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // statusbarMPH (27:6419)
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      32.5 * fem, 12 * fem, 20.67 * fem, 12 * fem),
                  width: 390 * fem,
                  height: 44 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xcc333333),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // B7R (I27:6419;2847:11837)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 239.17 * fem, 0 * fem),
                        child: Text(
                          '9:41',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Gothic A1',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w900,
                            height: 1.3333333333 * ffem / fem,
                            letterSpacing: -0.5 * fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // rightsideE5h (I27:6419;3033:12187)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5.33 * fem, 0 * fem, 3.33 * fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // mobilesignalWou (I27:6419;3033:12193)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5.03 * fem, 0 * fem),
                              width: 17 * fem,
                              height: 10.67 * fem,
                              child: Image.asset(
                                'assets/page-1/images/mobile-signal-2nP.png',
                                width: 17 * fem,
                                height: 10.67 * fem,
                              ),
                            ),
                            Container(
                              // wifiNbD (I27:6419;3033:12192)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5.03 * fem, 0.37 * fem),
                              width: 15.27 * fem,
                              height: 10.97 * fem,
                              child: Image.asset(
                                'assets/page-1/images/wifi-ZYo.png',
                                width: 15.27 * fem,
                                height: 10.97 * fem,
                              ),
                            ),
                            Container(
                              // batteryTcf (I27:6419;3033:12188)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: 24.33 * fem,
                              height: 11.33 * fem,
                              child: Image.asset(
                                'assets/page-1/images/battery.png',
                                width: 24.33 * fem,
                                height: 11.33 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // rectangleKum (I27:6421;3080:11612)
                left: 128 * fem,
                top: 890 * fem,
                child: Align(
                  child: SizedBox(
                    width: 134 * fem,
                    height: 5 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100 * fem),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
