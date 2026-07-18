// ============================================================
// BÀI 7: Ghép danh sách và loại bỏ trùng lặp
// Cho 2 danh sách số nguyên, tạo hợp và giao của 2 danh sách
// Sử dụng Set và toList()
// ============================================================

void main() {
  print('=== BÀI 7: Ghép danh sách và loại bỏ trùng lặp ===\n');

  List<int> list1 = [1, 2, 3, 4, 5];
  List<int> list2 = [3, 4, 5, 6, 7];

  print('List 1: $list1');
  print('List 2: $list2');

  List<int> hopCuaHai = hopDanhSach(list1, list2);
  List<int> giaoCuaHai = giaoDanhSach(list1, list2);

  print('\n📌 Hợp (Union) - Không trùng lặp:');
  print('   $hopCuaHai');

  print('\n📌 Giao (Intersection):');
  print('   $giaoCuaHai');
}

/// Hợp của 2 danh sách: tất cả phần tử, không trùng lặp
List<int> hopDanhSach(List<int> a, List<int> b) {
  Set<int> setA = a.toSet();
  Set<int> setB = b.toSet();
  return setA.union(setB).toList()..sort();
}

/// Giao của 2 danh sách: các phần tử có trong cả hai
List<int> giaoDanhSach(List<int> a, List<int> b) {
  Set<int> setA = a.toSet();
  Set<int> setB = b.toSet();
  return setA.intersection(setB).toList()..sort();
}
