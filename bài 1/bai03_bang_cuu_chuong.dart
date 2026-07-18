// ============================================================
// BÀI 3: In bảng cửu chương
// Yêu cầu: In bảng cửu chương từ 2 đến 9 theo dạng cột
// Dùng vòng lặp lồng nhau và padRight để căn chỉnh
// ============================================================

void main() {
  print('=== BÀI 3: Bảng cửu chương ===\n');
  inBangCuuChuong();
}

/// In bảng cửu chương từ 2 đến 9 theo dạng cột ngang
void inBangCuuChuong() {
  // Duyệt từ hàng 1 đến 10
  for (int hang = 1; hang <= 10; hang++) {
    String dongIn = '';
    // Duyệt từ bảng 2 đến 9
    for (int bang = 2; bang <= 9; bang++) {
      int ketQua = bang * hang;
      String phanTu = '$bang x $hang = $ketQua';
      // Dùng padRight để căn chỉnh độ rộng cột
      dongIn += phanTu.padRight(15);
    }
    print(dongIn);
  }
}
