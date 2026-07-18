# L-p-tr-nh-thi-t-b-di-ng
Bài Tập Tuần 1: Lập Trình Thiết Bị Di Động (Q1) - Dart &amp; Flutter
# 📚 Bài Tập Tuần 1: Lập Trình Thiết Bị Di Động (Q1) - Dart & Flutter

Chào mừng bạn đến với bộ bài tập Flutter của **Đề tài Q1**. Dự án này được thiết kế theo yêu cầu:
1. Có **từng file nhỏ** cho mỗi bài tập để dễ dàng theo dõi, chấm điểm hoặc chạy độc lập.
2. Có **1 file tổng** (`lib/main_console.dart`) giúp chạy thử tất cả 20 bài từ menu dòng lệnh.
3. Có **giao diện tương tác Flutter** cực kỳ đẹp mắt và trực quan trong `lib/main.dart` để chạy thử trực tiếp trên thiết bị/trình duyệt.

---

## 📁 Cấu Trúc Thư Mục Dự Án
```
q1_dart_exercises/
├── lib/
│   ├── main.dart                  # Giao diện ứng dụng Flutter tương tác (20 bài)
│   ├── main_console.dart          # File chạy tổng trên Terminal (20 bài)
│   └── exercises/                 # Danh sách 20 file bài tập nhỏ
│       ├── bai01_tong_chia_het_3.dart
│       ├── bai02_palindrome.dart
│       ├── bai03_bang_cuu_chuong.dart
│       ├── bai04_todo_list.dart
│       ├── bai05_so_lon_thu_hai.dart
│       ├── bai06_fibonacci_memo.dart
│       ├── bai07_ghep_danh_sach.dart
│       ├── bai08_tan_suat_tu.dart
│       ├── bai09_product_cart.dart
│       ├── bai10_stack_generic.dart
│       ├── bai11_da_hinh_vehicle.dart
│       ├── bai12_mixin_logger.dart
│       ├── bai13_singleton_db.dart
│       ├── bai14_enum_extension.dart
│       ├── bai15_xu_ly_ngoai_le.dart
│       ├── bai16_future_async.dart
│       ├── bai17_stream_dem_nguoc.dart
│       ├── bai18_functional_programming.dart
│       ├── bai19_quan_ly_thu_vien.dart
│       └── bai20_doi_tien_te.dart
└── README.md
```

---

## 🚀 Hướng Dẫn Chạy Chương Trình

### Cách 1: Chạy giao diện tương tác GUI (Flutter App)
Đây là cách khuyên dùng để trải nghiệm giao diện người dùng trực quan, có các vùng nhập liệu (TextField), nút nhấn và hiển thị kết quả giả lập Terminal cực đẹp.

Từ thư mục `q1_dart_exercises/`, chạy lệnh sau để khởi động ứng dụng:
```bash
flutter run
```
*(Nếu bạn chạy trên Web hoặc thiết bị di động, ứng dụng sẽ tự động tối ưu hiển thị responsive)*

### Cách 2: Chạy menu dòng lệnh (Console Router)
Nếu bạn chỉ muốn chạy thử nhanh qua dòng lệnh (Terminal/Command Prompt):
```bash
dart run lib/main_console.dart
```
Một menu số từ `1` đến `20` sẽ hiển thị để bạn chọn chạy bài tập tương ứng.

### Cách 3: Chạy độc lập từng bài tập lẻ
Bạn hoàn toàn có thể chạy riêng lẻ bất kỳ file nào trong thư mục `lib/exercises/`:
```bash
# Ví dụ chạy Bài 1
dart run lib/exercises/bai01_tong_chia_het_3.dart

# Ví dụ chạy Bài 8
dart run lib/exercises/bai08_tan_suat_tu.dart
```

---

## 📖 Danh sách 20 Bài Tập Thực Hiện

| STT | Tên bài tập | Kiến thức áp dụng |
|:---:|---|---|
| **1** | Tính tổng các số chia hết cho 3 | Vòng lặp `for`, kiểm tra điều kiện `%` |
| **2** | Kiểm tra chuỗi đối xứng (Palindrome) | Vòng lặp so sánh ký tự, không dùng `reversed` |
| **3** | In bảng cửu chương (2 đến 9) | Vòng lặp lồng nhau, căn chỉnh cột bằng `padRight` |
| **4** | Quản lý danh sách việc cần làm (Todo List) | Vòng lặp `while`, menu `switch-case`, `List<String>` |
| **5** | Tìm số lớn thứ hai trong mảng | Thuật toán so sánh mảng, không sử dụng `sort()` |
| **6** | Fibonacci dùng Memoization | Đệ quy tối ưu bằng bộ nhớ đệm `Map`, so sánh tốc độ |
| **7** | Hợp & giao hai danh sách | Thao tác trên tập hợp `Set` và `toList()` |
| **8** | Đếm tần suất xuất hiện của từ | Tách chuỗi bằng `split(' ')`, đếm bằng `Map<String, int>` |
| **9** | Lớp Product và Giỏ hàng | Lập trình hướng đối tượng cơ bản (OOP) |
| **10** | Xây dựng Stack bằng Generic | Cấu trúc ngăn xếp hỗ trợ kiểu dữ liệu tổng quát `<T>` |
| **11** | Quản lý phương tiện giao thông | Lớp trừu tượng (`abstract class`), đa hình |
| **12** | Mixin Logging & Validator | Đa kế thừa bằng `mixin` để Log & Validate dữ liệu |
| **13** | Singleton Pattern kết nối Database | Thiết kế mẫu Singleton, kiểm tra bằng `identical()` |
| **14** | Enum với Extension | Sử dụng `enum`, viết `extension method` lấy tên hiển thị |
| **15** | Xử lý ngoại lệ với Input từ bàn phím | Vòng lặp nhập liệu an toàn dùng `try-catch` |
| **16** | Gọi API giả lập | Lập trình bất đồng bộ: `Future`, `async/await`, `Future.wait` |
| **17** | Stream đếm số đếm ngược | Tạo luồng dữ liệu an toàn dùng `async*` và `yield` |
| **18** | Xử lý danh sách sinh viên | Lập trình hàm (FP): `where`, `map`, `reduce`, `sort`, `take` |
| **19** | Ứng dụng Quản lý thư viện | Đọc/ghi dữ liệu bền vững ra file txt sử dụng `dart:io` |
| **20** | Ứng dụng đổi tiền tệ | Tích hợp gọi API bất đồng bộ có dự phòng (fallback/try-catch) |

---

## 🎨 Giao Diện Ứng Dụng (Flutter GUI)
*   **Chủ đề:** Tông màu tối (Dark Mode) huyền bí và hiện đại.
*   **Responsive:** Chia thành 2 cột trên máy tính/máy tính bảng (Menu bên trái - Trình chạy bên phải) và dạng Tab trượt trên màn hình điện thoại nhỏ.
*   **Đầu ra Console:** Tích hợp mô phỏng khung Console màu xanh lá cây đậm chất lập trình viên để in kết quả chạy của từng bài tập.

Chúc bạn học tập tốt và hoàn thành xuất sắc đề tài thực tập tốt nghiệp!
