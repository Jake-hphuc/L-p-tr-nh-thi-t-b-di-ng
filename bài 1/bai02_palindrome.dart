// ============================================================
// BÀI 2: Kiểm tra chuỗi đối xứng (Palindrome)
// Yêu cầu: Viết hàm bool isPalindrome(String str)
// Không dùng split().reversed, dùng vòng lặp
// Ví dụ: "racecar" → true; "hello" → false
// ============================================================

import 'dart:io';

void main() {
  print('=== BÀI 2: Kiểm tra chuỗi đối xứng (Palindrome) ===\n');

  // Test các trường hợp mẫu
  List<String> testCases = ['racecar', 'hello', 'madam', 'flutter', 'level', 'dart'];

  print('Kết quả kiểm tra:');
  for (String s in testCases) {
    bool result = isPalindrome(s);
    print('  "$s" → ${result ? "true ✓ (Palindrome)" : "false ✗ (Không phải Palindrome)"}');
  }

  print('\n--- Nhập chuỗi của bạn ---');
  stdout.write('Nhập chuỗi: ');
  String input = stdin.readLineSync()!;
  print('"$input" → ${isPalindrome(input) ? "true (Palindrome)" : "false (Không phải Palindrome)"}');
}

/// Kiểm tra chuỗi [str] có phải palindrome không
/// Dùng vòng lặp so sánh từ hai đầu vào giữa
bool isPalindrome(String str) {
  str = str.toLowerCase(); // Không phân biệt hoa/thường
  int left = 0;
  int right = str.length - 1;

  while (left < right) {
    if (str[left] != str[right]) {
      return false;
    }
    left++;
    right--;
  }
  return true;
}
