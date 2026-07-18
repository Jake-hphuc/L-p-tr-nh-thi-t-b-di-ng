// ============================================================
// BÀI 1: Tính tổng các số chia hết cho 3
// Yêu cầu: Nhập n, tính tổng các số từ 1 đến n mà chia hết cho 3
// Dùng vòng lặp for và kiểm tra điều kiện bằng %
// Ví dụ: n = 10 → Tổng = 3 + 6 + 9 = 18
// ============================================================

import 'dart:io';

void main() {
  print('=== BÀI 1: Tính tổng các số chia hết cho 3 ===\n');

  stdout.write('Nhập số nguyên n: ');
  int n = int.parse(stdin.readLineSync()!);

  int tong = tinhTongChiaHet3(n);

  print('\nKết quả:');
  print('Các số từ 1 đến $n chia hết cho 3:');

  // In danh sách các số chia hết cho 3
  List<int> danhSach = [];
  for (int i = 1; i <= n; i++) {
    if (i % 3 == 0) danhSach.add(i);
  }
  print(danhSach.join(' + ') + ' = $tong');
}

/// Hàm tính tổng các số từ 1 đến [n] mà chia hết cho 3
int tinhTongChiaHet3(int n) {
  int tong = 0;
  for (int i = 1; i <= n; i++) {
    if (i % 3 == 0) {
      tong += i;
    }
  }
  return tong;
}
