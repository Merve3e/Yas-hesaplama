import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yaş Hesaplama Uygulaması',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AgeCalculator(),
    );
  }
}

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({super.key});

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final TextEditingController _dateController = TextEditingController();
  String _ageMessage = "Yaşınız: ";

  void _calculateAge() {
    try {
      final DateTime birthDate = DateFormat("dd.MM.yyyy").parse(_dateController.text);
      final DateTime today = DateTime.now();
      int age = today.year - birthDate.year;


      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      setState(() {
        _ageMessage = "Yaşınız: $age";
      });
    } catch (e) {
      setState(() {
        _ageMessage = "Lütfen geçerli bir tarih girin (gg.aa.yyyy)!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yaş Hesaplama Uygulaması"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _ageMessage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: "Tarihinizi girin (gg.aa.yyyy)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Çalıştır",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



