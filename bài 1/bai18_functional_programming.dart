// ============================================================
// BÀI 18: Xử lý danh sách sinh viên (Functional Programming)
// Chỉ dùng where, map, reduce, sort, take
// Lọc, sắp xếp, top 3, tính điểm trung bình
// ============================================================

void main() {
  print('=== BÀI 18: Functional Programming - Danh sách Sinh viên ===\n');

  List<Student> danhSach = [
    Student(name: 'Nguyễn Văn An', score: 9.0, major: 'CNTT'),
    Student(name: 'Trần Thị Bình', score: 7.5, major: 'Kinh tế'),
    Student(name: 'Lê Văn Cường', score: 8.5, major: 'CNTT'),
    Student(name: 'Phạm Thị Dung', score: 6.0, major: 'CNTT'),
    Student(name: 'Hoàng Văn Em', score: 9.5, major: 'CNTT'),
    Student(name: 'Đỗ Thị Phương', score: 8.0, major: 'Kinh tế'),
    Student(name: 'Vũ Văn Giang', score: 8.2, major: 'CNTT'),
    Student(name: 'Ngô Thị Hoa', score: 7.0, major: 'CNTT'),
    Student(name: 'Đinh Văn Ích', score: 9.1, major: 'CNTT'),
  ];

  print('📋 Danh sách gốc (${danhSach.length} sinh viên):');
  danhSach.forEach((sv) => print('  ${sv.name} | ${sv.major} | ${sv.score}'));

  // 1. Lọc sinh viên CNTT có điểm >= 8.0
  print('\n1️⃣ Sinh viên ngành CNTT có điểm >= 8.0:');
  List<Student> cnttGioi = danhSach
      .where((sv) => sv.major == 'CNTT' && sv.score >= 8.0)
      .toList();
  cnttGioi.forEach((sv) => print('   ✅ ${sv.name} - ${sv.score}'));

  // 2. Sắp xếp theo điểm giảm dần
  print('\n2️⃣ Sắp xếp theo điểm giảm dần:');
  List<Student> sapXep = List.from(cnttGioi)
    ..sort((a, b) => b.score.compareTo(a.score));
  sapXep.forEach((sv) => print('   📊 ${sv.name}: ${sv.score}'));

  // 3. Lấy top 3 và in tên
  print('\n3️⃣ Top 3 sinh viên CNTT giỏi nhất:');
  sapXep.take(3).toList().asMap().forEach((i, sv) {
    String medal = ['🥇', '🥈', '🥉'][i];
    print('   $medal ${i + 1}. ${sv.name} - ${sv.score}');
  });

  // 4. Tính điểm trung bình toàn bộ danh sách gốc
  print('\n4️⃣ Điểm trung bình toàn bộ danh sách:');
  double tongDiem = danhSach
      .map((sv) => sv.score)
      .reduce((a, b) => a + b);
  double trungBinh = tongDiem / danhSach.length;
  print('   📈 Trung bình: ${trungBinh.toStringAsFixed(2)}');
}

// ====================
// CLASS STUDENT
// ====================
class Student {
  String name;
  double score;
  String major; // Ngành học

  Student({required this.name, required this.score, required this.major});

  @override
  String toString() => 'Student($name, $score, $major)';
}
