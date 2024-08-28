import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

final String filePath = p.join(Directory.current.path, 'data', 'Student.json');

List<Map<String, dynamic>> readData() {
  try {
    final file = File(filePath);
    final content = file.readAsStringSync();
    return jsonDecode(content).cast<Map<String, dynamic>>();
  } catch (e) {
    return [];
  }
}

void writeData(List<Map<String, dynamic>> data) {
  final file = File(filePath);
  file.writeAsStringSync(jsonEncode(data), flush: true);
}
