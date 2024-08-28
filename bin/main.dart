import 'dart:io';
import 'display.dart';
import 'add_student.dart';
import 'edit_student.dart';
import 'search_student.dart';

void main() {
  while (true) {
    print('Chương trình Quản lý Sinh viên');
    print('1. Hiển thị toàn bộ sinh viên');
    print('2. Thêm sinh viên');
    print('3. Sửa thông tin sinh viên');
    print('4. Tìm kiếm sinh viên');
    print('5. Thoát');

    stdout.write('Chọn chức năng (nhập số từ 1 đến 5): ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        displayStudents();
        break;
      case '2':
        addStudent();
        break;
      case '3':
        editStudent();
        break;
      case '4':
        searchStudent();
        break;
      case '5':
        print('Thoát chương trình.');
        exit(0);
      default:
        print('Lựa chọn không hợp lệ. Vui lòng chọn lại.');
    }
  }
}
