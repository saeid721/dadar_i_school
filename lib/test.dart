class FreeTabViewModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  FreeTabViewModel({this.code, this.status, this.message, this.data});

  FreeTabViewModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Movies>? movies;
  List<Series>? series;
  List<Seasons>? seasons;
  List<Episodes>? episodes;

  Data({this.movies, this.series, this.seasons, this.episodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
    if (json['series'] != null) {
      series = <Series>[];
      json['series'].forEach((v) {
        series!.add(Series.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    if (series != null) {
      data['series'] = series!.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
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
  List<SeriesGenres>? genres;
  List<Languages>? languages;
  List<Casts>? casts;
  List<Directors>? directors;
  List<Trailers>? trailers;
  String? type;

  Movies(
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
        this.genres,
        this.languages,
        this.casts,
        this.directors,
        this.trailers,
        this.type});

  Movies.fromJson(Map<String, dynamic> json) {
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
    if (json['genres'] != null) {
      genres = <SeriesGenres>[];
      json['genres'].forEach((v) {
        genres!.add(SeriesGenres.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
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
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
      });
    }
    type = json['type'];
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
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class SeriesGenres {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  SeriesGenres({this.id, this.name, this.nameBn, this.nameHi, this.nameAr});

  SeriesGenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    return data;
  }
}

class SeriesTags {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  SeriesTags(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  SeriesTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    return data;
  }
}

class Languages {
  int? id;
  String? name;

  Languages({this.id, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
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

class Casts {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  Casts({this.id, this.name, this.nameBn, this.nameHi, this.nameAr});

  Casts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    return data;
  }
}

class Trailers {
  int? id;
  String? url;
  Language? language;

  Trailers({this.id, this.url, this.language});

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    language = json['language'] != null
        ? Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}

class Language {
  int? id;
  String? code;

  Language({this.id, this.code});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    return data;
  }
}

class Directors {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  Directors(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  Directors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    return data;
  }
}


class Series {
  int? id;
  String? seriesUid;
  String? slug;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  int? imdbRating;
  int? imdbVotes;
  bool? upcoming;
  bool? videoAccess;
  String? description;
  String? descriptionBn;
  String? descriptionHi;
  String? descriptionAr;
  String? thumbnail;
  String? cover;
  String? contentRating;
  int? industryId;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<SeriesGenres>? genres;
  List<SeriesTags>? tags;
  List<Seasons>? seasons;
  String? type;

  Series(
      {this.id,
        this.seriesUid,
        this.slug,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.imdbRating,
        this.imdbVotes,
        this.upcoming,
        this.videoAccess,
        this.description,
        this.descriptionBn,
        this.descriptionHi,
        this.descriptionAr,
        this.thumbnail,
        this.cover,
        this.contentRating,
        this.industryId,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.genres,
        this.tags,
        this.seasons,
        this.type});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesUid = json['series_uid'];
    slug = json['slug'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    upcoming = json['upcoming'];
    videoAccess = json['video_access'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
    thumbnail = json['thumbnail'];
    cover = json['cover'];
    contentRating = json['content_rating'];
    industryId = json['industry_id'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['genres'] != null) {
      genres = <SeriesGenres>[];
      json['genres'].forEach((v) {
        genres!.add(SeriesGenres.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <SeriesTags>[];
      json['tags'].forEach((v) {
        tags!.add(SeriesTags.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['series_uid'] = seriesUid;
    data['slug'] = slug;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['imdb_rating'] = imdbRating;
    data['imdb_votes'] = imdbVotes;
    data['upcoming'] = upcoming;
    data['video_access'] = videoAccess;
    data['description'] = description;
    data['description_bn'] = descriptionBn;
    data['description_hi'] = descriptionHi;
    data['description_ar'] = descriptionAr;
    data['thumbnail'] = thumbnail;
    data['cover'] = cover;
    data['content_rating'] = contentRating;
    data['industry_id'] = industryId;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class SeriesSeasons {
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
  List<Casts>? casts;
  List<Directors>? directors;
  List<Languages>? languages;
  List<Episodes>? episodes;
  List<Trailers>? trailers;

  SeriesSeasons(
      {this.id,
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
        this.casts,
        this.directors,
        this.languages,
        this.episodes,
        this.trailers});

  SeriesSeasons.fromJson(Map<String, dynamic> json) {
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
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
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
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeasonEpisodes {
  int? id;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  int? episodeNumber;
  String? thumbnail;
  String? releaseDate;
  List<Dubbed>? dubbed;

  SeasonEpisodes(
      {this.id,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.episodeNumber,
        this.thumbnail,
        this.releaseDate,
        this.dubbed});

  SeasonEpisodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    episodeNumber = json['episode_number'];
    thumbnail = json['thumbnail'];
    releaseDate = json['release_date'];
    if (json['dubbed'] != null) {
      dubbed = <Dubbed>[];
      json['dubbed'].forEach((v) {
        dubbed!.add(Dubbed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['episode_number'] = episodeNumber;
    data['thumbnail'] = thumbnail;
    data['release_date'] = releaseDate;
    if (dubbed != null) {
      data['dubbed'] = dubbed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dubbed {
  int? id;
  int? episodeId;
  int? languageId;
  String? video;
  String? videoProcessingStatus;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Language? language;

  Dubbed(
      {this.id,
        this.episodeId,
        this.languageId,
        this.video,
        this.videoProcessingStatus,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.language});

  Dubbed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    episodeId = json['episode_id'];
    languageId = json['language_id'];
    video = json['video'];
    videoProcessingStatus = json['video_processing_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'] != null
        ? Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['episode_id'] = episodeId;
    data['language_id'] = languageId;
    data['video'] = video;
    data['video_processing_status'] = videoProcessingStatus;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (language != null) {
      data['language'] = language!.toJson();
    }
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
  Series? series;
  List<Casts>? casts;
  List<Directors>? directors;
  List<Languages>? languages;
  List<Episodes>? episodes;
  List<Trailers>? trailers;
  String? type;

  Seasons(
      {this.id,
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
        this.series,
        this.casts,
        this.directors,
        this.languages,
        this.episodes,
        this.trailers,
        this.type});

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
    series =
    json['series'] != null ? Series.fromJson(json['series']) : null;
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
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
      });
    }
    type = json['type'];
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
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Episodes {
  int? id;
  int? seasonId;
  int? episodeNumber;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  int? imdbRating;
  int? imdbVotes;
  bool? videoAccess;
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
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Dubbed>? dubbed;
  Season? season;
  String? type;

  Episodes(
      {this.id,
        this.seasonId,
        this.episodeNumber,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.imdbRating,
        this.imdbVotes,
        this.videoAccess,
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
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.dubbed,
        this.season,
        this.type});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seasonId = json['season_id'];
    episodeNumber = json['episode_number'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    videoAccess = json['video_access'];
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
    season =
    json['season'] != null ? Season.fromJson(json['season']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season_id'] = seasonId;
    data['episode_number'] = episodeNumber;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['imdb_rating'] = imdbRating;
    data['imdb_votes'] = imdbVotes;
    data['video_access'] = videoAccess;
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
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (dubbed != null) {
      data['dubbed'] = dubbed!.map((v) => v.toJson()).toList();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class Season {
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
  Series? series;
  List<Casts>? casts;
  List<Directors>? directors;
  List<Languages>? languages;
  List<Trailers>? trailers;

  Season(
      {this.id,
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
        this.series,
        this.casts,
        this.directors,
        this.languages,
        this.trailers});

  Season.fromJson(Map<String, dynamic> json) {
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
    series =
    json['series'] != null ? Series.fromJson(json['series']) : null;
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
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
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
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
