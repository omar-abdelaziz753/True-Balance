import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final Map<String, List<String>> availableDateTime = {
    '2025-06-25': ['09:00', '11:00'],
    '2025-06-27': ['10:00', '14:00'],
  };

  final List<Map<String, String>> selectedSessions = [];

  Future<void> pickSession() async {
    // Get a valid initial date
    final firstAvailableDate = DateFormat(
      'yyyy-MM-dd',
    ).parse(availableDateTime.keys.first);

    // Date picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: firstAvailableDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      selectableDayPredicate: (date) {
        final formatted = DateFormat('yyyy-MM-dd').format(date);
        return availableDateTime.containsKey(formatted);
      },
    );

    if (pickedDate == null) return;

    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    List<String> availableTimes = availableDateTime[formattedDate]!;

    // Time picker
    String? selectedTime = await showDialog<String>(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text("Select Time"),
        children: availableTimes
            .map(
              (time) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, time),
                child: Text(time),
              ),
            )
            .toList(),
      ),
    );

    if (selectedTime == null) return;

    // Check for duplicates
    final alreadyExists = selectedSessions.any(
      (session) =>
          session['date'] == formattedDate && session['time'] == selectedTime,
    );

    if (alreadyExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("This session is already selected."),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Add to selected list
    setState(() {
      selectedSessions.add({
        'date': formattedDate,
        'time': selectedTime,
        'status': 'Available',
      });
    });
  }

  void removeSession(int index) {
    setState(() {
      selectedSessions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Sessions"),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: pickSession),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: selectedSessions.isEmpty
            ? const Center(child: Text("No sessions selected."))
            : GridView.builder(
                itemCount: selectedSessions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final session = selectedSessions[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                session['date']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Time: ${session['time']}",
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                session['status']!,
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => removeSession(index),
                              splashRadius: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
