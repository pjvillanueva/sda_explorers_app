import 'dart:convert';

class Message<T> {
  String subject;
  T? data;
  String id = 'generate id';
  String? error;

  Message(this.subject, {this.data, this.error, String? idOverride}) {
    if (idOverride != null) {
      id = idOverride;
    }
  }

  @override
  String toString() {
    return json
        .encode({"Subject": subject, "Data": data, "ID": id, "Error": error});
  }

  static Message fromString(String str) {
    final decoded = json.decode(str);
    return Message(decoded["Subject"],
        data: decoded["Data"],
        idOverride: decoded["ID"],
        error: decoded["Error"]);
  }
}
