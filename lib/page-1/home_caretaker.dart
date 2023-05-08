import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class HomeCaretaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // frame456sYX (28:8011)
        width: double.infinity,
        height: 904 * fem,
        child: Container(
          // darktheme05yrT (11:6802)
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
                // basebutton243 (28:7232)
                left: 32 * fem,
                top: 590 * fem,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        16 * fem, 16 * fem, 16 * fem, 16 * fem),
                    width: 327 * fem,
                    height: 76 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff615793),
                      borderRadius: BorderRadius.circular(16 * fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          // verificaodosmedicamentosbmM (28:7233)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 8 * fem, 0 * fem),
                            child: Text(
                              'Verificação dos Medicamentos',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Mulish',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2941176471 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // basebuttoncgT (28:7234)
                          width: 44 * fem,
                          height: 44 * fem,
                          child: Image.asset(
                            'assets/page-1/images/base-button-UXd.png',
                            width: 44 * fem,
                            height: 44 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // frameJJP (28:7148)
                left: 32 * fem,
                top: 149 * fem,
                child: Container(
                  width: 327 * fem,
                  height: 252 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // contentaWo (28:7151)
                        margin: EdgeInsets.fromLTRB(
                            38 * fem, 0 * fem, 38 * fem, 40 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              // titleVNs (28:7152)
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                child: Text(
                                  'Bem-Vindo José!  🙌',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 22 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3636363636 * ffem / fem,
                                    letterSpacing: -0.5 * fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              // bodyWYs (28:7153)
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 251 * fem,
                                ),
                                child: Text(
                                  'Abaixo pode ver os seus alertas e configurar/vizualizar a medicação associada ao António.',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Mulish',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.75 * ffem / fem,
                                    color: Color(0xffb7b7be),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // basesimplecardMpP (28:7156)
                        padding: EdgeInsets.fromLTRB(
                            20 * fem, 20 * fem, 20 * fem, 20 * fem),
                        width: double.infinity,
                        height: 84 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(16 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0a323247),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 10 * fem,
                            ),
                            BoxShadow(
                              color: Color(0x070c1a4b),
                              offset: Offset(0 * fem, 0 * fem),
                              blurRadius: 0.5 * fem,
                            ),
                          ],
                        ),
                        child: Container(
                          // contentZfZ (28:7157)
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // alertadefaltadetomasRM (28:7159)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 1 * fem, 0 * fem),
                                child: Text(
                                  'Alerta de Falta de Toma',
                                  style: SafeGoogleFont(
                                    'Mulish',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.375 * ffem / fem,
                                    color: Color(0xff212134),
                                  ),
                                ),
                              ),
                              Container(
                                // alerticon156238MH (28:7199)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 16 * fem, 0 * fem),
                                width: 45 * fem,
                                height: 43 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/alert-icon-1562-3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                // variantsbuttonPo1 (28:7160)
                                width: 44 * fem,
                                height: 44 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/variants-button.png',
                                  width: 44 * fem,
                                  height: 44 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // basebuttonV5M (28:7210)
                left: 32 * fem,
                top: 484 * fem,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        11.5 * fem, 16 * fem, 11.5 * fem, 16 * fem),
                    width: 327 * fem,
                    height: 76 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff615793),
                      borderRadius: BorderRadius.circular(16 * fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          // configuraodemedicamentosEx3 (28:7211)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 8 * fem, 0 * fem),
                            child: Text(
                              'Configuração de Medicamentos',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Mulish',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2941176471 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // basebuttonUbV (28:7212)
                          width: 44 * fem,
                          height: 44 * fem,
                          child: Image.asset(
                            'assets/page-1/images/base-button.png',
                            width: 44 * fem,
                            height: 44 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // navigationbarauR (11:6814)
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
                        // largetitlebar1zj (I11:6814;3207:13522)
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
                              // autogroupp97ysn3 (VewHdLDEUxrcBjGhNFp97y)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 282 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 10 * fem, 0 * fem, 0 * fem),
                              width: 76 * fem,
                              height: double.infinity,
                              child: Container(
                                // largetitlegrpYNP (I11:6814;3207:13524)
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
                // statusbarPto (11:6815)
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
                        // cmZ (I11:6815;2847:11837)
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
                        // rightsideGbD (I11:6815;3033:12187)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 5.33 * fem, 0 * fem, 3.33 * fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // mobilesignal9uu (I11:6815;3033:12193)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5.03 * fem, 0 * fem),
                              width: 17 * fem,
                              height: 10.67 * fem,
                              child: Image.asset(
                                'assets/page-1/images/mobile-signal-M3y.png',
                                width: 17 * fem,
                                height: 10.67 * fem,
                              ),
                            ),
                            Container(
                              // wifi2D1 (I11:6815;3033:12192)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5.03 * fem, 0.37 * fem),
                              width: 15.27 * fem,
                              height: 10.97 * fem,
                              child: Image.asset(
                                'assets/page-1/images/wifi.png',
                                width: 15.27 * fem,
                                height: 10.97 * fem,
                              ),
                            ),
                            Container(
                              // battery6Cs (I11:6815;3033:12188)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: 24.33 * fem,
                              height: 11.33 * fem,
                              child: Image.asset(
                                'assets/page-1/images/battery-fP9.png',
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
                // footerM8o (11:6816)
                left: 0 * fem,
                top: 800 * fem,
                child: Align(
                  child: SizedBox(
                    width: 390 * fem,
                    height: 106 * fem,
                    child: Image.asset(
                      'assets/page-1/images/footer-CrF.png',
                      width: 390 * fem,
                      height: 106 * fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangleyvs (I11:6817;3080:11612)
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
