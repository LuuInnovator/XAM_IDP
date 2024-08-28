import 'read_write.dart';

void displayStudents() {
  final students = readData();
  print('Danh sách sinh viên:');
  for (var student in students) {
    print('ID: ${student['id']}, Tên: ${student['name']}');
    for (var course in student['courses']) {
      print('  Môn học: ${course['course']}, Điểm: ${course['grade']}');
    }
  }
}
