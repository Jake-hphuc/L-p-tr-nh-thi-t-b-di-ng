// ============================================================
// BÀI 14: Xây dựng Enum với phương thức mở rộng (Extension)
// Tạo enum Status với extension có getDisplayName() và isCompleted()
// ============================================================

void main() {
  print('=== BÀI 14: Enum với Extension Methods ===\n');

  // Test tất cả các trạng thái
  print('--- Tất cả trạng thái ---');
  for (Status s in Status.values) {
    print('  ${s.name.padRight(12)} → "${s.getDisplayName()}" | isCompleted: ${s.isCompleted()}');
  }

  // Ứng dụng thực tế
  print('\n--- Ứng dụng quản lý đơn hàng ---');
  List<Map<String, dynamic>> donHang = [
    {'id': 'DH001', 'tenSP': 'Laptop', 'status': Status.pending},
    {'id': 'DH002', 'tenSP': 'Điện thoại', 'status': Status.approved},
    {'id': 'DH003', 'tenSP': 'Tai nghe', 'status': Status.done},
    {'id': 'DH004', 'tenSP': 'Máy tính bảng', 'status': Status.rejected},
  ];

  for (var dh in donHang) {
    Status st = dh['status'] as Status;
    String icon = st.isCompleted() ? '✅' : (st == Status.rejected ? '❌' : '⏳');
    print('  $icon ${dh["id"]} | ${dh["tenSP"]} | ${st.getDisplayName()}');
  }

  // Lọc đơn đã hoàn thành
  int soHoanThanh = donHang.where((dh) => (dh['status'] as Status).isCompleted()).length;
  print('\n📊 Số đơn hoàn thành: $soHoanThanh/${donHang.length}');
}

// ====================
// ENUM STATUS
// ====================
enum Status { pending, approved, rejected, done }

// ====================
// EXTENSION CHO STATUS
// ====================
extension StatusExtension on Status {
  /// Trả về tên hiển thị tiếng Việt
  String getDisplayName() {
    switch (this) {
      case Status.pending:
        return 'Đang chờ';
      case Status.approved:
        return 'Đã duyệt';
      case Status.rejected:
        return 'Đã từ chối';
      case Status.done:
        return 'Hoàn thành';
    }
  }

  /// Trả về true nếu status là done
  bool isCompleted() => this == Status.done;
}
