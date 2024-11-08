import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPage extends StatefulWidget {
  final int questionCount;

  const QuizPage({
    super.key,
    required this.questionCount,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  SharedPreferences? prefs;
  bool isPrefsUpdated = false;

  final List<Map<String, Object>> allQuestions = [
    {
      'question': 'Berapa gelas air yang disarankan untuk diminum setiap hari?',
      'options': [
        '6-8 gelas',
        '10-12 gelas',
        '2-4 gelas',
        '8-10 gelas',
      ],
      'answer': '6-8 gelas'
    },
    {
      'question': 'Apa manfaat utama minum air yang cukup setiap hari?',
      'options': [
        'Membantu penurunan berat badan',
        'Menjaga hidrasi tubuh',
        'Meningkatkan energi',
        'Semua jawaban benar',
      ],
      'answer': 'Semua jawaban benar'
    },
    {
      'question': 'Air membantu tubuh mengeluarkan racun melalui...',
      'options': [
        'Keringat dan urin',
        'Pernafasan',
        'Makanan',
        'Darah',
      ],
      'answer': 'Keringat dan urin'
    },
    {
      'question': 'Minum air yang cukup dapat meningkatkan fungsi organ...',
      'options': [
        'Hati',
        'Jantung',
        'Ginjal',
        'Semua organ',
      ],
      'answer': 'Semua organ'
    },
    {
      'question': 'Apa tanda pertama tubuh mengalami dehidrasi ringan?',
      'options': [
        'Kelelahan',
        'Haus',
        'Mual',
        'Nyeri kepala',
      ],
      'answer': 'Haus'
    },
    {
      'question': 'Berapa persen tubuh manusia terdiri dari air?',
      'options': [
        '60-70%',
        '80-90%',
        '40-50%',
        '30-40%',
      ],
      'answer': '60-70%'
    },
    {
      'question': 'Minum air sebelum makan dapat membantu...',
      'options': [
        'Meningkatkan nafsu makan',
        'Mengurangi porsi makan',
        'Menurunkan energi',
        'Menghindari makanan'
      ],
      'answer': 'Mengurangi porsi makan'
    },
    {
      'question': 'Apa fungsi utama air dalam darah?',
      'options': [
        'Membawa nutrisi dan oksigen ke seluruh tubuh',
        'Mengurangi stres',
        'Meningkatkan tidur',
        'Mengatur suhu tubuh'
      ],
      'answer': 'Membawa nutrisi dan oksigen ke seluruh tubuh'
    },
    {
      'question': 'Apa risiko utama dari dehidrasi kronis?',
      'options': ['Penyakit ginjal', 'Obesitas', 'Kanker', 'Penuaan dini'],
      'answer': 'Penyakit ginjal'
    },
    {
      'question':
          'Minum air secara teratur dapat menjaga kesehatan kulit dengan cara...',
      'options': [
        'Melembapkan kulit',
        'Mencerahkan kulit',
        'Mencegah jerawat',
        'Semua jawaban benar'
      ],
      'answer': 'Semua jawaban benar'
    },
    {
      'question':
          'Apa yang dapat terjadi jika kita minum terlalu banyak air dalam waktu singkat?',
      'options': ['Dehidrasi', 'Keracunan air', 'Hipotensi', 'Inflamasi'],
      'answer': 'Keracunan air'
    },
    {
      'question': 'Minum air hangat di pagi hari dapat membantu...',
      'options': [
        'Mengurangi stres',
        'Melancarkan pencernaan',
        'Meningkatkan imunitas',
        'Membuat tidur nyenyak'
      ],
      'answer': 'Melancarkan pencernaan'
    },
    {
      'question': 'Kekurangan air dalam tubuh dapat menyebabkan...',
      'options': [
        'Kulit kering',
        'Sakit kepala',
        'Kelelahan',
        'Semua jawaban benar'
      ],
      'answer': 'Semua jawaban benar'
    },
    {
      'question':
          'Minum air putih membantu meningkatkan metabolisme tubuh hingga...',
      'options': ['10%', '20%', '5%', '30%'],
      'answer': '30%'
    },
    {
      'question': 'Air merupakan komponen utama dalam...',
      'options': ['Darah', 'Tulang', 'Otot', 'Semua jawaban benar'],
      'answer': 'Darah'
    },
    {
      'question': 'Bagian tubuh manakah yang memiliki kandungan air tertinggi?',
      'options': ['Hati', 'Darah', 'Otak', 'Tulang'],
      'answer': 'Otak'
    },
    {
      'question': 'Minum air putih dapat membantu mengurangi risiko...',
      'options': ['Penyakit ginjal', 'Diabetes', 'Asma', 'Osteoporosis'],
      'answer': 'Penyakit ginjal'
    },
    {
      'question': 'Air membantu menjaga suhu tubuh dengan cara...',
      'options': [
        'Menyerap panas',
        'Mendinginkan udara',
        'Mengeluarkan keringat',
        'Menyimpan energi'
      ],
      'answer': 'Mengeluarkan keringat'
    },
    {
      'question': 'Berapa persen air yang disarankan dalam asupan harian?',
      'options': ['10%', '20%', '50%', '80%'],
      'answer': '50%'
    },
    {
      'question': 'Kapan waktu terbaik untuk minum air?',
      'options': [
        'Setelah makan',
        'Ketika haus',
        'Sepanjang hari dalam jumlah kecil',
        'Sebelum tidur'
      ],
      'answer': 'Sepanjang hari dalam jumlah kecil'
    },
    {
      'question': 'Apa efek dari dehidrasi pada fungsi kognitif?',
      'options': [
        'Meningkatkan fokus',
        'Menurunkan konsentrasi',
        'Mengurangi stres',
        'Meningkatkan memori'
      ],
      'answer': 'Menurunkan konsentrasi'
    },
    {
      'question':
          'Untuk menjaga kadar hidrasi saat berolahraga, dianjurkan untuk minum air setiap...',
      'options': ['10-20 menit', '30 menit', '1 jam', 'Hanya saat haus'],
      'answer': '10-20 menit'
    },
    {
      'question': 'Dehidrasi parah bisa menyebabkan...',
      'options': [
        'Kehilangan kesadaran',
        'Hipotensi',
        'Hipertensi',
        'Peningkatan berat badan'
      ],
      'answer': 'Kehilangan kesadaran'
    },
    {
      'question': 'Air membantu menjaga keseimbangan...',
      'options': [
        'Asam-basa dalam tubuh',
        'Keseimbangan gula',
        'Keseimbangan lemak',
        'Hormon'
      ],
      'answer': 'Asam-basa dalam tubuh'
    },
    {
      'question': 'Minum air dingin setelah olahraga berat dapat...',
      'options': [
        'Menyebabkan kram otot',
        'Menyegarkan tubuh',
        'Meningkatkan energi',
        'Menurunkan kelelahan'
      ],
      'answer': 'Menyebabkan kram otot'
    },
    {
      'question': 'Kandungan mineral dalam air penting untuk...',
      'options': ['Tulang', 'Otot', 'Fungsi sel', 'Semua jawaban benar'],
      'answer': 'Semua jawaban benar'
    },
    {
      'question': 'Manfaat air untuk pencernaan adalah...',
      'options': [
        'Mempercepat metabolisme',
        'Membantu proses pengeluaran',
        'Meningkatkan nafsu makan',
        'Semua jawaban benar'
      ],
      'answer': 'Membantu proses pengeluaran'
    },
    {
      'question': 'Minum air putih sebelum tidur dapat membantu mencegah...',
      'options': ['Insomnia', 'Dehidrasi saat tidur', 'Mimpi buruk', 'Flu'],
      'answer': 'Dehidrasi saat tidur'
    },
    {
      'question': 'Apa yang terjadi jika tubuh kekurangan cairan 1-2% saja?',
      'options': [
        'Menurunkan energi',
        'Mengurangi konsentrasi',
        'Meningkatkan risiko penyakit',
        'Semua jawaban benar'
      ],
      'answer': 'Semua jawaban benar'
    },
    {
      'question':
          'Mengapa penting untuk minum lebih banyak air saat cuaca panas?',
      'options': [
        'Menghindari stroke',
        'Menghindari keringat',
        'Mencegah dehidrasi',
        'Mengurangi suhu tubuh'
      ],
      'answer': 'Mencegah dehidrasi'
    },
  ];

  List<Map<String, Object>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  Set<int> answeredQuestions = {};

  @override
  void initState() {
    super.initState();
    startQuiz();
  }

  void startQuiz() {
    selectedQuestions = List<Map<String, Object>>.from(allQuestions);
    selectedQuestions.shuffle();
    selectedQuestions = selectedQuestions.take(widget.questionCount).toList();
  }

  void checkAnswer(String selectedOption) {
    if (selectedOption == selectedQuestions[currentQuestionIndex]['answer']) {
      setState(() {
        score++;
      });
    }
    setState(() {
      answeredQuestions.add(currentQuestionIndex);
      currentQuestionIndex++;
    });
  }

  List<String> _shuffledOptions(int questionIndex) {
    final options = List<String>.from(
        selectedQuestions[questionIndex]['options'] as List<String>);
    options.shuffle();
    return options;
  }

  @override
  Widget build(BuildContext context) {
    bool isQuizEnd = currentQuestionIndex >= selectedQuestions.length;
    bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: Center(
              child: Text("Quizzz",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600))),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isQuizEnd
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Quiz Completed!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your score: $score/${selectedQuestions.length}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Back to Home'),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedQuestions[currentQuestionIndex]['question']
                                as String,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ...(_shuffledOptions(currentQuestionIndex))
                              .map((option) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: ElevatedButton(
                                onPressed: () => checkAnswer(option),
                                child: Text(option),
                              ),
                            );
                          }).toList(),
                          const SizedBox(height: 50),
                          Text(
                            'Soal Terjawab: ${answeredQuestions.length}/${selectedQuestions.length}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List<Widget>.generate(
                              selectedQuestions.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentQuestionIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: index == currentQuestionIndex
                                          ? Colors.green
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      '${index + 1}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
