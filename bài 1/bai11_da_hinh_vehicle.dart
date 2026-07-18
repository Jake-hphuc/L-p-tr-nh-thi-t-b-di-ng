// ============================================================
// BÀI 11: Hệ thống quản lý phương tiện giao thông (Đa hình)
// Tạo abstract class Vehicle với phương thức abstract void move()
// Các lớp con: Car, Bike, Airplane - thể hiện tính đa hình
// ============================================================

void main() {
  print('=== BÀI 11: Đa hình - Phương tiện giao thông ===\n');

  // Tạo danh sách hỗn hợp các phương tiện
  List<Vehicle> phuongTien = [
    Car(),
    Bike(),
    Airplane(),
    Car(),
    Bike(),
  ];

  print('Danh sách ${phuongTien.length} phương tiện:');
  print('─' * 40);

  // Duyệt qua và gọi move() - thể hiện đa hình
  for (int i = 0; i < phuongTien.length; i++) {
    Vehicle v = phuongTien[i];
    print('${i + 1}. [${v.runtimeType}]: ');
    v.move();
  }

  print('─' * 40);
  print('\n📊 Thống kê:');
  int soXe = phuongTien.whereType<Car>().length;
  int soXeDap = phuongTien.whereType<Bike>().length;
  int soMayBay = phuongTien.whereType<Airplane>().length;
  print('  🚗 Xe hơi: $soXe');
  print('  🚲 Xe đạp: $soXeDap');
  print('  ✈️ Máy bay: $soMayBay');
}

// ====================
// ABSTRACT CLASS VEHICLE
// ====================
abstract class Vehicle {
  String get tenLoai;
  void move();

  @override
  String toString() => tenLoai;
}

// ====================
// CÁC LỚP CON
// ====================
class Car extends Vehicle {
  @override
  String get tenLoai => '🚗 Xe hơi';

  @override
  void move() {
    print('  Di chuyển bằng bánh xe trên đường bộ 🛣️');
  }
}

class Bike extends Vehicle {
  @override
  String get tenLoai => '🚲 Xe đạp';

  @override
  void move() {
    print('  Di chuyển bằng cách đạp chân 🦵');
  }
}

class Airplane extends Vehicle {
  @override
  String get tenLoai => '✈️ Máy bay';

  @override
  void move() {
    print('  Bay trên không trung ở độ cao 10,000m 🌤️');
  }
}
