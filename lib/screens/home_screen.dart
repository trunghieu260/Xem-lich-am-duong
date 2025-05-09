import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/lunar_converter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lunarInfo = LunarConverter.convertToLunar(selectedDate); //chuyển đổi từ ngày dương lịch → âm lịch.

    return Scaffold(
      appBar: AppBar(title: const Text("Lịch Dương - Âm")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dòng Dương lịch
            Text(
              "Dương lịch: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(selectedDate)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),

            // Dòng Âm lịch
            Text(
              "Âm lịch: ${lunarInfo['day']} tháng ${lunarInfo['month']} năm ${lunarInfo['year']}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text("Chọn ngày khác"),
            ),
          ],
        ),
      ),
    );
  }
}
