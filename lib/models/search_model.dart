// // import 'dart:convert';

// // SearchModel searchModelFromJson(String str) =>
// //     SearchModel.fromJson(json.decode(str));

// // String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    // this.genreIds,
    required this.id,
    // required this.mediaType,
    // required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    // required this.gender,
    // this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.profilePath,
    // required this.firstAirDate,
    // this.originCountry,
    required this.originalName,
  });

  bool adult;
  String backdropPath;
  // List<int>? genreIds;
  int id;
  // MediaType mediaType;
  // OriginalLanguage? originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  // int gender;
  // List<KnownFor>? knownFor;
  String knownForDepartment;
  String name;
  String profilePath;
  // DateTime? firstAirDate;
  // List<String>? originCountry;
  String originalName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        // genreIds: json["genre_ids"] == null
        //     ? null
        //     : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        // mediaType: mediaTypeValues.map[json["media_type"]]!,
        // originalLanguage: json["original_language"] == null
        //     ? null
        //     : originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        // gender: json["gender"]!,
        // knownFor: json["known_for"] == null
        //     ? null
        //     : List<KnownFor>.from(
        //         json["known_for"].map((x) => KnownFor.fromJson(x))),
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        profilePath: json["profile_path"],
        // firstAirDate: json["first_air_date"] == null
        //     ? null
        //     : DateTime.parse(json["first_air_date"]),
        // originCountry: json["origin_country"] == null
        //     ? null
        //     : List<String>.from(json["origin_country"].map((x) => x)),
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        // "genre_ids": genreIds == null
        //     ? null
        //     : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        // "media_type": mediaTypeValues.reverse[mediaType],
        // "original_language": originalLanguage == null
        //     ? null
        //     : originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        // "gender": gender,
        // "known_for": knownFor == null
        //     ? null
        //     : List<dynamic>.from(knownFor!.map((x) => x.toJson())),
        "known_for_department": knownForDepartment,
        "name": name,
        "profile_path": profilePath,
        // "first_air_date": firstAirDate == null
        //     ? null
        //     : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        // "origin_country": originCountry == null
        //     ? null
        //     : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_name": originalName,
      };
}

class KnownFor {
  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    // required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  // MediaType mediaType;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        // mediaType: mediaTypeValues.map[json["media_type"]]!,
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        // "media_type": mediaTypeValues.reverse[mediaType],
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

// enum MediaType { MOVIE, PERSON, TV }

// final mediaTypeValues = EnumValues(
//     {"movie": MediaType.MOVIE, "person": MediaType.PERSON, "tv": MediaType.TV});

// enum OriginalLanguage { EN, TR }

// final originalLanguageValues =
//     EnumValues({"en": OriginalLanguage.EN, "tr": OriginalLanguage.TR});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }


// class SearchRestaurantModel {
//   SearchRestaurantModel({
//     required this.error,
//     required this.founded,
//     required this.restaurants,
//   });

//   bool error;
//   int founded;
//   List<Restaurant> restaurants;

//   factory SearchRestaurantModel.fromJson(Map<String, dynamic> json) =>
//       SearchRestaurantModel(
//         error: json["error"],
//         founded: json["founded"],
//         restaurants: List<Restaurant>.from(
//             json["restaurants"].map((x) => Restaurant.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error,
//         "founded": founded,
//         "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
//       };
// }

// class Restaurant {
//   Restaurant({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.pictureId,
//     required this.city,
//     required this.rating,
//   });

//   String id;
//   String name;
//   String description;
//   String pictureId;
//   String city;
//   double rating;

//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         pictureId: json["pictureId"],
//         city: json["city"],
//         rating: json["rating"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "pictureId": pictureId,
//         "city": city,
//         "rating": rating,
//       };
// }
