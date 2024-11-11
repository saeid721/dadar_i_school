class HomeSectionSelectedSeriesModel {
  int? code;
  String? status;
  String? message;
  List<HomeSectionSelectedSeriesData>? data;

  HomeSectionSelectedSeriesModel(
      {this.code, this.status, this.message, this.data});

  HomeSectionSelectedSeriesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeSectionSelectedSeriesData>[];
      json['data'].forEach((v) {
        data!.add(HomeSectionSelectedSeriesData.fromJson(v));
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

class HomeSectionSelectedSeriesData {
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
  List<Genres>? genres;
  List<HomeSectionSelectedSeriesSeasons>? seasons;
  String? type;

  HomeSectionSelectedSeriesData(
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
        this.seasons,
        this.type});

  HomeSectionSelectedSeriesData.fromJson(Map<String, dynamic> json) {
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
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <HomeSectionSelectedSeriesSeasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(HomeSectionSelectedSeriesSeasons.fromJson(v));
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
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Genres {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  Genres({this.id, this.name, this.nameBn, this.nameHi, this.nameAr});

  Genres.fromJson(Map<String, dynamic> json) {
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

class HomeSectionSelectedSeriesSeasons {
  int? id;
  int? seriesId;
  int? seasonNumber;
  String? releaseDate;
  int? imdbRating;
  int? imdbVotes;
  bool? upcoming;
  String? thumbnail;
  String? cover;
  String? contentRating;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<SeasonsCasts>? casts;
  List<SeasonsDirectors>? directors;
  List<SeasonsLanguages>? languages;
  List<Trailers>? trailers;
  List<Episodes>? episodes;

  HomeSectionSelectedSeriesSeasons(
      {this.id,
        this.seriesId,
        this.seasonNumber,
        this.releaseDate,
        this.imdbRating,
        this.imdbVotes,
        this.upcoming,
        this.thumbnail,
        this.cover,
        this.contentRating,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.casts,
        this.directors,
        this.languages,
        this.trailers,
        this.episodes});

  HomeSectionSelectedSeriesSeasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesId = json['series_id'];
    seasonNumber = json['season_number'];
    releaseDate = json['release_date'];
    imdbRating = json['imdb_rating'];
    imdbVotes = json['imdb_votes'];
    upcoming = json['upcoming'];
    thumbnail = json['thumbnail'];
    cover = json['cover'];
    contentRating = json['content_rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['casts'] != null) {
      casts = <SeasonsCasts>[];
      json['casts'].forEach((v) {
        casts!.add(SeasonsCasts.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <SeasonsDirectors>[];
      json['directors'].forEach((v) {
        directors!.add(SeasonsDirectors.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <SeasonsLanguages>[];
      json['languages'].forEach((v) {
        languages!.add(SeasonsLanguages.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <Trailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(Trailers.fromJson(v));
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
    data['id'] = id;
    data['series_id'] = seriesId;
    data['season_number'] = seasonNumber;
    data['release_date'] = releaseDate;
    data['imdb_rating'] = imdbRating;
    data['imdb_votes'] = imdbVotes;
    data['upcoming'] = upcoming;
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
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class SeasonsCasts {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  SeasonsCasts(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  SeasonsCasts.fromJson(Map<String, dynamic> json) {
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

class SeasonsDirectors {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  SeasonsDirectors(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  SeasonsDirectors.fromJson(Map<String, dynamic> json) {
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


class SeasonsLanguages {
  int? id;
  String? name;

  SeasonsLanguages({this.id, this.name});

  SeasonsLanguages.fromJson(Map<String, dynamic> json) {
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


class Trailers {
  int? id;
  int? seasonId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Trailers(
      {this.id,
        this.seasonId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seasonId = json['season_id'];
    languageId = json['language_id'];
    url = json['url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
        this.updatedAt});

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
    return data;
  }
}
