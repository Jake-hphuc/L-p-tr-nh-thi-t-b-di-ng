// ============================================================
// BÀI 15: Xử lý ngoại lệ với Input từ bàn phím
// Yêu cầu nhập số nguyên, bắt lỗi nếu nhập sai
// Dùng vòng lặp while và try-catch
// ============================================================

import 'dart:io';

void main() {
  print('=== BÀI 15: Xử lý ngoại lệ với Input ===\n');

  int soNguyen = nhapSoNguyen('Nhập một số nguyên');
  print('\n✅ Bạn đã nhập đúng! Số nguyên: $soNguyen');
  print('Bình phương: ${soNguyen * soNguyen}');
  print('Căn bậc 2 (nếu >= 0): ${soNguyen >= 0 ? soNguyen.toDouble().sqrt().toStringAsFixed(4) : "Không áp dụng"}');
}

/// Nhập số nguyên từ bàn phím với xử lý ngoại lệ
/// Yêu cầu nhập lại cho đến khi đúng định dạng số nguyên
int nhapSoNguyen(String thongBao) {
  int? soNguyen;
  int soLanThu = 0;

  while (soNguyen == null) {
    soLanThu++;
    stdout.write('$thongBao: ');
    String? input = stdin.readLineSync();

    try {
      if (input == null || input.trim().isEmpty) {
        throw FormatException('Không được để trống!');
      }
      soNguyen = int.parse(input.trim());
      print('  ✅ Nhập hợp lệ sau $soLanThu lần thử!');
    } on FormatException catch (e) {
      print('  ❌ Lỗi: "${input ?? ""}" không phải số nguyên! ${e.message}');
      print('  ℹ️  Vui lòng nhập lại...');
    } catch (e) {
      print('  ❌ Lỗi không xác định: $e');
    }
  }

  return soNguyen;
}

extension on double {
  double sqrt() {
    if (this < 0) throw ArgumentError('Không thể tính căn bậc 2 của số âm');
    double x = this;
    double epsilon = 0.000001;
    double guess = x / 2;
    while ((guess * guess - x).abs() > epsilon) {
      guess = (guess + x / guess) / 2;
    }
    return guess;
  }
}
