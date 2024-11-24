import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz/questions.dart';

class QuizLvl1Page extends StatefulWidget {
  const QuizLvl1Page({super.key});

  @override
  State<QuizLvl1Page> createState() => _QuizLvl1PageState();
}

class _QuizLvl1PageState extends State<QuizLvl1Page> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isAnswerCorrect;
  bool showFunFactButton = false;

  Map<int, String?> userAnswers = {};

  void _checkAnswer(String selectedOption) {
    final correctAnswer = questions[currentQuestionIndex]['answer'] as String;
    final funFact = questions[currentQuestionIndex]['funFact'] as String;

    setState(() {
      questions[currentQuestionIndex]['userAnswer'] = selectedOption;
      questions[currentQuestionIndex]['isCorrect'] =
          selectedOption == correctAnswer;
      showFunFactButton = true;
    });

    Future.delayed(
      Duration.zero,
      () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Fun Fact',
              textAlign: TextAlign.center,
            ),
            content: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Text(funFact),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _goToQuestion(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
  }

  String _(int correctAnswers, int totalQuestions) {
    int percentage = ((correctAnswers / totalQuestions) * 100).round();

    if (percentage <= 25) {
      return "Kamu menjawab $correctAnswers jawaban benar dari $totalQuestions soal. Tetap semangat ya!";
    } else if (percentage <= 50) {
      return "Kamu menjawab $correctAnswers jawaban benar dari $totalQuestions soal. Lumayan, tingkatkan lagi usahamu!";
    } else if (percentage <= 75) {
      return "Kamu menjawab $correctAnswers jawaban benar dari $totalQuestions soal. Hebat! Pertahankan!";
    } else {
      return "Luar biasa! Kamu menjawab $correctAnswers jawaban benar dari $totalQuestions soal. Kamu sangat hebat!";
    }
  }

  void _finishQuiz() {
    int correctAnswersCount = questions
        .where((question) =>
            question['isCorrect'] == true && question['isCorrect'] != null)
        .length;

    int totalQuestions = questions.length;
    String message = _(correctAnswersCount, totalQuestions);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hasil Quiz'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: Center(
            child: Text(
              "QUIZZZZ",
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
          padding: const EdgeInsets.all(16.0),
          child: isDesktop
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        height: screenHeight * 0.85,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                              )
                            ],
                            color: const Color(0xFFFEF7FF),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Soal ${currentQuestionIndex + 1}/${questions.length}',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              currentQuestion['question'] as String,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ...((currentQuestion['options'] as List<String>)
                                .map((option) {
                              final isSelected =
                                  currentQuestion['userAnswer'] == option;
                              final isCorrect =
                                  option == currentQuestion['answer'];

                              return GestureDetector(
                                onTap: currentQuestion['userAnswer'] == null
                                    ? () => _checkAnswer(option)
                                    : null,
                                child: Container(
                                  width: double.maxFinite,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: currentQuestion['userAnswer'] != null
                                        ? isSelected
                                            ? ((currentQuestion['isCorrect']
                                                        as bool? ??
                                                    false)
                                                ? Colors.green
                                                : Colors.red)
                                            : (isCorrect
                                                ? Colors.green
                                                : Colors.white)
                                        : Colors.white,
                                    border: Border.all(
                                        color: const Color(0xFF4AA7EC)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    option,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: currentQuestionIndex > 0
                                      ? () {
                                          setState(() {
                                            currentQuestionIndex--;
                                          });
                                        }
                                      : null,
                                  child: const Icon(Icons.arrow_back),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: currentQuestionIndex <
                                          questions.length - 1
                                      ? () {
                                          setState(() {
                                            currentQuestionIndex++;
                                          });
                                        }
                                      : null,
                                  child: const Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            if (currentQuestionIndex == questions.length - 1 &&
                                questions.every((q) => q['userAnswer'] != null))
                              Center(
                                child: ElevatedButton(
                                  onPressed: _finishQuiz,
                                  child: const Text('Finish'),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              width: screenWidth * 0.45,
                              height: screenHeight * 0.415,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5,
                                    )
                                  ],
                                  color: const Color(0xFFFEF7FF),
                                  borderRadius: BorderRadius.circular(20)),
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 6,
                                  runSpacing: 15,
                                  alignment: WrapAlignment.start,
                                  children:
                                      List.generate(questions.length, (index) {
                                    final question = questions[index];
                                    final isAnswered =
                                        question['userAnswer'] != null;
                                    final isCorrect =
                                        question['isCorrect'] != null &&
                                                question['isCorrect'] is bool
                                            ? question['isCorrect'] as bool
                                            : false;
                                    return GestureDetector(
                                      onTap: () => _goToQuestion(index),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: index == currentQuestionIndex
                                              ? (isAnswered
                                                  ? (isCorrect
                                                      ? Colors.green
                                                      : Colors.red)
                                                  : Colors.grey)
                                              : isAnswered
                                                  ? (isCorrect
                                                      ? Colors.green
                                                          .withOpacity(0.5)
                                                      : Colors.red
                                                          .withOpacity(0.5))
                                                  : Colors.grey
                                                      .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          if (currentQuestion['userAnswer'] != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: screenWidth * 0.45,
                                height: screenHeight * 0.415,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 5,
                                      )
                                    ],
                                    color: const Color(0xFFFEF7FF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'FUNFACT',
                                      style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          currentQuestion['funFact'] as String,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                width: screenWidth * 0.45,
                                height: screenHeight * 0.415,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 5,
                                      )
                                    ],
                                    color: const Color(0xFFFEF7FF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'FUNFACT',
                                      style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      'Soal ${currentQuestionIndex + 1}/${questions.length}',
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentQuestion['question'] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...((currentQuestion['options'] as List<String>)
                        .map((option) {
                      final isSelected =
                          currentQuestion['userAnswer'] == option;
                      final isCorrect = option == currentQuestion['answer'];

                      return GestureDetector(
                        onTap: currentQuestion['userAnswer'] == null
                            ? () => _checkAnswer(option)
                            : null,
                        child: Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: currentQuestion['userAnswer'] != null
                                ? isSelected
                                    ? ((currentQuestion['isCorrect'] as bool? ??
                                            false)
                                        ? Colors.green
                                        : Colors.red)
                                    : (isCorrect ? Colors.green : Colors.white)
                                : Colors.white,
                            border: Border.all(color: const Color(0xFF4AA7EC)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            option,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList()),
                    const SizedBox(height: 68),
                    Wrap(
                      spacing: 6,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: List.generate(questions.length, (index) {
                        final question = questions[index];
                        final isAnswered = question['userAnswer'] != null;
                        final isCorrect = question['isCorrect'] != null &&
                                question['isCorrect'] is bool
                            ? question['isCorrect'] as bool
                            : false;
                        return GestureDetector(
                          onTap: () => _goToQuestion(index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: index == currentQuestionIndex
                                  ? (isAnswered
                                      ? (isCorrect ? Colors.green : Colors.red)
                                      : Colors.grey)
                                  : isAnswered
                                      ? (isCorrect
                                          ? Colors.green.withOpacity(0.5)
                                          : Colors.red.withOpacity(0.5))
                                      : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: currentQuestionIndex > 0
                              ? () {
                                  setState(() {
                                    currentQuestionIndex--;
                                  });
                                }
                              : null,
                          child: const Icon(Icons.arrow_back),
                        ),
                        const SizedBox(width: 10),
                        if (questions[currentQuestionIndex]['userAnswer'] !=
                                null &&
                            showFunFactButton)
                          ElevatedButton(
                            onPressed: () {
                              final funFact = questions[currentQuestionIndex]
                                  ['funFact'] as String;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Fun Fact',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 500,
                                    ),
                                    child: Text(funFact),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Tutup'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Show Fun Fact'),
                          ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: currentQuestionIndex < questions.length - 1
                              ? () {
                                  setState(() {
                                    currentQuestionIndex++;
                                  });
                                }
                              : null,
                          child: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (currentQuestionIndex == questions.length - 1 &&
                        questions.every((q) => q['userAnswer'] != null))
                      ElevatedButton(
                        onPressed: _finishQuiz,
                        child: const Text('Finish'),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
