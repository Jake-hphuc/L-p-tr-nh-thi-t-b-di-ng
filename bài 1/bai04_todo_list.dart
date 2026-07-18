// ============================================================
// BÀI 4: Quản lý danh sách việc cần làm (Todo List)
// Yêu cầu: Dùng List<String>, vòng lặp while và switch-case
// Chức năng: Thêm, Xóa, Hiển thị, Thoát
// ============================================================

import 'dart:io';

void main() {
  print('=== BÀI 4: Quản lý Todo List ===\n');
  todoListApp();
}

void todoListApp() {
  List<String> danhSachViec = [];
  bool tiepTuc = true;

  while (tiepTuc) {
    _hienThiMenu();
    stdout.write('Chọn: ');
    String? luaChon = stdin.readLineSync();

    switch (luaChon) {
      case '1':
        _themCongViec(danhSachViec);
        break;
      case '2':
        _xoaCongViec(danhSachViec);
        break;
      case '3':
        _hienThiTatCa(danhSachViec);
        break;
      case '4':
        print('\n👋 Thoát chương trình. Tạm biệt!');
        tiepTuc = false;
        break;
      default:
        print('\n❌ Lựa chọn không hợp lệ. Vui lòng chọn 1-4.\n');
    }
  }
}

void _hienThiMenu() {
  print('\n--- MENU TODO LIST ---');
  print('1. Thêm công việc mới');
  print('2. Xóa công việc theo tên');
  print('3. Hiển thị tất cả công việc');
  print('4. Thoát chương trình');
}

void _themCongViec(List<String> danhSach) {
  stdout.write('Nhập tên công việc mới: ');
  String? tenViec = stdin.readLineSync();
  if (tenViec != null && tenViec.isNotEmpty) {
    danhSach.add(tenViec);
    print('✅ Đã thêm: "$tenViec"');
  } else {
    print('❌ Tên công việc không được để trống.');
  }
}

void _xoaCongViec(List<String> danhSach) {
  if (danhSach.isEmpty) {
    print('\n📋 Danh sách đang trống, không có gì để xóa.');
    return;
  }
  stdout.write('Nhập tên công việc cần xóa: ');
  String? tenViec = stdin.readLineSync();
  if (tenViec != null && danhSach.remove(tenViec)) {
    print('✅ Đã xóa: "$tenViec"');
  } else {
    print('❌ Không tìm thấy công việc: "$tenViec"');
  }
}

void _hienThiTatCa(List<String> danhSach) {
  print('\n📋 Danh sách công việc:');
  if (danhSach.isEmpty) {
    print('  (Danh sách trống)');
  } else {
    for (int i = 0; i < danhSach.length; i++) {
      print('  ${i + 1}. ${danhSach[i]}');
    }
  }
}
