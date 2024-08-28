import 'dart:convert';
import 'dart:io';
import 'read_write.dart';

void searchStudent() {
  final students = readData();
  stdout.write('Nhập tên hoặc ID sinh viên cần tìm: ');
  final searchTerm = stdin.readLineSync()!;

  final result = students.where((s) =>
      s['name'].contains(searchTerm) || s['id'].contains(searchTerm)).toList();

  if (result.isEmpty) {
    print('Không tìm thấy sinh viên.');
  } else {
    for (var student in result) {
      print('ID: ${student['id']}, Tên: ${student['name']}');
      for (var course in student['courses']) {
        print('  Môn học: ${course['course']}, Điểm: ${course['grade']}');
      }
    }
  }
}
