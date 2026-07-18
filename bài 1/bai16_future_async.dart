// ============================================================
// BÀI 16: Gọi API giả lập - Future & Async/Await
// Sử dụng Future.wait để gọi 2 API cùng lúc
// Đo thời gian bằng Stopwatch và so sánh với gọi tuần tự
// ============================================================

Future<void> main() async {
  print('=== BÀI 16: Future & Async/Await ===\n');

  // === Cách 1: Gọi ĐỒNG THỜI bằng Future.wait ===
  print('--- Cách 1: Gọi đồng thời (Future.wait) ---');
  Stopwatch sw1 = Stopwatch()..start();
  await getUserInfo();
  sw1.stop();
  print('⏱️  Thời gian: ${sw1.elapsedMilliseconds}ms\n');

  // === Cách 2: Gọi TUẦN TỰ (so sánh) ===
  print('--- Cách 2: Gọi tuần tự (await từng cái) ---');
  Stopwatch sw2 = Stopwatch()..start();
  String name = await fetchUserName();
  double balance = await fetchUserBalance();
  sw2.stop();
  print('Tên: $name');
  print('Số dư: $balance');
  print('⏱️  Thời gian: ${sw2.elapsedMilliseconds}ms');

  print('\n📊 Kết luận:');
  print('  Future.wait: ${sw1.elapsedMilliseconds}ms');
  print('  Tuần tự:     ${sw2.elapsedMilliseconds}ms');
  print('  Future.wait nhanh hơn ~${sw2.elapsedMilliseconds - sw1.elapsedMilliseconds}ms!');
}

// ====================
// API GIẢ LẬP
// ====================

/// Giả lập gọi API lấy tên người dùng (delay 2 giây)
Future<String> fetchUserName() async {
  print('  🔄 Đang lấy tên người dùng...');
  await Future.delayed(Duration(seconds: 2));
  return 'Nguyen Van A';
}

/// Giả lập gọi API lấy số dư tài khoản (delay 1 giây)
Future<double> fetchUserBalance() async {
  print('  🔄 Đang lấy số dư tài khoản...');
  await Future.delayed(Duration(seconds: 1));
  return 1500.5;
}

/// Gọi cả 2 API đồng thời bằng Future.wait
Future<void> getUserInfo() async {
  print('  🚀 Gọi 2 API cùng lúc...');
  List<dynamic> results = await Future.wait([
    fetchUserName(),
    fetchUserBalance(),
  ]);

  String name = results[0] as String;
  double balance = results[1] as double;

  print('  ✅ Tên: $name');
  print('  ✅ Số dư: $balance');
}
