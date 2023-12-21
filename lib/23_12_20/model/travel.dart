class Travle {
  int id;
  String title;
  String subTitle;
  String imgUrl;
  String description;

//<editor-fold desc="Data Methods">

  Travle({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imgUrl,
    required this.description,
  });

//<ed@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Travle &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              subTitle == other.subTitle &&
              imgUrl == other.imgUrl &&
              description == other.description
          );


  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      subTitle.hashCode ^
      imgUrl.hashCode ^
      description.hashCode;


  @override
  String toString() {
    return 'Travle{' +
        ' id: $id,' +
        ' title: $title,' +
        ' subTitle: $subTitle,' +
        ' imgUrl: $imgUrl,' +
        ' description: $description,' +
        '}';
  }


  Travle copyWith({
    int? id,
    String? title,
    String? subTitle,
    String? imgUrl,
    String? description,
  }) {
    return Travle(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'subTitle': this.subTitle,
      'imgUrl': this.imgUrl,
      'description': this.description,
    };
  }

  factory Travle.fromMap(Map<String, dynamic> map) {
    return Travle(
      id: map['id'] as int,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      imgUrl: map['imgUrl'] as String,
      description: map['description'] as String,
    );
  }


}