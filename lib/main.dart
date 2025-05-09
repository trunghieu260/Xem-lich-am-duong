import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';       // ← thêm dòng này
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1) Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2) Khởi tạo dữ liệu locale cho intl (ở đây là tiếng Việt)
  await initializeDateFormatting('vi', null);

  runApp(const LichApp());
}

class LichApp extends StatelessWidget {
  const LichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lịch Dương Âm',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
