// ============================================================
// BÀI 10: Xây dựng Stack (Ngăn xếp) bằng Generic
// Tạo class Stack<T> với: push, pop, peek, isEmpty, size
// Sử dụng Generic <T> để stack chứa bất kỳ kiểu dữ liệu nào
// ============================================================

void main() {
  print('=== BÀI 10: Ngăn xếp Generic (Stack<T>) ===\n');

  // Test Stack<int>
  print('--- Stack<int> ---');
  Stack<int> intStack = Stack<int>();
  intStack.push(10);
  intStack.push(20);
  intStack.push(30);
  print('Đã push: 10, 20, 30');
  print('Peek (đỉnh): ${intStack.peek()}');
  print('Pop: ${intStack.pop()}');
  print('Pop: ${intStack.pop()}');
  print('Size còn lại: ${intStack.size()}');
  print('isEmpty: ${intStack.isEmpty()}');

  print('\n--- Stack<String> ---');
  Stack<String> stringStack = Stack<String>();
  stringStack.push('Dart');
  stringStack.push('Flutter');
  stringStack.push('Mobile');
  print('Đã push: "Dart", "Flutter", "Mobile"');
  print('Peek: ${stringStack.peek()}');
  print('Pop: ${stringStack.pop()}');
  print('Còn lại: ${stringStack.size()} phần tử');
}

// ====================
// CLASS STACK<T> - GENERIC
// ====================
class Stack<T> {
  final List<T> _data = [];

  /// Thêm phần tử vào đỉnh stack
  void push(T item) {
    _data.add(item);
    print('  push($item) ✅');
  }

  /// Lấy và xóa phần tử ở đỉnh stack
  T pop() {
    if (isEmpty()) {
      throw StateError('Stack rỗng! Không thể pop.');
    }
    T item = _data.removeLast();
    return item;
  }

  /// Xem phần tử ở đỉnh mà không xóa
  T peek() {
    if (isEmpty()) {
      throw StateError('Stack rỗng! Không thể peek.');
    }
    return _data.last;
  }

  /// Kiểm tra stack có rỗng không
  bool isEmpty() => _data.isEmpty;

  /// Trả về số lượng phần tử hiện có
  int size() => _data.length;

  @override
  String toString() => 'Stack($_data)';
}
