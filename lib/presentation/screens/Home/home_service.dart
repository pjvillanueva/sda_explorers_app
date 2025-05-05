import 'package:sda_explorers_app/data/models/explorer.dart';

Future<List<Explorer>> fetchMyExplorers() async {
  // try {
  //   final response = await http.get(Uri.parse('$baseUrl/explorers'));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     return data.map((explorer) => Explorer.fromJson(explorer)).toList();
  //   } else {
  //     throw Exception('Failed to load explorers');
  //   }
  // } catch (e) {
  //   return [];
  //   // throw Exception('Failed to load explorers: $e');
  // }
  return []; // Placeholder for actual implementation
}