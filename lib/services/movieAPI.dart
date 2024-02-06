import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:valkin/Model/movie.dart';

Future<Movie> fetchMovieInfo(
    {String url =
        "https://hdtoday.watch/show/watch-the-boys-full-MTBjMzE="}) async {
  final Response r = await Dio().get(url);
  var document = parse(r.data);
  Map data = {};
  data["title"] = document
      .querySelector(".detail-text > .caption > .caption-content")!
      .text
      .trim();
  data["token"] = document.getElementById("_token")!.attributes["value"];
  document.querySelectorAll(".caption > .media-attr").forEach((e) {
    var temp = e.text
        .split("\n")
        .map((e) => e.trim())
        .where((element) => element != "")
        .toList();
    data[temp.removeAt(0)] = temp.length == 1 ? temp[0] : temp;
  });

  data["type"] = url.contains("show") ? "TV" : "Movie";

  data["poster"] =
      document.querySelector(".app-player > img")!.attributes["src"];
  data["cover"] = document
      .querySelector(".media.media-cover")!
      .attributes['style']!
      .split('(')
      .last
      .split(")")
      .first
      .toString();
  if (data["type"] == "TV") {
    data["Seasons"] = document
        .querySelectorAll(".dropdown.episodes > .dropdown-menu")
        .map((e) => {
              "SeasonID": e.parent!.id,
              "Episodes": e
                  .querySelectorAll("button")
                  .map((b) => {
                        "title": b.text.split(':').last.trim(),
                        "EpisodeID": b.attributes["data-key"]
                      })
                  .toList()
            })
        .toList();
  } else {
    data["episodeID"] =
        document.getElementById("video_key")!.attributes["value"];
  }
  return Movie.fromJson(data);
}

Future<Map> fetchURL(
    {String token = "1128632717222a9", String id = "ZjBhNTkx"}) async {
  final Response r =
      await Dio().get("https://hdtoday.watch/fetch/$id?_token=$token");
  return r.data;
}

Future<Map> searchData({String q="flash"})async{

  final Response r= await Dio().get("https://hdtoday.watch/search?query=$q")

}