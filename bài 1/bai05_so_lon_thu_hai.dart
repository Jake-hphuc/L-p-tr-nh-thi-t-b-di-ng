// ============================================================
// BÀI 5: Tìm số lớn thứ hai trong mảng
// Yêu cầu: Viết hàm int findSecondLargest(List<int> numbers)
// Không dùng sort()
// Ví dụ: [5, 1, 8, 3, 8, 2] → Kết quả: 5
// ============================================================

void main() {
  print('=== BÀI 5: Tìm số lớn thứ hai trong mảng ===\n');

  List<List<int>> testCases = [
    [5, 1, 8, 3, 8, 2],
    [10, 20, 4, 45, 99],
    [1, 1, 1, 1],
    [100, 200],
    [3, 3, 3, 5, 5],
  ];

  for (List<int> arr in testCases) {
    int? result = findSecondLargest(arr);
    if (result != null) {
      print('Mảng: $arr → Số lớn thứ hai: $result');
    } else {
      print('Mảng: $arr → Không tồn tại số lớn thứ hai');
    }
  }
}

/// Tìm số lớn thứ hai trong danh sách [numbers] mà không dùng sort()
/// Trả về null nếu không tồn tại số lớn thứ hai (mảng có <2 phần tử khác nhau)
int? findSecondLargest(List<int> numbers) {
  if (numbers.isEmpty) return null;

  int largest = numbers[0];
  int? secondLargest;

  // Tìm số lớn nhất
  for (int num in numbers) {
    if (num > largest) largest = num;
  }

  // Tìm số lớn thứ hai (lớn nhất trong các số < largest)
  for (int num in numbers) {
    if (num < largest) {
      if (secondLargest == null || num > secondLargest) {
        secondLargest = num;
      }
    }
  }

  return secondLargest;
}
