import 'dart:convert';
import 'dart:io';
import 'read_write.dart';

void addStudent() {
  final students = readData();
  stdout.write('Nhập ID sinh viên: ');
  final id = stdin.readLineSync()!;
  stdout.write('Nhập tên sinh viên: ');
  final name = stdin.readLineSync()!;

  final courses = <Map<String, String>>[];
  bool moreCourses = true;

  while (moreCourses) {
    stdout.write('Nhập tên môn học: ');
    final course = stdin.readLineSync()!;
    stdout.write('Nhập điểm thi: ');
    final grade = stdin.readLineSync()!;
    courses.add({'course': course, 'grade': grade});
    stdout.write('Thêm môn học khác không? (y/n): ');
    moreCourses = stdin.readLineSync()!.toLowerCase() == 'y';
  }

  students.add({'id': id, 'name': name, 'courses': courses});
  writeData(students);
  print('Đã thêm sinh viên thành công!');
}
