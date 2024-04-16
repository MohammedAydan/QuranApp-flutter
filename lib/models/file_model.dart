import 'dart:io';

class FileModel {
  final int id;
  final String name;
  final String path;
  final Uri uri;

  FileModel({
    required this.id,
    required this.name,
    required this.path,
    required this.uri,
  });

  factory FileModel.fromMap(FileSystemEntity fileSystemEntity) {
    return FileModel(
      id: int.parse(fileSystemEntity.path.split("-id=").last.split(".").first),
      name: fileSystemEntity.path
          .split("/")
          .last
          .split("AUDIO-")
          .last
          .split("-id=")
          .first,
      path: fileSystemEntity.path,
      uri: fileSystemEntity.uri,
    );
  }
}
