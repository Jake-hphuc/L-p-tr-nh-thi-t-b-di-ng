// ============================================================
// BÀI 20: Ứng dụng đổi tiền tệ (API thời gian thực)
// Yêu cầu:
// 1. Gọi hàm lấy tỷ giá (có xử lý lỗi nếu API fail - dùng try-catch)
// 2. Nếu thành công, tính và in ra số tiền VND.
// 3. Nếu thất bại, thông báo lỗi và dùng tỷ giá mặc định (23000) để dự phòng.
// 4. Cho phép người dùng nhập nhiều lần cho đến khi nhập "exit".
// ============================================================

import 'dart:io';

Future<void> main() async {
  print('=== BÀI 20: Ứng dụng đổi tiền tệ USD -> VND ===\n');
  print('Nhập số tiền USD cần đổi sang VND.');
  print('Nhập "exit" để thoát chương trình.\n');

  bool tiepTuc = true;
  while (tiepTuc) {
    stdout.write('Nhập số tiền USD: ');
    String? input = stdin.readLineSync();

    if (input == null) continue;
    String trimInput = input.trim().toLowerCase();

    if (trimInput == 'exit') {
      print('\n👋 Tạm biệt!');
      tiepTuc = false;
      break;
    }

    double? usd = double.tryParse(trimInput);
    if (usd == null || usd < 0) {
      print('❌ Vui lòng nhập số tiền USD hợp lệ (số dương hoặc "exit" để thoát).\n');
      continue;
    }

    print('⏳ Đang kết nối tới API lấy tỷ giá...');
    double tyGia = 23000.0; // tỷ giá mặc định dự phòng
    bool layGiaThanhCong = false;

    try {
      // Gọi API giả lập
      tyGia = await fetchExchangeRate();
      layGiaThanhCong = true;
    } catch (e) {
      print('⚠️ Lỗi: Không thể lấy tỷ giá từ API ($e).');
      print('ℹ️ Sử dụng tỷ giá mặc định dự phòng: 23,000 VND/USD');
      tyGia = 23000.0;
    }

    double vnd = usd * tyGia;
    print('\n💲 KẾT QUẢ QUY ĐỔI:');
    print('   $usd USD = ${_formatGia(vnd)} VND (Tỷ giá: ${_formatGia(tyGia)} VND/USD)');
    if (layGiaThanhCong) {
      print('   [Nguồn tỷ giá: API thời gian thực]\n');
    } else {
      print('   [Nguồn tỷ giá: Tỷ giá dự phòng]\n');
    }
  }
}

/// Hàm giả lập gọi API lấy tỷ giá USD -> VND
/// Giả lập ngẫu nhiên: 80% thành công, 20% thất bại (lỗi kết nối)
Future<double> fetchExchangeRate() async {
  await Future.delayed(Duration(seconds: 1));
  
  // Tạo ngẫu nhiên lỗi để kiểm tra cơ chế try-catch dự phòng
  // Nếu muốn test lỗi ổn định, bạn có thể đổi điều kiện hoặc bỏ comment dòng dưới:
  // throw SocketException('Connection timed out');
  
  int r = DateTime.now().millisecond % 5;
  if (r == 0) {
    throw Exception('Lỗi kết nối máy chủ API (Gateway Timeout)');
  }
  
  return 25500.0; // Tỷ giá giả lập khi thành công
}

String _formatGia(double gia) {
  return gia.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
}
