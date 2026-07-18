// ============================================================
// BÀI 13: Singleton Pattern - Kết nối Database
// Chỉ có duy nhất 1 instance, kiểm tra bằng identical()
// ============================================================

void main() {
  print('=== BÀI 13: Singleton Pattern - Database Connection ===\n');

  // Tạo 2 biến tham chiếu đến instance
  DatabaseConnection db1 = DatabaseConnection.getInstance();
  DatabaseConnection db2 = DatabaseConnection.getInstance();

  // Kiểm tra cùng địa chỉ
  print('db1 và db2 có cùng địa chỉ? ${identical(db1, db2)}');
  print('hashCode db1: ${db1.hashCode}');
  print('hashCode db2: ${db2.hashCode}');

  // Test kết nối
  print('\n--- Sử dụng db1 ---');
  db1.connect();
  db1.query('SELECT * FROM users');

  print('\n--- Sử dụng db2 (cùng instance với db1) ---');
  db2.query('SELECT * FROM products');
  db2.disconnect();
}

// ====================
// CLASS DATABASECONNECTION (SINGLETON)
// ====================
class DatabaseConnection {
  // Instance duy nhất (static)
  static DatabaseConnection? _instance;

  // Private constructor - ngăn không cho tạo instance từ bên ngoài
  DatabaseConnection._privateConstructor() {
    print('🔧 DatabaseConnection instance được tạo lần đầu!');
  }

  /// Static method để lấy instance duy nhất
  static DatabaseConnection getInstance() {
    _instance ??= DatabaseConnection._privateConstructor();
    return _instance!;
  }

  /// Kết nối database
  void connect() {
    print('✅ Connected to database');
  }

  /// Ngắt kết nối database
  void disconnect() {
    print('🔌 Disconnected');
  }

  /// Thực hiện truy vấn (demo)
  void query(String sql) {
    print('📊 Query: $sql');
  }
}
