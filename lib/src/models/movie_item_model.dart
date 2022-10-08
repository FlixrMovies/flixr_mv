// ignore_for_file: unnecessary_getters_setters

class MovieItemModel {
  String? _name;
  String? _image;
  String? _link;
  String? _id;
  bool? _isSeries;
  bool? _isMovie;

  MovieItemModel(
      {String? name,
      String? image,
      String? link,
      String? id,
      bool? isSeries,
      bool? isMovie}) {
    if (name != null) {
      _name = name;
    }
    if (image != null) {
      _image = image;
    }
    if (link != null) {
      _link = link;
    }
    if (id != null) {
      _id = id;
    }
    if (isSeries != null) {
      _isSeries = isSeries;
    }
    if (isMovie != null) {
      _isMovie = isMovie;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get id => _id;
  set id(String? id) => _id = id;
  bool? get isSeries => _isSeries;
  set isSeries(bool? isSeries) => _isSeries = isSeries;
  bool? get isMovie => _isMovie;
  set isMovie(bool? isMovie) => _isMovie = isMovie;

  MovieItemModel.fromJson(Map<String, dynamic> json) {
    _name = json['Name'];
    _image = json['Image'];
    _link = json['Link'];
    _id = json['Id'];
    _isSeries = json['isSeries'];
    _isMovie = json['isMovie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = _name;
    data['Image'] = _image;
    data['Link'] = _link;
    data['Id'] = _id;
    data['isSeries'] = _isSeries;
    data['isMovie'] = _isMovie;
    return data;
  }

  static List<MovieItemModel> listFromJson(List<Map<String, dynamic>> decode) {    
      return decode.map((e) => MovieItemModel.fromJson(e)).toList();
  }
}
