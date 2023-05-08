import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // frame458i99 (28:8013)
        width: double.infinity,
        height: 904*fem,
        child: Container(
          // darktheme05d1D (10:6689)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xff000000),
            boxShadow: [
              BoxShadow(
                color: Color(0x3db3bbcb),
                offset: Offset(0*fem, 0*fem),
                blurRadius: 12*fem,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                // scrollgroupFoH (10:6690)
                left: 0*fem,
                top: 120*fem,
                child: Container(
                  width: 390*fem,
                  height: 175*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // contentrowsliderKo9 (10:6691)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
                        padding: EdgeInsets.fromLTRB(8*fem, 0*fem, 0*fem, 0*fem),
                        width: double.infinity,
                        height: 115*fem,
                        decoration: BoxDecoration (
                          color: Color(0xff191919),
                        ),
                        child: Container(
                          // scrollframenwd (I10:6691;3107:11759)
                          width: 704*fem,
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                // avatar5Qw (I10:6691;3107:11760)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholderjEb (I10:6691;3107:11760;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatarP4F (I10:6691;3107:11760;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-j2K.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionFMM (I10:6691;3107:11760;3107:11713)
                                        'Segunda',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatarJqR (I10:6691;3107:11761)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholderZFZ (I10:6691;3107:11761;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatarC3d (I10:6691;3107:11761;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-1vT.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionUmq (I10:6691;3107:11761;3107:11713)
                                        'Terça',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatarZ2b (I10:6691;3107:11762)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholderpDR (I10:6691;3107:11762;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatartDH (I10:6691;3107:11762;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-c5Z.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionaM1 (I10:6691;3107:11762;3107:11713)
                                        'Quarta',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatargew (I10:6691;3107:11763)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholderkPu (I10:6691;3107:11763;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatarbvK (I10:6691;3107:11763;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-JDy.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionW1h (I10:6691;3107:11763;3107:11713)
                                        'Quinta',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatarbYw (I10:6691;3107:11764)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(6.5*fem, 12*fem, 6.5*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholder4Bd (I10:6691;3107:11764;3107:11712)
                                        margin: EdgeInsets.fromLTRB(5.5*fem, 0*fem, 5.5*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatar7fh (I10:6691;3107:11764;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-8QK.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionMK9 (I10:6691;3107:11764;3107:11713)
                                        'Sexta Name',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatarr11 (I10:6691;3107:11765)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholderHs1 (I10:6691;3107:11765;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatarLKV (I10:6691;3107:11765;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-HcX.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionFas (I10:6691;3107:11765;3107:11713)
                                        'Full Name',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatarwyV (I10:6691;3107:11766)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholderQMH (I10:6691;3107:11766;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avatarFco (I10:6691;3107:11766;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-eFd.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionx1R (I10:6691;3107:11766;3107:11713)
                                        'Full Name',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                // avatar3Yf (I10:6691;3107:11767)
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12*fem, 12*fem, 12*fem, 12*fem),
                                  width: 88*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // avatarplaceholder7YX (I10:6691;3107:11767;3107:11712)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                        padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: Color(0xff808080)),
                                          borderRadius: BorderRadius.circular(48*fem),
                                        ),
                                        child: Center(
                                          // avataraS7 (I10:6691;3107:11767;3107:11712;2973:19104)
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 58*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/avatar-qXH.png',
                                              width: 58*fem,
                                              height: 58*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // descriptionsRD (I10:6691;3107:11767;3107:11713)
                                        'Full Name',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714286*ffem/fem,
                                          color: Color(0xff0e0e0e),
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
                      Container(
                        // segundafeira17deabril2023a4j (10:6693)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                        child: Text(
                          'Segunda-feira, 17 de Abril 2023',
                          style: SafeGoogleFont (
                            'Gothic A1',
                            fontSize: 22*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.25*ffem/fem,
                            color: Color(0xff0e0e0e),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // autogroup89cfR5M (Vew9CA6eswgSb4e4Zg89Cf)
                left: 0*fem,
                top: 295*fem,
                child: Container(
                  width: 390*fem,
                  height: 609*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // autogroupe81rgX5 (Vew5yzwqeLfjWLwNGae81R)
                        left: 24*fem,
                        top: 33*fem,
                        child: Container(
                          width: 335*fem,
                          height: 89*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // imageplaceholder9fZ (10:6694)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 27*fem, 0*fem),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 87*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      image: DecorationImage (
                                        fit: BoxFit.cover,
                                        image: AssetImage (
                                          'assets/page-1/images/image-bg-Pa3.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupyxzmMWj (Vew6JEvSnqQESkxKSjyXZM)
                                margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 0*fem, 7*fem),
                                width: 221*fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupfswddz3 (Vew6RjhxL8mfqv2gXiFSwD)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 13*fem),
                                      width: double.infinity,
                                      height: 37*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // vCT (10:6696)
                                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 63*fem, 0*fem),
                                            child: Text(
                                              '9:00',
                                              style: SafeGoogleFont (
                                                'Gothic A1',
                                                fontSize: 22*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.25*ffem/fem,
                                                color: Color(0xff0e0e0e),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // statuspillmis (11:6799)
                                            width: 113*fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: Color(0xff4dcfc0),
                                              borderRadius: BorderRadius.circular(1000*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Tomado',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (
                                                  'Gothic A1',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xff0e0e0e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // medicaoarterialz5q (28:7066)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                      child: Text(
                                        'Medicação Arterial',
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 22*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
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
                        // autogroup2kqrqMM (Vew6u95xh7BG3k2XFj2kqR)
                        left: 21*fem,
                        top: 189*fem,
                        child: Container(
                          width: 354*fem,
                          height: 92*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // imageplaceholderus1 (10:6697)
                                margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 22*fem, 0*fem),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 87*fem,
                                    height: 89*fem,
                                    decoration: BoxDecoration (
                                      image: DecorationImage (
                                        fit: BoxFit.cover,
                                        image: AssetImage (
                                          'assets/page-1/images/image-bg-a5H.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupzc6wuVd (Vew79JM2w7mJuvizCDzc6w)
                                width: 245*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupcurj1oZ (Vew7J8Rf1kyfogva3uCurj)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // tsM (10:6698)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 1*fem),
                                            child: Text(
                                              '11:00',
                                              style: SafeGoogleFont (
                                                'Gothic A1',
                                                fontSize: 22*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.25*ffem/fem,
                                                color: Color(0xff0e0e0e),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // alerticon15621mRM (28:7062)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                            width: 45*fem,
                                            height: 43*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/alert-icon-1562-1.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            // statuspillAyH (27:6552)
                                            margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                                            width: 114*fem,
                                            height: 38*fem,
                                            decoration: BoxDecoration (
                                              color: Color(0xffe52b67),
                                              borderRadius: BorderRadius.circular(1000*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Não tomado',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (
                                                  'Gothic A1',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xff0e0e0e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // reforoclcioyA3 (28:7067)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 0*fem),
                                      child: Text(
                                        'Reforço Cálcio',
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 22*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
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
                        // checkELs (11:6797)
                        left: 315*fem,
                        top: 217*fem,
                        child: Container(
                          width: 32*fem,
                          height: 28*fem,
                        ),
                      ),
                      Positioned(
                        // autogroupcqxrXas (Vew84mow7ijZpybSsYcqXR)
                        left: 23*fem,
                        top: 348*fem,
                        child: Container(
                          width: 354*fem,
                          height: 89*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // imageplaceholderbaj (27:6693)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 87*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      image: DecorationImage (
                                        fit: BoxFit.cover,
                                        image: AssetImage (
                                          'assets/page-1/images/image-bg-a1h.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupf2m1piP (Vew8Qr4pWK15pUQaMgF2M1)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 3*fem),
                                width: 244*fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroup8xyftiF (Vew8Zve2SL4VVUSdyz8XYf)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
                                      width: double.infinity,
                                      height: 43*fem,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // yUo (27:6698)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 1*fem),
                                            child: Text(
                                              '18:00',
                                              style: SafeGoogleFont (
                                                'Gothic A1',
                                                fontSize: 22*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.25*ffem/fem,
                                                color: Color(0xff0e0e0e),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // alerticon15622f6j (28:7063)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 0*fem),
                                            width: 45*fem,
                                            height: 43*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/alert-icon-1562-2.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            // statuspillLCs (27:6699)
                                            margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 3*fem),
                                            width: 114*fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: Color(0xffe52b67),
                                              borderRadius: BorderRadius.circular(1000*fem),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Não tomado',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (
                                                  'Gothic A1',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.4285714286*ffem/fem,
                                                  color: Color(0xff0e0e0e),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // reforovitamnicoL6P (28:7068)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                                      child: Text(
                                        'Reforço Vitamínico',
                                        style: SafeGoogleFont (
                                          'Gothic A1',
                                          fontSize: 22*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ),
                                  ],
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
                // statusbarzRq (10:6702)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(32.5*fem, 12*fem, 20.67*fem, 12*fem),
                  width: 390*fem,
                  height: 44*fem,
                  decoration: BoxDecoration (
                    color: Color(0xcc333333),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // RGF (I10:6702;2847:11837)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 239.17*fem, 0*fem),
                        child: Text(
                          '9:41',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Gothic A1',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w900,
                            height: 1.3333333333*ffem/fem,
                            letterSpacing: -0.5*fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // rightsideUEX (I10:6702;3033:12187)
                        margin: EdgeInsets.fromLTRB(0*fem, 5.33*fem, 0*fem, 3.33*fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // mobilesignalkhq (I10:6702;3033:12193)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.03*fem, 0*fem),
                              width: 17*fem,
                              height: 10.67*fem,
                              child: Image.asset(
                                'assets/page-1/images/mobile-signal.png',
                                width: 17*fem,
                                height: 10.67*fem,
                              ),
                            ),
                            Container(
                              // wifiQXV (I10:6702;3033:12192)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.03*fem, 0.37*fem),
                              width: 15.27*fem,
                              height: 10.97*fem,
                              child: Image.asset(
                                'assets/page-1/images/wifi-EvX.png',
                                width: 15.27*fem,
                                height: 10.97*fem,
                              ),
                            ),
                            Container(
                              // battery5dd (I10:6702;3033:12188)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                              width: 24.33*fem,
                              height: 11.33*fem,
                              child: Image.asset(
                                'assets/page-1/images/battery-uFh.png',
                                width: 24.33*fem,
                                height: 11.33*fem,
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
                // footer9tP (10:6703)
                left: 0*fem,
                top: 798*fem,
                child: Align(
                  child: SizedBox(
                    width: 390*fem,
                    height: 106*fem,
                    child: Image.asset(
                      'assets/page-1/images/footer-3Fh.png',
                      width: 390*fem,
                      height: 106*fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectanglec1H (I10:6704;3080:11612)
                left: 128*fem,
                top: 890*fem,
                child: Align(
                  child: SizedBox(
                    width: 134*fem,
                    height: 5*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(100*fem),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // navigationbarpd9 (27:7056)
                left: 0*fem,
                top: 44*fem,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur (
                      sigmaX: 12*fem,
                      sigmaY: 12*fem,
                    ),
                    child: Container(
                      width: 390*fem,
                      height: 76*fem,
                      decoration: BoxDecoration (
                        color: Color(0xcc333333),
                      ),
                      child: Container(
                        // largetitlebarqYF (I27:7056;3207:13522)
                        padding: EdgeInsets.fromLTRB(16*fem, 2*fem, 8*fem, 2*fem),
                        width: double.infinity,
                        height: double.infinity,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur (
                              sigmaX: 12*fem,
                              sigmaY: 12*fem,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroup9h4xg35 (VewEVAwksPNfapwfPH9H4X)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 106*fem, 8*fem),
                                  width: 176*fem,
                                  height: 64*fem,
                                  child: Container(
                                    // largetitlegrpm4X (I27:7056;3207:13524)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Center(
                                      // pagetitle5L7 (I27:7056;3207:13525)
                                      child: SizedBox(
                                        child: Container(
                                          constraints: BoxConstraints (
                                            maxWidth: 176*fem,
                                          ),
                                          child: Text(
                                            'Verificação de Medicamentos',
                                            style: SafeGoogleFont (
                                              'Gothic A1',
                                              fontSize: 26*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.2307692308*ffem/fem,
                                              color: Color(0xff0e0e0e),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // rightactionsi8B (I27:7056;3207:13527)
                                  margin: EdgeInsets.fromLTRB(0*fem, 12*fem, 0*fem, 20*fem),
                                  padding: EdgeInsets.fromLTRB(3.33*fem, 3.33*fem, 8.33*fem, 3.34*fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // belly47 (I27:7056;3207:13528)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.67*fem, 0*fem),
                                        width: 33.33*fem,
                                        height: 33.33*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/bell-Adq.png',
                                          width: 33.33*fem,
                                          height: 33.33*fem,
                                        ),
                                      ),
                                      Container(
                                        // arrowleft3Js (I27:7056;3207:13529)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0.01*fem, 0*fem, 0*fem),
                                        width: 23.33*fem,
                                        height: 23.33*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/arrow-left-DAs.png',
                                          width: 23.33*fem,
                                          height: 23.33*fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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