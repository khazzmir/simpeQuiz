import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz/quiz_lvl_1_page.dart';
import 'package:simple_quiz/quiz_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isTablet = screenWidth >= 650 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: Center(
            child: Text(
              "Kuis Hidrasi $screenWidth",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : (isTablet
                  ? _buildTabletLayout(context)
                  : _buildMobileLayout(context)),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: _buildLevelCard(
                    level: 1,
                    title: "Wajib Diketahui",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizLvl1Page(),
                        ),
                      );
                    },
                    imagePath: "img_lvl_1.png",
                    height: 500,
                    heightBox: 450,
                    backgroundBox: 'assets/box_desktop.png',
                    fontSizeTitle: 30,
                    fontSizeSubtitle: 35,
                    paddingIcon: const EdgeInsets.only(left: 24, top: 250),
                    imageHeight: 350,
                    imageWidth: 300)),
            const SizedBox(width: 16),
            Expanded(
                child: _buildLevelCard(
                    level: 2,
                    title: "10 Soal Random",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizPage(),
                        ),
                      );
                    },
                    imagePath: "img_lvl_2.png",
                    height: 500,
                    heightBox: 450,
                    backgroundBox: 'assets/box_desktop.png',
                    fontSizeTitle: 30,
                    fontSizeSubtitle: 35,
                    paddingIcon: const EdgeInsets.only(left: 24, top: 250),
                    imageHeight: 350,
                    imageWidth: 300)),
        const SizedBox(width: 16),
        Expanded(
          child: _buildLevelCard(
              level: 3,
              title: "20 Soal Random",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(
                      numberOfQuestions: 20,
                    ),
                  ),
                );
              },
              imagePath: "img_lvl_3.png",
              height: 500,
              heightBox: 450,
              backgroundBox: 'assets/box_desktop.png',
                    fontSizeTitle: 30,
                    fontSizeSubtitle: 35,
                    paddingIcon: const EdgeInsets.only(left: 24, top: 250),
                    imageHeight: 350,
                    imageWidth: 300),
        ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: _buildLevelCard(
                    level: 1,
                    title: "Wajib Diketahui",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizLvl1Page(),
                        ),
                      );
                    },
                    imagePath: "img_lvl_1.png")),
            const SizedBox(width: 16),
            Expanded(
                child: _buildLevelCard(
                    level: 2,
                    title: "10 Soal Random",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizPage(),
                        ),
                      );
                    },
                    imagePath: "img_lvl_2.png")),
          ],
        ),
        const SizedBox(width: 16),
        Center(
          child: _buildLevelCard(
              level: 3,
              title: "20 Soal Random",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(
                      numberOfQuestions: 20,
                    ),
                  ),
                );
              },
              imagePath: "img_lvl_3.png",
              width: 500),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildLevelCard(
            level: 1,
            title: "Wajib Diketahui",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizLvl1Page(),
                ),
              );
            },
            imagePath: "img_lvl_1.png"),
        const SizedBox(height: 16),
        _buildLevelCard(
            level: 2,
            title: "10 Soal Random",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizPage(),
                ),
              );
            },
            imagePath: "img_lvl_2.png"),
        const SizedBox(height: 16),
        _buildLevelCard(
            level: 3,
            title: "20 Soal Random",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizPage(
                    numberOfQuestions: 20,
                  ),
                ),
              );
            },
            imagePath: "img_lvl_3.png"),
      ],
    );
  }

  Widget _buildHeader() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(),
        children: <TextSpan>[
          TextSpan(
            text: "Ayo Mulai\n",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: const Color(0xFF0984E1),
            ),
          ),
          TextSpan(
            text: "jawab seluruh kuisnya !!!",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: const Color(0xFF369CE9).withOpacity(0.75),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard({
    required int level,
    required String title,
    required VoidCallback onTap,
    required String imagePath,
    double width = double.infinity,
    double height = 252,
    double heightBox = 165,
    String backgroundBox = 'assets/bg_level.png',
    double fontSizeTitle = 20,
    double fontSizeSubtitle = 24,
    double imageHeight = 242,
    double imageWidth = 200,
    EdgeInsetsGeometry paddingIcon = const EdgeInsets.only(left: 24),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: heightBox,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundBox),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: paddingIcon,
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
                              text: "Level $level\n",
                              style: GoogleFonts.poppins(
                                fontSize: fontSizeTitle,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: title,
                              style: GoogleFonts.poppins(
                                fontSize: fontSizeSubtitle,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
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
              top: 0,
              right: 13,
              child: Container(
                height: imageHeight,
                width: imageWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/$imagePath'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
