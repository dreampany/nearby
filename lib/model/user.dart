import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
/**
 * Created by roman on 2019-12-22
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
@JsonSerializable()
class User {
  final String id;
  final String name;
  final int timestamp;

  User(this.id, this.name, {this.timestamp});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}