// ============================================================
// BÀI 19: Hệ thống quản lý thư viện (Ứng dụng Console)
// Chức năng: Thêm, Hiển thị, Tìm kiếm, Xóa sách
// Lưu/Đọc từ file books.txt dùng dart:io
// Sử dụng OOP và xử lý ngoại lệ
// ============================================================

import 'dart:io';

Future<void> main() async {
  print('=== BÀI 19: Quản lý Thư viện ===\n');
  LibraryApp app = LibraryApp();
  await app.khoiDong();
  await app.chayUngDung();
}

// ====================
// CLASS BOOK
// ====================
class Book {
  String maSach;
  String tenSach;
  String tacGia;
  int namXuatBan;

  Book({
    required this.maSach,
    required this.tenSach,
    required this.tacGia,
    required this.namXuatBan,
  });

  /// Chuyển thành chuỗi để lưu file
  String toFileString() => '$maSach|$tenSach|$tacGia|$namXuatBan';

  /// Đọc từ chuỗi file
  factory Book.fromFileString(String line) {
    List<String> parts = line.split('|');
    if (parts.length != 4) throw FormatException('Dữ liệu sách không hợp lệ: $line');
    return Book(
      maSach: parts[0],
      tenSach: parts[1],
      tacGia: parts[2],
      namXuatBan: int.parse(parts[3]),
    );
  }

  @override
  String toString() =>
      '[$maSach] "$tenSach" - $tacGia ($namXuatBan)';
}

// ====================
// CLASS LIBRARYAPP
// ====================
class LibraryApp {
  List<Book> _danhSachSach = [];
  final String _filePath = 'books.txt';

  /// Khởi động: đọc dữ liệu từ file
  Future<void> khoiDong() async {
    await _docTuFile();
  }

  /// Vòng lặp chính
  Future<void> chayUngDung() async {
    bool tiepTuc = true;
    while (tiepTuc) {
      _hienThiMenu();
      stdout.write('Chọn: ');
      String? luaChon = stdin.readLineSync();
      switch (luaChon) {
        case '1':
          _themSach();
          await _luuVaoFile();
          break;
        case '2':
          _hienThiTatCa();
          break;
        case '3':
          _timSach();
          break;
        case '4':
          await _xoaSach();
          break;
        case '5':
          print('\n👋 Thoát chương trình!');
          tiepTuc = false;
          break;
        default:
          print('\n❌ Lựa chọn không hợp lệ!');
      }
    }
  }

  void _hienThiMenu() {
    print('\n╔══════════════════════════╗');
    print('║    📚 THƯ VIỆN SÁCH      ║');
    print('╠══════════════════════════╣');
    print('║ 1. Thêm sách             ║');
    print('║ 2. Hiển thị tất cả       ║');
    print('║ 3. Tìm kiếm              ║');
    print('║ 4. Xóa sách              ║');
    print('║ 5. Thoát                 ║');
    print('╚══════════════════════════╝');
  }

  void _themSach() {
    print('\n--- THÊM SÁCH MỚI ---');
    stdout.write('Mã sách: ');
    String ma = stdin.readLineSync() ?? '';
    stdout.write('Tên sách: ');
    String ten = stdin.readLineSync() ?? '';
    stdout.write('Tác giả: ');
    String tacGia = stdin.readLineSync() ?? '';
    stdout.write('Năm xuất bản: ');
    int nam = int.tryParse(stdin.readLineSync() ?? '') ?? 2024;

    Book sach = Book(maSach: ma, tenSach: ten, tacGia: tacGia, namXuatBan: nam);
    _danhSachSach.add(sach);
    print('✅ Đã thêm: $sach');
  }

  void _hienThiTatCa() {
    print('\n📚 DANH SÁCH SÁCH (${_danhSachSach.length} cuốn):');
    if (_danhSachSach.isEmpty) {
      print('  (Chưa có sách nào)');
    } else {
      for (int i = 0; i < _danhSachSach.length; i++) {
        print('  ${i + 1}. ${_danhSachSach[i]}');
      }
    }
  }

  void _timSach() {
    stdout.write('\nNhập tên hoặc tác giả cần tìm: ');
    String tuKhoa = stdin.readLineSync()?.toLowerCase() ?? '';
    List<Book> ketQua = _danhSachSach
        .where((s) =>
            s.tenSach.toLowerCase().contains(tuKhoa) ||
            s.tacGia.toLowerCase().contains(tuKhoa))
        .toList();
    print('🔍 Tìm thấy ${ketQua.length} kết quả:');
    for (Book s in ketQua) print('  - $s');
  }

  Future<void> _xoaSach() async {
    stdout.write('\nNhập mã sách cần xóa: ');
    String ma = stdin.readLineSync() ?? '';
    int truoc = _danhSachSach.length;
    _danhSachSach.removeWhere((s) => s.maSach == ma);
    if (_danhSachSach.length < truoc) {
      print('✅ Đã xóa sách có mã: $ma');
      await _luuVaoFile();
    } else {
      print('❌ Không tìm thấy sách mã: $ma');
    }
  }

  /// Lưu danh sách sách vào file books.txt
  Future<void> _luuVaoFile() async {
    try {
      File file = File(_filePath);
      List<String> lines = _danhSachSach.map((s) => s.toFileString()).toList();
      await file.writeAsString(lines.join('\n'));
      print('💾 Đã lưu vào $_filePath');
    } catch (e) {
      print('❌ Lỗi khi lưu file: $e');
    }
  }

  /// Đọc danh sách sách từ file khi khởi động
  Future<void> _docTuFile() async {
    try {
      File file = File(_filePath);
      if (!await file.exists()) {
        print('ℹ️  Chưa có file $_filePath. Bắt đầu với danh sách trống.');
        return;
      }
      String content = await file.readAsString();
      List<String> lines = content.split('\n').where((l) => l.isNotEmpty).toList();
      _danhSachSach = lines.map((l) => Book.fromFileString(l)).toList();
      print('📂 Đã tải ${_danhSachSach.length} sách từ $_filePath');
    } on FormatException catch (e) {
      print('⚠️  Lỗi đọc dữ liệu file: ${e.message}');
    } catch (e) {
      print('⚠️  Lỗi đọc file: $e');
    }
  }
}
