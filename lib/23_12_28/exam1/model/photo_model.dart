import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoModle {

  int id,albumId;
  String title,url,thumbnailUrl;

  PhotoModle({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  
  factory PhotoModle.fromJson(Map<String, dynamic> json) => _$PhotoModleFromJson(json);
  
  Map<String, dynamic> toJson() => _$PhotoModleToJson(this);


}