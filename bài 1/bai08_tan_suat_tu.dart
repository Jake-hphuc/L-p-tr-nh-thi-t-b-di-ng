// ============================================================
// BÀI 8: Đếm tần suất xuất hiện của từ trong câu
// Nhận vào câu, tách từ bằng split(' '), lưu vào Map<String, int>
// Ví dụ: "Dart is fun and Dart is easy" → {dart: 2, is: 2, fun: 1, and: 1, easy: 1}
// ============================================================

import 'dart:io';

void main() {
  print('=== BÀI 8: Đếm tần suất từ trong câu ===\n');

  // Test với ví dụ mẫu
  String mauCau = 'Dart is fun and Dart is easy';
  print('Câu mẫu: "$mauCau"');
  Map<String, int> ketQua1 = demTanSuatTu(mauCau);
  _inKetQua(ketQua1);

  print('\n--- Nhập câu của bạn ---');
  stdout.write('Nhập câu: ');
  String cauNhap = stdin.readLineSync()!;
  Map<String, int> ketQua2 = demTanSuatTu(cauNhap);
  _inKetQua(ketQua2);
}

/// Đếm số lần xuất hiện của mỗi từ trong [cau]
/// Không phân biệt hoa/thường
Map<String, int> demTanSuatTu(String cau) {
  Map<String, int> tanSuat = {};

  // Tách các từ và chuyển về chữ thường
  List<String> cacTu = cau.split(' ');

  for (String tu in cacTu) {
    String tuThap = tu.toLowerCase().trim();
    if (tuThap.isNotEmpty) {
      tanSuat[tuThap] = (tanSuat[tuThap] ?? 0) + 1;
    }
  }

  return tanSuat;
}

void _inKetQua(Map<String, int> tanSuat) {
  print('\nKết quả:');
  print(tanSuat);
  print('\nChi tiết:');
  tanSuat.forEach((tu, soLan) {
    print('  "$tu": $soLan lần');
  });
}
