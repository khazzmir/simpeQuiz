import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class QuizPage extends StatefulWidget {
  final int numberOfQuestions;

  const QuizPage({super.key, this.numberOfQuestions = 10});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object?>> allQuestions = [
    {
      "question": "Berapa gelas air yang disarankan untuk diminum setiap hari?",
      "options": [
        "4 gelas (1 liter)",
        "6 gelas (1,5 liter)",
        "8 gelas (2 liter)",
        "10 gelas (2,5 liter)"
      ],
      "answer": "8 gelas (2 liter)",
      "funFact":
          "Meskipun 8 gelas sehari adalah rekomendasi umum, kebutuhan setiap orang berbeda tergantung aktivitas, usia, dan cuaca.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Apa manfaat utama minum air yang cukup setiap hari?",
      "options": [
        "Meningkatkan energi",
        "Menjaga hidrasi dan fungsi tubuh",
        "Memperbaiki kulit",
        "Mengurangi rasa lapar"
      ],
      "answer": "Menjaga hidrasi dan fungsi tubuh",
      "funFact":
          "Minum air membantu meningkatkan konsentrasi, mendukung pencernaan, dan menjaga suhu tubuh tetap stabil.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Air membantu tubuh mengeluarkan racun melalui...",
      "options": ["Liver", "Ginjal", "Pencernaan", "Limbah"],
      "answer": "Ginjal",
      "funFact":
          "Ginjal menyaring sekitar 50 galon darah setiap hari untuk menghasilkan urin, mengeluarkan racun, dan menjaga keseimbangan cairan tubuh.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Minum air yang cukup dapat meningkatkan fungsi organ...",
      "options": ["Jantung", "Hati", "Otak", "Ginjal"],
      "answer": "Otak",
      "funFact":
          "Dehidrasi dapat menurunkan kemampuan otak hingga 10%, sehingga minum air cukup penting untuk konsentrasi dan ingatan.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Apa tanda pertama tubuh mengalami dehidrasi ringan?",
      "options": ["Pusing", "Haus", "Lelah", "Kram perut"],
      "answer": "Haus",
      "funFact":
          "Haus adalah tanda awal dehidrasi, tetapi gejala lain seperti kelelahan dan pusing bisa menyusul jika tubuh tetap kekurangan cairan.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Berapa persen tubuh manusia terdiri dari air?",
      "options": ["40%", "50%", "60%", "70%"],
      "answer": "60%",
      "funFact":
          "Organ seperti otak dan jantung terdiri dari 73% air, sedangkan paru-paru mengandung hingga 83% air!",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Minum air sebelum makan dapat membantu...",
      "options": [
        "Meningkatkan pencernaan",
        "Mengontrol berat badan",
        "Menjaga kesehatan kulit",
        "Mempercepat metabolisme"
      ],
      "answer": "Mengontrol berat badan",
      "funFact":
          "Minum air sebelum makan dapat mengurangi asupan kalori dengan membuat perut terasa lebih kenyang.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Apa fungsi utama air dalam darah?",
      "options": [
        "Membawa oksigen dan nutrisi",
        "Mengatur suhu tubuh",
        "Menyaring racun",
        "Membantu pembekuan darah"
      ],
      "answer": "Membawa oksigen dan nutrisi",
      "funFact":
          "Sekitar 90% plasma darah adalah air, yang memungkinkan transportasi nutrisi dan oksigen ke seluruh tubuh.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Apa risiko utama dari dehidrasi kronis?",
      "options": [
        "Batu ginjal dan masalah kesehatan lainnya",
        "Hipertensi",
        "Kanker",
        "Gagal jantung"
      ],
      "answer": "Batu ginjal dan masalah kesehatan lainnya",
      "funFact":
          "Dehidrasi kronis dapat meningkatkan risiko batu ginjal karena kurangnya cairan untuk melarutkan mineral di urin.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question":
          "Minum air secara teratur dapat menjaga kesehatan kulit dengan cara...",
      "options": [
        "Mengurangi keriput",
        "Meningkatkan elastisitas dan kelembapan kulit",
        "Menghilangkan jerawat",
        "Mencerahkan kulit"
      ],
      "answer": "Meningkatkan elastisitas dan kelembapan kulit",
      "funFact":
          "Kulit yang terhidrasi lebih baik cenderung terlihat lebih bercahaya dan mengurangi risiko kerutan dini.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question":
          "Apa yang dapat terjadi jika kita minum terlalu banyak air dalam waktu singkat?",
      "options": ["Keracunan air", "Kelelahan", "Hiponatremia", "Kram perut"],
      "answer": "Hiponatremia",
      "funFact":
          "Hiponatremia adalah kondisi langka tetapi serius yang terjadi ketika kadar natrium dalam darah menjadi terlalu rendah akibat kelebihan air.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Minum air hangat di pagi hari dapat membantu...",
      "options": [
        "Melancarkan pencernaan",
        "Meningkatkan energi",
        "Membantu tidur",
        "Menurunkan berat badan"
      ],
      "answer": "Melancarkan pencernaan",
      "funFact":
          "Minum air hangat dapat membantu mengaktifkan sistem pencernaan dan membuang racun dari tubuh.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Kekurangan air dalam tubuh dapat menyebabkan...",
      "options": [
        "Sakit kepala dan kelelahan",
        "Mual dan muntah",
        "Pusing",
        "Penurunan berat badan"
      ],
      "answer": "Sakit kepala dan kelelahan",
      "funFact":
          "Salah satu penyebab sakit kepala yang paling umum adalah dehidrasi ringan. Segelas air sering kali bisa meredakannya!",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question":
          "Minum air putih membantu meningkatkan metabolisme tubuh hingga...",
      "options": ["10%", "20%", "30%", "40%"],
      "answer": "30%",
      "funFact":
          "Minum air dingin juga dapat meningkatkan pembakaran kalori karena tubuh harus bekerja lebih keras untuk menghangatkannya.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Air merupakan komponen utama dalam...",
      "options": ["Darah", "Limbah", "Sel", "Jantung"],
      "answer": "Darah",
      "funFact":
          "Darah terdiri dari sekitar 55% plasma, yang sebagian besar adalah air, penting untuk sirkulasi nutrisi.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Bagian tubuh manakah yang memiliki kandungan air tertinggi?",
      "options": ["Hati", "Paru-paru", "Otak", "Jantung"],
      "answer": "Paru-paru",
      "funFact":
          "Paru-paru memiliki sekitar 83% air, yang sangat penting untuk membantu proses pernapasan.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Minum air putih dapat membantu mengurangi risiko...",
      "options": ["Penyakit ginjal", "Diabetes", "Penyakit jantung", "Stroke"],
      "answer": "Penyakit ginjal",
      "funFact":
          "Minum cukup air membantu menjaga kesehatan ginjal dan mencegah pembentukan batu ginjal.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Air membantu menjaga suhu tubuh dengan cara...",
      "options": [
        "Berkeringat",
        "Mengalirkan darah",
        "Penyimpanan panas",
        "Regulasi suhu udara"
      ],
      "answer": "Berkeringat",
      "funFact":
          "Proses berkeringat adalah cara tubuh melepaskan panas berlebih untuk mencegah overheating.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Berapa persen air yang disarankan dalam asupan harian?",
      "options": ["40-50%", "50-60%", "50-70%", "70-80%"],
      "answer": "50-70%",
      "funFact":
          "Kebutuhan air harian bisa bervariasi, tetapi pada umumnya 50-70% dari tubuh kita terdiri dari air.",
      "userAnswer": null,
      "isCorrect": null
    },
    {
      "question": "Kapan waktu terbaik untuk minum air?",
      "options": [
        "Setelah makan",
        "Secara berkala sepanjang hari",
        "Sebelum tidur",
        "Hanya saat merasa haus"
      ],
      "answer": "Secara berkala sepanjang hari",
      "funFact":
          "Minum air di pagi hari setelah bangun tidur membantu rehidrasi tubuh setelah berjam-jam tidak minum.",
      "userAnswer": null,
      "isCorrect": null
    }
  ];

  List<Map<String, Object?>> questions = [];
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isAnswerCorrect;
  bool showFunFactButton = false;

  Map<int, String?> userAnswers = {};

  void randomizeQuestions() {
    questions = List.from(allQuestions)..shuffle(Random());
    questions = questions.take(widget.numberOfQuestions).toList();

    for (var question in questions) {
      final options = List<String>.from(question['options'] as List<String>);
      options.shuffle(Random());
      question['options'] = options;
    }
  }

  @override
  void initState() {
    super.initState();
    randomizeQuestions();
  }

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: Center(
            child: Text(
              "QUIZZZZ $screenWidth",
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
                                    ? () => checkAnswer(option)
                                    : null,
                                child: Container(
                                  width: double.maxFinite,
                                  margin: const EdgeInsets.symmetric(vertical: 5),
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
                                  onPressed:
                                      currentQuestionIndex < questions.length - 1
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
                                  onPressed: finishQuiz,
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
                                      onTap: () => goToQuestion(index),
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
                                                  : Colors.grey.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(10),
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
