import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<FAQItem> faqs = [
    FAQItem(
      question: '1. How does the step counter work?',
      answer:
          'Our step counter uses your device\'s built-in motion sensors to track your daily steps accurately. Just keep your phone with you while walking, and the app will log your steps automatically in the background.',
    ),
    FAQItem(
      question: '2. How accurate is the step counter?',
      answer:
          'The accuracy depends on your device\'s sensors. Most modern smartphones provide step counting accuracy between 90-95% under normal walking conditions.',
    ),
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF2D70C7)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Color(0xFF2D70C7),
                ),
              ),
            ),
            const SizedBox(width: 40),
            const Text(
              'Feedback',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2D70C7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                faqs[index].question,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              initiallyExpanded: expandedIndex == index,
              onExpansionChanged: (expanded) {
                setState(() {
                  expandedIndex = expanded ? index : null;
                });
              },
              children: [
                Text(
                  faqs[index].answer,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
