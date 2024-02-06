class Movie {
  final String title;
  final String imdb;
  final String country;
  final List genre;
  final String cast;
  final List seasons;
  final String releaseDate;
  final String overview;
  final String poster;
  final String cover;
  final String? episodeID;

  Movie(
      {required this.title,
      required this.imdb,
      required this.country,
      required this.genre,
      required this.cast,
      required this.seasons,
      required this.releaseDate,
      required this.overview,
      required this.poster,
      required this.cover,
      this.episodeID});

  static Movie fromJson(Map json) => Movie(
      title: json["title"],
      imdb: json["IMDB"],
      cast: json["Cast"],
      country: json["Country"],
      cover: json["cover"],
      poster: json["poster"],
      genre: json["Genre"],
      overview: json["Overview"],
      releaseDate: json["Release Date"],
      seasons: json["Seasons"] ?? [],
      episodeID: json["episodeID"] ?? "");
}
