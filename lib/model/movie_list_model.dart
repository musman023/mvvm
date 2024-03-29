class MovieListModel {
  List<Movies>? movies;

  MovieListModel({this.movies});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    if (json["movies"] is List) {
      movies = json["movies"] == null
          ? null
          : (json["movies"] as List).map((e) => Movies.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (movies != null) {
      _data["movies"] = movies?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  dynamic? contentRating;
  String? duration;
  String? releaseDate;
  dynamic? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  dynamic? imdbRating;
  String? posterurl;

  Movies(
      {this.id,
      this.title,
      this.year,
      this.genres,
      this.ratings,
      this.poster,
      this.contentRating,
      this.duration,
      this.releaseDate,
      this.averageRating,
      this.originalTitle,
      this.storyline,
      this.actors,
      this.imdbRating,
      this.posterurl});

  Movies.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["year"] is String) {
      year = json["year"];
    }
    if (json["genres"] is List) {
      genres =
          json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if (json["ratings"] is List) {
      ratings =
          json["ratings"] == null ? null : List<int>.from(json["ratings"]);
    }
    if (json["poster"] is String) {
      poster = json["poster"];
    }
    if (json["contentRating"] is String) {
      contentRating = json["contentRating"];
    }
    if (json["duration"] is String) {
      duration = json["duration"];
    }
    if (json["releaseDate"] is String) {
      releaseDate = json["releaseDate"];
    }
    if (json["averageRating"] is int) {
      averageRating = json["averageRating"];
    }
    if (json["originalTitle"] is String) {
      originalTitle = json["originalTitle"];
    }
    if (json["storyline"] is String) {
      storyline = json["storyline"];
    }
    if (json["actors"] is List) {
      actors =
          json["actors"] == null ? null : List<String>.from(json["actors"]);
    }
    if (json["imdbRating"] is String) {
      imdbRating = json["imdbRating"];
    }
    if (json["posterurl"] is String) {
      posterurl = json["posterurl"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["year"] = year;
    if (genres != null) {
      _data["genres"] = genres;
    }
    if (ratings != null) {
      _data["ratings"] = ratings;
    }
    _data["poster"] = poster;
    _data["contentRating"] = contentRating;
    _data["duration"] = duration;
    _data["releaseDate"] = releaseDate;
    _data["averageRating"] = averageRating;
    _data["originalTitle"] = originalTitle;
    _data["storyline"] = storyline;
    if (actors != null) {
      _data["actors"] = actors;
    }
    _data["imdbRating"] = imdbRating;
    _data["posterurl"] = posterurl;
    return _data;
  }
}
