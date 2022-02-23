import 'dart:convert';

import 'package:classfrase_console/ngb/filter.dart';

class NgbFilter extends Filter {
  static final String collection = 'ngb_filter';
  // String id;
  String name;
  NgbFilter({
    required id,
    required this.name,
  }) : super(id: id);

  NgbFilter copyWith({
    String? id,
    String? name,
  }) {
    return NgbFilter(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory NgbFilter.fromMap(Map<String, dynamic> map) {
    return NgbFilter(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NgbFilter.fromJson(String source) =>
      NgbFilter.fromMap(json.decode(source));

  @override
  String toString() => 'NgbFilter(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NgbFilter && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
