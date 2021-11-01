import 'dart:convert';

// ignore: non_constant_identifier_names
class Pic {
  String filename;
  String path;
  String downloadUrl;
  Pic({
    required this.filename,
    required this.path,
    required this.downloadUrl,
  });

  Pic copyWith({
    String? filename,
    String? path,
    String? downloadUrl,
  }) {
    return Pic(
      filename: filename ?? this.filename,
      path: path ?? this.path,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filename': filename,
      'path': path,
      'downloadUrl': downloadUrl,
    };
  }

  factory Pic.fromMap(Map<String, dynamic> map) {
    return Pic(
      filename: map['filename'],
      path: map['path'],
      downloadUrl: map['downloadUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pic.fromJson(String source) => Pic.fromMap(json.decode(source));

  @override
  String toString() =>
      'Pic(filename: $filename, path: $path, downloadUrl: $downloadUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pic &&
        other.filename == filename &&
        other.path == path &&
        other.downloadUrl == downloadUrl;
  }

  @override
  int get hashCode => filename.hashCode ^ path.hashCode ^ downloadUrl.hashCode;
}
