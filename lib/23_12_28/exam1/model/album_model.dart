import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AlbumModel {

  int id;
  String title;

  AlbumModel({
    required this.id,
    required this.title,
  });
  
  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);


}