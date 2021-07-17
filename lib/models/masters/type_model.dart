import 'package:bs_admin/helpers/helpers.dart';

class TypeModel {

  int id;
  int parentid;
  String? typecd;
  String? typenm;
  int typeseq;
  String? description;

  Map<String, dynamic>? _parent;

  TypeModel({
    this.id = 0,
    this.parentid = 0,
    this.typecd,
    this.typenm,
    this.typeseq = 0,
    this.description,
    Map<String, dynamic>? parent
  }) : _parent = parent;

  factory TypeModel.fromJson(Map<String, dynamic> map) {
    return TypeModel(
      id: parseInt(map['id']),
      parentid: parseInt(map['parentid']),
      typecd: parseString(map['typecd']),
      typenm: parseString(map['typenm']),
      typeseq: parseInt(map['typeseq']),
      description: parseString(map['description']),
      parent: map['parent'],
    );
  }

  TypeModel get parent {
    if(_parent == null)
      return TypeModel();

    return TypeModel.fromJson(_parent!);
  }
}