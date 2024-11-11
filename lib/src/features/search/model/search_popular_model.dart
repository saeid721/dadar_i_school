class SearchPopularModel {
  int? code;
  String? status;
  String? message;
  List<SearchPopularData>? data;

  SearchPopularModel({this.code, this.status, this.message, this.data});

  SearchPopularModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SearchPopularData>[];
      json['data'].forEach((v) {
        data!.add(SearchPopularData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchPopularData {
  int? id;
  String? movieUid;
  String? slug;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  bool? videoAccess;
  int? imdbRating;
  int? imdbVotes;
  bool? upcoming;
  String? releaseDate;
  String? duration;
  String? description;
  String? descriptionBn;
  String? descriptionHi;
  String? descriptionAr;
  String? thumbnail;
  String? cover;
  int? views;
  String? contentRating;
  int? industryId;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Dubbed>? dubbed;
  List<Casts>? casts;
  List<Directors>? directors;
  List<Genres>? genres;
  Industry? industry;
  List<Languages>? languages;
  List<Tags>? tags;
  List<Trailers>? trailers;
  String? type;
  String? seriesUid;
  List<Seasons>? seasons;

  SearchPopularData(
      {this.id,
        this.movieUid,
        this.slug,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.videoAccess,
        this.imdbRating,
        this.imdbVotes,
        this.upcoming,
        this.releaseDate,
        this.duration,
        this.description,
        this.descriptionBn,
        this.descriptionHi,
        this.descriptionAr,
        this.thumbnail,
        this.cover,
        this.views,
        this.contentRating,
        this.industryId,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.dubbed,
        this.casts,
        this.directors,
        this.genres,
        this.industry,
        this.languages,
        this.tags,
        this.trailers,
        this.type,
        this.seriesUid,
        this.seasons});

  SearchPopularData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieUid = json['movie_uid'];
    slug = json['slug'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    videoAccess = json['video_access'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    upcoming = json['upcoming'];
    releaseDate = json['release_date'];
    duration = json['duration'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
    thumbnail = json['thumbnail'];
    cover = json['cover'];
    views = json['views'];
    contentRating = json['content_rating'];
    industryId = json['industry_id'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['dubbed'] != null) {
      dubbed = <Dubbed>[];
      json['dubbed'].forEach((v) {
        dubbed!.add(Dubbed.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = <Casts>[];
      json['casts'].forEach((v) {
        casts!.add(Casts.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <Directors>[];
      json['directors'].forEach((v) {
        directors!.add(Directors.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    industry = json['industry'] != null
        ? Industry.fromJson(json['industry'])
        : null;
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
      });
    }
    type = json['type'];
    seriesUid = json['series_uid'];
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['movie_uid'] = movieUid;
    data['slug'] = slug;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['video_access'] = videoAccess;
    data['imdb_rating'] = imdbRating;
    data['imdb_votes'] = imdbVotes;
    data['upcoming'] = upcoming;
    data['release_date'] = releaseDate;
    data['duration'] = duration;
    data['description'] = description;
    data['description_bn'] = descriptionBn;
    data['description_hi'] = descriptionHi;
    data['description_ar'] = descriptionAr;
    data['thumbnail'] = thumbnail;
    data['cover'] = cover;
    data['views'] = views;
    data['content_rating'] = contentRating;
    data['industry_id'] = industryId;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (dubbed != null) {
      data['dubbed'] = dubbed!.map((v) => v.toJson()).toList();
    }
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['series_uid'] = seriesUid;
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dubbed {
  int? id;
  int? movieId;
  int? languageId;
  String? video;
  String? videoProcessingStatus;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Dubbed(
      {this.id,
        this.movieId,
        this.languageId,
        this.video,
        this.videoProcessingStatus,
        this.status,
        this.createdAt,
        this.updatedAt});

  Dubbed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movie_id'];
    languageId = json['language_id'];
    video = json['video'];
    videoProcessingStatus = json['video_processing_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['movie_id'] = movieId;
    data['language_id'] = languageId;
    data['video'] = video;
    data['video_processing_status'] = videoProcessingStatus;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Casts {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Casts(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  Casts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Directors {
  int? id;
  String? name;

  Directors(
      {this.id,
        this.name});

  Directors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Genres {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? slug;
  String? thumbnail;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Genres(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.slug,
        this.thumbnail,
        this.status,
        this.createdAt,
        this.updatedAt});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['slug'] = slug;
    data['thumbnail'] = thumbnail;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Industry {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? country;
  String? countryBn;
  String? countryHi;
  String? countryAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Industry(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.country,
        this.countryBn,
        this.countryHi,
        this.countryAr,
        this.status,
        this.createdAt,
        this.updatedAt});

  Industry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    country = json['country'];
    countryBn = json['country_bn'];
    countryHi = json['country_hi'];
    countryAr = json['country_ar'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['country'] = country;
    data['country_bn'] = countryBn;
    data['country_hi'] = countryHi;
    data['country_ar'] = countryAr;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Languages {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? code;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Languages(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.code,
        this.status,
        this.createdAt,
        this.updatedAt});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    code = json['code'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['code'] = code;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Tags(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.status,
        this.createdAt,
        this.updatedAt});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Trailers {
  int? id;
  int? movieId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Trailers(
      {this.id,
        this.movieId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movie_id'];
    languageId = json['language_id'];
    url = json['url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['movie_id'] = movieId;
    data['language_id'] = languageId;
    data['url'] = url;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Seasons {
  int? id;
  int? seriesId;
  int? seasonNumber;
  String? releaseDate;
  int? imdbRating;
  int? imdbVotes;
  bool? upcoming;
  bool? videoAccess;
  String? thumbnail;
  String? cover;
  String? contentRating;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Trailers>? trailers;
  List<Casts>? casts;
  List<Directors>? directors;
  List<String>? languages; // Changed from List<Null> to List<String>
  List<Tags>? tags;

  Seasons({
    this.id,
    this.seriesId,
    this.seasonNumber,
    this.releaseDate,
    this.imdbRating,
    this.imdbVotes,
    this.upcoming,
    this.videoAccess,
    this.thumbnail,
    this.cover,
    this.contentRating,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.trailers,
    this.casts,
    this.directors,
    this.languages, // Changed type to List<String>?
    this.tags,
  });

  Seasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesId = json['series_id'];
    seasonNumber = json['season_number'];
    releaseDate = json['release_date'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    upcoming = json['upcoming'];
    videoAccess = json['video_access'];
    thumbnail = json['thumbnail'];
    cover = json['cover'];
    contentRating = json['content_rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
      });
    }

    if (json['casts'] != null) {
      casts = <Casts>[];
      json['casts'].forEach((v) {
        casts!.add(Casts.fromJson(v));
      });
    }

    if (json['directors'] != null) {
      directors = <Directors>[];
      json['directors'].forEach((v) {
        directors!.add(Directors.fromJson(v));
      });
    }

    if (json['languages'] != null) {
      languages = <String>[]; // Changed type to List<String>
      json['languages'].forEach((v) {
        languages!.add(v); // Add as String
      });
    }

    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['series_id'] = seriesId;
    data['season_number'] = seasonNumber;
    data['release_date'] = releaseDate;
    data['imdb_rating'] = imdbRating;
    data['imdb_votes'] = imdbVotes;
    data['upcoming'] = upcoming;
    data['video_access'] = videoAccess;
    data['thumbnail'] = thumbnail;
    data['cover'] = cover;
    data['content_rating'] = contentRating;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }

    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }

    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }

    if (languages != null) {
      data['languages'] = languages!.map((v) => v).toList(); // Changed mapping for String
    }

    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

// class Trailers {
//   int? id;
//   int? seasonId;
//   int? languageId;
//   String? url;
//   bool? status;
//   String? createdAt;
//   String? updatedAt;
//
//   Trailers(
//       {this.id,
//         this.seasonId,
//         this.languageId,
//         this.url,
//         this.status,
//         this.createdAt,
//         this.updatedAt});
//
//   Trailers.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     seasonId = json['season_id'];
//     languageId = json['language_id'];
//     url = json['url'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['season_id'] = this.seasonId;
//     data['language_id'] = this.languageId;
//     data['url'] = this.url;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }