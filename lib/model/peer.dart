import 'package:json_annotation/json_annotation.dart';
part 'peer.g.dart';
/**
 * Created by roman on 2019-12-27
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
@JsonSerializable()
class Peer {
  final String id;
  final String name;

  Peer(this.id, this.name);

/*  factory Peer.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);*/
}