import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz/quiz_lvl_1_page.dart';
import 'package:simple_quiz/quiz_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: Center(
            child: Center(
              child: Text(
                "Kuis Hidrasi",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/AppBar.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      style: GoogleFonts.poppins(),
                      children: <TextSpan>[
                    TextSpan(
                        text: "Ayo Mulai\n",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: const Color(0xFF0984E1))),
                    TextSpan(
                      text: "jawab seluruh kuisnya !!!",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color(0xFF369CE9).withOpacity(0.75),
                          height: 1.2),
                    )
                  ])),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizLvl1Page(),
                    ),
                  );
                },
                child: Container(
                  height: 252,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 165,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/bg_level.png'),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Image.asset(
                                  'assets/icon_play.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, top: 10),
                                child: RichText(
                                    text: TextSpan(
                                        style: GoogleFonts.poppins(),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: "Level 1\n",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                        text: "Wajib Diketahui",
                                        style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2),
                                      )
                                    ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 13,
                        bottom: 10,
                        child: Container(
                          height: 242,
                          width: 200,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img_lvl_1.png'))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 59),
                  height: 216,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 165,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/bg_level.png'),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Image.asset(
                                  'assets/icon_play.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24, top: 10),
                                child: RichText(
                                    text: TextSpan(
                                        style: GoogleFonts.poppins(),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: "Level 2\n",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                        text: "10 Soal Random",
                                        style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2),
                                      )
                                    ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Container(
                          height: 164,
                          width: 200,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img_lvl_2.png'))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(numberOfQuestions: 20,),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 79),
                  height: 196,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 165,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/bg_level.png'),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Image.asset(
                                  'assets/icon_play.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24, top: 10),
                                child: RichText(
                                    text: TextSpan(
                                        style: GoogleFonts.poppins(),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: "Level 3\n",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                        text: "20 Soal Random",
                                        style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2),
                                      )
                                    ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Container(
                          height: 133,
                          width: 200,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img_lvl_3.png'))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
