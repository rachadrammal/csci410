import 'dart:math';
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
      home: const SkillHomePage(),
    );
  }
}

class SkillHomePage extends StatefulWidget {
  const SkillHomePage({super.key});

  @override
  State<SkillHomePage> createState() => _SkillHomePageState();
}

class _SkillHomePageState extends State<SkillHomePage> {
  String? selectedCategory;
  String generatedTask = "";

  final Map<String, List<String>> tasks = {
    "Memory": [
      "Memorize 5 random objects from your room, then recall them after 10 minutes.",
      "Remember a 6-digit number backwards.",
      "Memorize the order of 10 items in your kitchen.",
      "Read a paragraph and memorize the first sentence.",
      "Try remembering 8 random words and repeat them after 5 minutes."
    ],
    "Focus": [
      "Focus on your breathing for 30 seconds without distraction.",
      "Look at one spot for 20 seconds without moving your eyes.",
      "Work for 2 minutes without touching your phone.",
      "Sit still and count to 60 without losing focus.",
      "Listen to one sound and follow it for 10 seconds."
    ],
    "Creativity": [
      "Think of 3 new uses for a spoon.",
      "Draw a simple squiggle and turn it into something.",
      "Invent a new object in 30 seconds.",
      "Imagine a new color and describe it with words.",
      "Come up with a fun product idea quickly."
    ],
    "Observation": [
      "Identify 3 things in your room you never noticed before.",
      "Look outside and find 5 moving objects.",
      "Close your eyes and identify 3 sounds.",
      "Observe shadows and describe their shapes.",
      "Notice 3 color tones around you and describe them."
    ],
  };

  void generateTask() {
    if (selectedCategory == null) return;

    final list = tasks[selectedCategory]!;
    final randomIndex = Random().nextInt(list.length);

    setState(() {
      generatedTask = list[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MicroSkill Trainer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Select a Skill Category:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Category Dropdown
            DropdownButton<String>(
              isExpanded: true,
              value: selectedCategory,
              hint: const Text("Choose Category"),
              items: tasks.keys.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 25),

            // Button
            ElevatedButton(
              onPressed: generateTask,
              child: const Text("Generate Skill"),
            ),

            const SizedBox(height: 25),

            // Result Card
            if (generatedTask.isNotEmpty)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    generatedTask,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
