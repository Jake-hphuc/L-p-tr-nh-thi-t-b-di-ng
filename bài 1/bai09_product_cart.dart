// ============================================================
// BÀI 9: Lớp Product (Sản phẩm) và giỏ hàng
// Tạo class Product và class Cart
// Các phương thức: addProduct, removeProduct, getTotal, displayCart
// ============================================================

void main() {
  print('=== BÀI 9: Quản lý Giỏ Hàng (Product & Cart) ===\n');

  // Tạo các sản phẩm
  Product p1 = Product(id: 'SP001', name: 'Laptop Dell', price: 15000000);
  Product p2 = Product(id: 'SP002', name: 'Chuột Logitech', price: 350000);
  Product p3 = Product(id: 'SP003', name: 'Bàn phím cơ', price: 1200000);
  Product p4 = Product(id: 'SP004', name: 'Màn hình 24"', price: 5500000);

  // Tạo giỏ hàng và thêm sản phẩm
  Cart cart = Cart();
  cart.addProduct(p1);
  cart.addProduct(p2);
  cart.addProduct(p3);
  cart.addProduct(p4);

  // Hiển thị giỏ hàng
  cart.displayCart();

  // Xóa sản phẩm
  print('\n--- Xóa sản phẩm SP002 ---');
  cart.removeProduct('SP002');
  cart.displayCart();
}

// ====================
// CLASS PRODUCT
// ====================
class Product {
  String id;
  String name;
  double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => '$name (ID: $id) - ${_formatGia(price)}';

  String _formatGia(double gia) {
    return '${gia.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')} VNĐ';
  }
}

// ====================
// CLASS CART
// ====================
class Cart {
  List<Product> items = [];

  /// Thêm sản phẩm vào giỏ hàng
  void addProduct(Product p) {
    items.add(p);
    print('✅ Đã thêm: ${p.name}');
  }

  /// Xóa sản phẩm khỏi giỏ hàng theo ID
  void removeProduct(String id) {
    int prevLen = items.length;
    items.removeWhere((p) => p.id == id);
    if (items.length < prevLen) {
      print('✅ Đã xóa sản phẩm có ID: $id');
    } else {
      print('❌ Không tìm thấy sản phẩm ID: $id');
    }
  }

  /// Tính tổng tiền giỏ hàng
  double getTotal() {
    return items.fold(0.0, (sum, p) => sum + p.price);
  }

  /// Hiển thị tất cả sản phẩm trong giỏ
  void displayCart() {
    print('\n🛒 GIỎ HÀNG (${items.length} sản phẩm):');
    print('─' * 50);
    if (items.isEmpty) {
      print('  (Giỏ hàng trống)');
    } else {
      for (int i = 0; i < items.length; i++) {
        print('  ${i + 1}. ${items[i]}');
      }
    }
    print('─' * 50);
    print('  💰 Tổng: ${_formatGia(getTotal())}');
  }

  String _formatGia(double gia) {
    return '${gia.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')} VNĐ';
  }
}
