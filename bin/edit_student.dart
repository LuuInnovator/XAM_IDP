import 'dart:convert';
import 'dart:io';
import 'read_write.dart';

void editStudent() {
  final students = readData();
  stdout.write('Nhập ID sinh viên cần sửa: ');
  final id = stdin.readLineSync()!;

  final studentIndex = students.indexWhere((s) => s['id'] == id);
  
  if (studentIndex == -1) {
    print('Sinh viên không tồn tại.');
    return;
  }

  var student = students[studentIndex];

  stdout.write('Nhập tên mới (hiện tại: ${student['name']}): ');
  final name = stdin.readLineSync();
  if (name != null && name.isNotEmpty) {
    student['name'] = name;
  }

  bool moreCourses = true;

  while (moreCourses) {
    stdout.write('Nhập môn học mới hoặc để trống để tiếp tục: ');
    final course = stdin.readLineSync();
    if (course == null || course.isEmpty) break;

    final existingCourse = (student['courses'] as List).firstWhere(
        (c) => c['course'] == course,
        orElse: () => null);

    if (existingCourse != null) {
      stdout.write('Nhập điểm mới (hiện tại: ${existingCourse['grade']}): ');
      final grade = stdin.readLineSync();
      if (grade != null && grade.isNotEmpty) {
        existingCourse['grade'] = grade;
      }
    } else {
      stdout.write('Nhập điểm thi: ');
      final grade = stdin.readLineSync()!;
      (student['courses'] as List).add({'course': course, 'grade': grade});
    }

    stdout.write('Thêm môn học khác không? (y/n): ');
    moreCourses = stdin.readLineSync()!.toLowerCase() == 'y';
  }

  stdout.write('Có muốn xóa môn học nào không? (y/n): ');
  if (stdin.readLineSync()!.toLowerCase() == 'y') {
    stdout.write('Nhập tên môn học cần xóa: ');
    final courseToRemove = stdin.readLineSync()!;
    student['courses'] = (student['courses'] as List)
        .where((c) => c['course'] != courseToRemove)
        .toList();
  }

  students[studentIndex] = student;
  writeData(students);
  print('Thông tin sinh viên đã được cập nhật!');
}
