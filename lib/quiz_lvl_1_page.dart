import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizLvl1Page extends StatefulWidget {
  const QuizLvl1Page({super.key});

  @override
  State<QuizLvl1Page> createState() => _QuizLvl1PageState();
}

class _QuizLvl1PageState extends State<QuizLvl1Page> {
  final List<Map<String, Object?>> questions = [
    {
      'question': 'Berapa persen tubuh manusia terdiri dari air?',
      'options': [
        '30-40%',
        '50-60%',
        '70-80%',
        '90-100%',
      ],
      'answer': '50-60%',
      'funFact':
          'Air membentuk sekitar 60% dari berat tubuh manusia. Organ tubuh seperti otak dan jantung bahkan terdiri dari sekitar 73% air, sementara paru-paru mengandung sekitar 83% air! Ini menunjukkan betapa pentingnya air untuk fungsi organ vital kita.',
      'userAnswer': null,
      'isCorrect': null,
    },
    {
      'question': 'Apa gejala umum dehidrasi ringan pada tubuh?',
      'options': [
        'Pusing, lelah, dan mulut kering',
        'Penurunan suhu tubuh',
        'Penurunan nafsu makan',
        'Nyeri otot mendadak',
      ],
      'answer': 'Pusing, lelah, dan mulut kering',
      'funFact':
          'Dehidrasi ringan tidak hanya menyebabkan gejala seperti lelah dan mulut kering, tetapi juga dapat memengaruhi konsentrasi dan suasana hati. Bahkan penurunan hidrasi tubuh sebesar 1-2% saja dapat berdampak pada kemampuan berpikir!',
      'userAnswer': null,
      'isCorrect': null,
    },
    {
      'question':
          'Berapa jumlah rata-rata air yang disarankan untuk diminum orang dewasa setiap hari?',
      'options': [
        '1 liter',
        '1.5 liter',
        '2-3 liter',
        '4 liter',
      ],
      'answer': '2-3 liter',
      'funFact':
          'Jumlah air yang dibutuhkan tubuh bisa bervariasi tergantung usia, jenis kelamin, dan aktivitas fisik. Namun, sebagian besar cairan yang kita butuhkan tidak hanya berasal dari air minum, tetapi juga dari makanan seperti buah-buahan dan sayuran yang tinggi kandungan airnya.',
      'userAnswer': null,
      'isCorrect': null,
    },
    {
      'question': 'Apa fungsi utama air dalam tubuh manusia?',
      'options': [
        'Memberikan energi secara langsung',
        'Mengatur suhu tubuh dan membantu pencernaan',
        'Meningkatkan kadar gula darah',
        'Membantu tubuh memproduksi vitamin',
      ],
      'answer': 'Mengatur suhu tubuh dan membantu pencernaan',
      'funFact':
          'Air berperan sebagai "pendingin alami" tubuh. Saat kita berkeringat, air membantu tubuh menjaga suhu tetap stabil, terutama selama cuaca panas atau saat berolahraga. Selain itu, air juga membantu mengangkut nutrisi dan membuang limbah dari tubuh.',
      'userAnswer': null,
      'isCorrect': null,
    },
    {
      'question':
          'Minum air cukup dapat membantu mencegah penyakit berikut ini, kecuali?',
      'options': [
        'Batu ginjal',
        'Infeksi saluran kemih',
        'Migrain',
        'Gangguan penglihatan',
      ],
      'answer': 'Gangguan penglihatan',
      'funFact':
          'Minum air cukup dapat membantu mencegah batu ginjal karena air membantu melarutkan mineral dalam urin, sehingga mencegah pembentukan kristal. Namun, air tidak secara langsung memengaruhi kesehatan penglihatan, kecuali jika tubuh sangat dehidrasi, yang bisa menyebabkan mata kering.',
      'userAnswer': null,
      'isCorrect': null,
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isAnswerCorrect;
  bool showFunFactButton = false;

  Map<int, String?> userAnswers = {};

  void checkAnswer(String selectedOption) {
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
            title: const Text('Fun Fact'),
            content: Text(funFact),
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

  void nextQuestion() {
    setState(() {
      selectedAnswer = null;
      isAnswerCorrect = null;
      showFunFactButton = false;
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void goToQuestion(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
  }

  String getMessage(int correctAnswers, int totalQuestions) {
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

  void finishQuiz() {
    int correctAnswersCount = questions
        .where((question) =>
            question['isCorrect'] == true && question['isCorrect'] != null)
        .length;

    int totalQuestions = questions.length;
    String message = getMessage(correctAnswersCount, totalQuestions);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              ...((currentQuestion['options'] as List<String>).map((option) {
                final isSelected = currentQuestion['userAnswer'] == option;
                final isCorrect = option == currentQuestion['answer'];
        
                return GestureDetector(
                  onTap: currentQuestion['userAnswer'] == null
                      ? () => checkAnswer(option)
                      : null,
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: currentQuestion['userAnswer'] != null
                          ? isSelected
                              ? ((currentQuestion['isCorrect'] as bool? ?? false)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(questions.length, (index) {
                  final question = questions[index];
                  final isAnswered = question['userAnswer'] != null;
                  final isCorrect = question['isCorrect'] != null &&
                          question['isCorrect'] is bool
                      ? question['isCorrect'] as bool
                      : false;
        
                  return GestureDetector(
                    onTap: () => goToQuestion(index),
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
              if (questions[currentQuestionIndex]['userAnswer'] != null &&
                  showFunFactButton)
                ElevatedButton(
                  onPressed: () {
                    final funFact =
                        questions[currentQuestionIndex]['funFact'] as String;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Fun Fact'),
                        content: Text(funFact),
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
              const SizedBox(height: 20),
              if (currentQuestionIndex == questions.length - 1 &&
                  questions.every((q) => q['userAnswer'] != null))
                ElevatedButton(
                  onPressed: finishQuiz,
                  child: const Text('Finish'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
