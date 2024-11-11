class HomeSectionRecentModel {
  int? code;
  String? status;
  String? message;
  List<HomeSectionRecentData>? data;

  HomeSectionRecentModel({this.code, this.status, this.message, this.data});

  HomeSectionRecentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeSectionRecentData>[];
      json['data'].forEach((v) {
        data!.add(HomeSectionRecentData.fromJson(v));
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

class HomeSectionRecentData {
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
  List<RecentGenres>? genres;
  List<RecentSeasons>? seasons;
  String? type;
  String? movieUid;
  bool? videoAccess;
  String? releaseDate;
  String? duration;
  int? views;
  List<RecentLanguages>? languages;
  List<RecentCasts>? casts;
  List<RecentDirectors>? directors;
  List<RecentTrailers>? trailers;
  Series? series;
  List<Episodes>? episodes;
  CustomData? customData;

  HomeSectionRecentData(
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
        this.type,
        this.movieUid,
        this.videoAccess,
        this.releaseDate,
        this.duration,
        this.views,
        this.languages,
        this.casts,
        this.directors,
        this.trailers,
        this.series,
        this.episodes});

  HomeSectionRecentData.fromJson(Map<String, dynamic> json) {
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
      genres = <RecentGenres>[];
      json['genres'].forEach((v) {
        genres!.add(RecentGenres.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <RecentSeasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(RecentSeasons.fromJson(v));
      });
    }
    type = json['type'];
    movieUid = json['movie_uid'];
    videoAccess = json['video_access'];
    releaseDate = json['release_date'];
    duration = json['duration'];
    views = json['views'];
    if (json['languages'] != null) {
      languages = <RecentLanguages>[];
      json['languages'].forEach((v) {
        languages!.add(RecentLanguages.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = <RecentCasts>[];
      json['casts'].forEach((v) {
        casts!.add(RecentCasts.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <RecentDirectors>[];
      json['directors'].forEach((v) {
        directors!.add(RecentDirectors.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <RecentTrailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(RecentTrailers.fromJson(v));
      });
    }
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
    customData = json['customData'] != null
        ? CustomData.fromJson(json['customData'])
        : null;
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
    data['movie_uid'] = movieUid;
    data['video_access'] = videoAccess;
    data['release_date'] = releaseDate;
    data['duration'] = duration;
    data['views'] = views;
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
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    if (customData != null) {
      data['customData'] = customData!.toJson();
    }
    return data;
  }
}

class RecentGenres {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  RecentGenres({this.id, this.name, this.nameBn, this.nameHi, this.nameAr});

  RecentGenres.fromJson(Map<String, dynamic> json) {
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

class RecentLanguages {
  int? id;
  String? name;

  RecentLanguages({this.id, this.name});

  RecentLanguages.fromJson(Map<String, dynamic> json) {
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


class RecentCasts {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  RecentCasts(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  RecentCasts.fromJson(Map<String, dynamic> json) {
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

class RecentDirectors {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  RecentDirectors(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  RecentDirectors.fromJson(Map<String, dynamic> json) {
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

class RecentTrailers {
  int? id;
  int? seasonId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;

  RecentTrailers(
      {this.id,
        this.seasonId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  RecentTrailers.fromJson(Map<String, dynamic> json) {
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

class RecentSeasons {
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
  List<SeasonsTrailers>? trailers;
  List<SeasonEpisodes>? episodes;

  RecentSeasons(
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

  RecentSeasons.fromJson(Map<String, dynamic> json) {
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
      trailers = <SeasonsTrailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(SeasonsTrailers.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <SeasonEpisodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(SeasonEpisodes.fromJson(v));
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


class SeasonsTrailers {
  int? id;
  int? movieId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SeasonsTrailers(
      {this.id,
        this.movieId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  SeasonsTrailers.fromJson(Map<String, dynamic> json) {
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


class SeasonEpisodes {
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

  SeasonEpisodes(
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

  SeasonEpisodes.fromJson(Map<String, dynamic> json) {
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

/// ============================@/ Season /@======================

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
  List<RecentGenres>? genres;
  List<Tags>? tags;

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
        this.tags});

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
      genres = <RecentGenres>[];
      json['genres'].forEach((v) {
        genres!.add(RecentGenres.fromJson(v));
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
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;

  Tags(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr});

  Tags.fromJson(Map<String, dynamic> json) {
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

/// ============================@/ Episode /@======================

class Episodes {
  int? id;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  int? episodeNumber;
  String? thumbnail;
  String? releaseDate;
  List<EpisodeDubbed>? dubbed;

  Episodes(
      {this.id,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.episodeNumber,
        this.thumbnail,
        this.releaseDate,
        this.dubbed});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    episodeNumber = json['episode_number'];
    thumbnail = json['thumbnail'];
    releaseDate = json['release_date'];
    if (json['dubbed'] != null) {
      dubbed = <EpisodeDubbed>[];
      json['dubbed'].forEach((v) {
        dubbed!.add(EpisodeDubbed.fromJson(v));
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

class EpisodeDubbed {
  int? id;
  int? episodeId;
  int? languageId;
  String? video;
  String? videoProcessingStatus;
  bool? status;
  String? createdAt;
  String? updatedAt;
  EpisodeLanguage? language;

  EpisodeDubbed(
      {this.id,
        this.episodeId,
        this.languageId,
        this.video,
        this.videoProcessingStatus,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.language});

  EpisodeDubbed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    episodeId = json['episode_id'];
    languageId = json['language_id'];
    video = json['video'];
    videoProcessingStatus = json['video_processing_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'] != null
        ? EpisodeLanguage.fromJson(json['language'])
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

class EpisodeLanguage {
  int? id;
  String? code;

  EpisodeLanguage({this.id, this.code});

  EpisodeLanguage.fromJson(Map<String, dynamic> json) {
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


class CustomData {
  int? id;
  int? homeSectionId;
  int? sortOrder;
  int? genreId;
  int? movieId;
  int? castId;
  int? directorId;
  int? seriesId;
  int? seasonId;
  int? episodeId;
  String? thumbnail;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  String? subSectionType;
  String? seriesUploadType;
  bool? status;

  CustomData(
      {this.id,
        this.homeSectionId,
        this.sortOrder,
        this.genreId,
        this.movieId,
        this.castId,
        this.directorId,
        this.seriesId,
        this.seasonId,
        this.episodeId,
        this.thumbnail,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.subSectionType,
        this.seriesUploadType,
        this.status});

  CustomData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeSectionId = json['home_section_id'];
    sortOrder = json['sort_order'];
    genreId = json['genre_id'];
    movieId = json['movie_id'];
    castId = json['cast_id'];
    directorId = json['director_id'];
    seriesId = json['series_id'];
    seasonId = json['season_id'];
    episodeId = json['episode_id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    subSectionType = json['sub_section_type'];
    seriesUploadType = json['series_upload_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['home_section_id'] = homeSectionId;
    data['sort_order'] = sortOrder;
    data['genre_id'] = genreId;
    data['movie_id'] = movieId;
    data['cast_id'] = castId;
    data['director_id'] = directorId;
    data['series_id'] = seriesId;
    data['season_id'] = seasonId;
    data['episode_id'] = episodeId;
    data['thumbnail'] = thumbnail;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['sub_section_type'] = subSectionType;
    data['series_upload_type'] = seriesUploadType;
    data['status'] = status;
    return data;
  }
}
