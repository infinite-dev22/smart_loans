class DocumentModel {
  int? id;
  String? name;
  String? extension;
  String? nameOnFile;
  String? tempKey;
  int? externalKey;
  String? mimeType;
  int? size;
  String? description;
  int? documentTypeId;
  int? documentStatusId;

  DocumentModel({
    required this.id,
    required this.name,
    required this.extension,
    required this.nameOnFile,
    required this.tempKey,
    required this.externalKey,
    required this.mimeType,
    required this.size,
    required this.description,
    required this.documentTypeId,
    required this.documentStatusId,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'],
      name: json['name'],
      extension: json['extension'],
      nameOnFile: json['name_on_file'],
      tempKey: json['temp_key'],
      externalKey: json['external_key'],
      mimeType: json['mime_type'],
      size: json['size'],
      description: json['description'],
      documentTypeId: json['document_type_id'],
      documentStatusId: json['document_status_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'extension': extension,
      'name_on_file': nameOnFile,
      'temp_key': tempKey,
      'external_key': externalKey,
      'mime_type': mimeType,
      'size': size,
      'description': description,
      'document_type_id': documentTypeId,
      'document_status_id': documentStatusId,
    };
  }

  List<Object?> toList() {
    return [
      id.toString(),
      name.toString(),
      extension.toString(),
      nameOnFile.toString(),
      tempKey.toString(),
      externalKey.toString(),
      mimeType.toString(),
      size.toString(),
      description.toString(),
      documentTypeId.toString(),
      documentStatusId.toString(),
    ];
  }
}
