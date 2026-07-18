// ============================================================
// BÀI 6: Hàm Fibonacci có bộ nhớ đệm (Memoization)
// Yêu cầu: Dùng Map để lưu kết quả tái sử dụng
// So sánh thời gian với đệ quy thông thường
// ============================================================

import 'dart:io';

void main() {
  print('=== BÀI 6: Fibonacci với Memoization ===\n');

  stdout.write('Nhập n để tính số Fibonacci thứ n: ');
  int n = int.parse(stdin.readLineSync()!);

  // --- Đo thời gian Memoization ---
  Map<int, BigInt> cache = {};
  Stopwatch sw1 = Stopwatch()..start();
  BigInt resultMemo = fibMemo(n, cache);
  sw1.stop();

  // --- Đo thời gian đệ quy thông thường (chỉ test với n nhỏ) ---
  print('\nKết quả:');
  print('Fibonacci($n) = $resultMemo');
  print('\nThời gian Memoization: ${sw1.elapsedMicroseconds} microseconds');

  if (n <= 40) {
    Stopwatch sw2 = Stopwatch()..start();
    fibNormal(n);
    sw2.stop();
    print('Thời gian đệ quy thường: ${sw2.elapsedMicroseconds} microseconds');
    print('\n📊 Memoization nhanh hơn ${sw2.elapsedMicroseconds ~/ (sw1.elapsedMicroseconds + 1)} lần!');
  } else {
    print('(Bỏ qua đệ quy thường vì n > 40 sẽ rất chậm)');
  }
}

/// Fibonacci dùng Memoization (lưu kết quả vào Map [cache])
BigInt fibMemo(int n, Map<int, BigInt> cache) {
  if (n <= 1) return BigInt.from(n);
  if (cache.containsKey(n)) return cache[n]!;
  cache[n] = fibMemo(n - 1, cache) + fibMemo(n - 2, cache);
  return cache[n]!;
}

/// Fibonacci đệ quy thông thường (không Memoization)
int fibNormal(int n) {
  if (n <= 1) return n;
  return fibNormal(n - 1) + fibNormal(n - 2);
}
