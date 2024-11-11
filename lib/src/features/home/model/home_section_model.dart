class HomeSectionModel {
  int? code;
  String? status;
  String? message;
  List<HomeSectionData>? data;

  HomeSectionModel({this.code, this.status, this.message, this.data});

  HomeSectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeSectionData>[];
      json['data'].forEach((v) {
        data!.add(HomeSectionData.fromJson(v));
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

class HomeSectionData {
  int? id;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  String? sectionType;
  String? subSectionType;
  int? sortOrder;
  int? movieId;
  int? seriesId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  SectionMovie? movie;
  SectionSeries? series;
  SectionSeason? season;

  HomeSectionData(
      {this.id,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.sectionType,
        this.subSectionType,
        this.sortOrder,
        this.movieId,
        this.seriesId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.movie});

  HomeSectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    sectionType = json['section_type'];
    subSectionType = json['sub_section_type'];
    sortOrder = json['sort_order'];
    movieId = json['movie_id'];
    seriesId = json['series_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    movie = json['movie'] != null ? SectionMovie.fromJson(json['movie']) : null;
    series = json['series'] != null ? SectionSeries.fromJson(json['series']) : null;
    season = json['season'] != null ? SectionSeason.fromJson(json['season']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['section_type'] = sectionType;
    data['sub_section_type'] = subSectionType;
    data['sort_order'] = sortOrder;
    data['movie_id'] = movieId;
    data['series_id'] = seriesId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (movie != null) {
      data['movie'] = movie!.toJson();
    }
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    return data;
  }
}

class SectionMovie {
  int? id;
  String? cover;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  String? thumbnail;
  String? releaseDate;
  String? description;
  String? descriptionBn;
  String? descriptionHi;
  String? descriptionAr;
  String? slug;
  List<MovieTrailers>? trailers;
  List<MovieLanguages>? languages;
  List<MovieDubbed>? dubbed;
  List<MovieGenres>? genres;

  SectionMovie(
      {this.id,
        this.cover,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.thumbnail,
        this.releaseDate,
        this.description,
        this.descriptionBn,
        this.descriptionHi,
        this.descriptionAr,
        this.slug,
        this.trailers,
        this.languages,
        this.dubbed,
        this.genres});

  SectionMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    thumbnail = json['thumbnail'];
    releaseDate = json['release_date'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
    slug = json['slug'];
    if (json['trailers'] != null) {
      trailers = <MovieTrailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(MovieTrailers.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <MovieLanguages>[];
      json['languages'].forEach((v) {
        languages!.add(MovieLanguages.fromJson(v));
      });
    }
    if (json['dubbed'] != null) {
      dubbed = <MovieDubbed>[];
      json['dubbed'].forEach((v) {
        dubbed!.add(MovieDubbed.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <MovieGenres>[];
      json['genres'].forEach((v) {
        genres!.add(MovieGenres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cover'] = cover;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['thumbnail'] = thumbnail;
    data['release_date'] = releaseDate;
    data['description'] = description;
    data['description_bn'] = descriptionBn;
    data['description_hi'] = descriptionHi;
    data['description_ar'] = descriptionAr;
    data['slug'] = slug;
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (dubbed != null) {
      data['dubbed'] = dubbed!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieTrailers {
  int? id;
  int? movieId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieTrailers(
      {this.id,
        this.movieId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  MovieTrailers.fromJson(Map<String, dynamic> json) {
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

class MovieLanguages {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? code;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieLanguages(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.code,
        this.status,
        this.createdAt,
        this.updatedAt});

  MovieLanguages.fromJson(Map<String, dynamic> json) {
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

class MovieDubbed {
  int? id;
  int? movieId;
  int? languageId;
  String? video;
  String? videoProcessingStatus;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieDubbed(
      {this.id,
        this.movieId,
        this.languageId,
        this.video,
        this.videoProcessingStatus,
        this.status,
        this.createdAt,
        this.updatedAt});

  MovieDubbed.fromJson(Map<String, dynamic> json) {
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

class MovieGenres {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  MovieGenres({this.id, this.name, this.nameBn, this.nameHi, this.nameAr});

  MovieGenres.fromJson(Map<String, dynamic> json) {
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


class SectionSeries {
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

  SectionSeries(
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
        this.genres});

  SectionSeries.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class SeriesGenres {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? slug;

  SeriesGenres(
      {this.id, this.name, this.nameBn, this.nameHi, this.nameAr, this.slug});

  SeriesGenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['slug'] = slug;
    return data;
  }
}


class SectionSeason {
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

  SectionSeason(
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
        this.trailers});

  SectionSeason.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Trailers {
  int? id;
  int? seasonId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;
  MovieLanguages? language;

  Trailers(
      {this.id,
        this.seasonId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.language});

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seasonId = json['season_id'];
    languageId = json['language_id'];
    url = json['url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'] != null
        ? MovieLanguages.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season_id'] = seasonId;
    data['language_id'] = languageId;
    data['url'] = url;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}
