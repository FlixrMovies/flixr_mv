class MovieResponseData {
  List<Movies>? movies;
  Movies? header;

  MovieResponseData({this.movies, this.header});

  MovieResponseData.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
    header =
        json['header'] != null ? Movies.fromJson(json['header']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    if (header != null) {
      data['header'] = header!.toJson();
    }
    return data;
  }
}

class Movies {
  String? name;
  String? image;
  String? link;
  String? id;
  bool? isSeries;
  bool? isMovie;

  Movies(
      {this.name, this.image, this.link, this.id, this.isSeries, this.isMovie});

  Movies.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    image = json['Image'];
    link = json['Link'];
    id = json['Id'];
    isSeries = json['isSeries'];
    isMovie = json['isMovie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Image'] = image;
    data['Link'] = link;
    data['Id'] = id;
    data['isSeries'] = isSeries;
    data['isMovie'] = isMovie;
    return data;
  }
}
