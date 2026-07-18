// ============================================================
// BÀI 17: Stream - Đếm số đếm ngược
// Dùng async* và yield để tạo Stream đếm ngược từ 10 về 0
// Mỗi giây in ra một số, khi đến 0 in "Kết thúc!"
// ============================================================

import 'dart:async';

Future<void> main() async {
  print('=== BÀI 17: Stream - Đếm số đếm ngược ===\n');
  print('Bắt đầu đếm ngược từ 10...\n');

  // Lắng nghe Stream đếm ngược
  Stream<int> demNguoc = taoStreamDemNguoc(10);

  await for (int so in demNguoc) {
    if (so == 0) {
      print('🎉 Kết thúc!');
    } else {
      print('⏱️  $so...');
    }
  }

  print('\n--- Demo thêm: Stream với takeWhile ---');
  await demoTakeWhile();
}

// ====================
// STREAM GENERATOR (async*)
// ====================

/// Tạo Stream đếm ngược từ [batDau] về 0, mỗi giây emit 1 số
Stream<int> taoStreamDemNguoc(int batDau) async* {
  for (int i = batDau; i >= 0; i--) {
    yield i;
    if (i > 0) {
      await Future.delayed(Duration(seconds: 1));
    }
  }
}

/// Demo dùng takeWhile để dừng Stream
Future<void> demoTakeWhile() async {
  print('Đếm ngược từ 5, dừng khi đến 2 (dùng takeWhile):');
  Stream<int> stream = taoStreamDemNguoc(5).takeWhile((so) => so > 2);

  await for (int so in stream) {
    print('  → $so');
  }
  print('  ✂️ Stream đã dừng!');
}
