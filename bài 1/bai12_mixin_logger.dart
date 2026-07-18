// ============================================================
// BÀI 12: Sử dụng Mixin - Thêm tính năng Logging và Validator
// Tạo mixin Logger và mixin Validator
// Class UserService sử dụng cả 2 mixin
// ============================================================

void main() {
  print('=== BÀI 12: Mixin Logger & Validator ===\n');

  UserService userService = UserService();

  // Test Logger
  print('--- Test Logger ---');
  userService.log('Khởi động hệ thống');
  userService.log('Người dùng đăng nhập');
  userService.log('Truy vấn dữ liệu');

  // Test Validator
  print('\n--- Test Validator ---');
  List<String> emails = [
    'user@gmail.com',
    'invalid-email',
    'test@domain.co',
    'notanemail',
    'hello@world.vn',
  ];

  for (String email in emails) {
    bool valid = userService.isValidEmail(email);
    print('  "$email" → ${valid ? "✅ Hợp lệ" : "❌ Không hợp lệ"}');
    userService.log('Kiểm tra email: $email → ${valid ? "VALID" : "INVALID"}');
  }
}

// ====================
// MIXIN LOGGER
// ====================
mixin Logger {
  /// In thông báo kèm timestamp
  void log(String message) {
    DateTime now = DateTime.now();
    String timestamp =
        '[${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}]';
    print('  📋 $timestamp LOG: $message');
  }
}

// ====================
// MIXIN VALIDATOR
// ====================
mixin Validator {
  /// Kiểm tra email có hợp lệ không (chứa '@' và '.')
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}

// ====================
// CLASS USERSERVICE
// ====================
class UserService with Logger, Validator {
  void dangKy(String email, String matKhau) {
    log('Bắt đầu đăng ký với email: $email');
    if (isValidEmail(email)) {
      log('Email hợp lệ. Tạo tài khoản thành công!');
    } else {
      log('Email không hợp lệ. Đăng ký thất bại!');
    }
  }
}
