class HomeSlidersModel {
  int? code;
  String? status;
  String? message;
  List<HomeSlidersData>? data;

  HomeSlidersModel({this.code, this.status, this.message, this.data});

  HomeSlidersModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeSlidersData>[];
      json['data'].forEach((v) {
        data!.add(HomeSlidersData.fromJson(v));
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

class HomeSlidersData {
  int? id;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  String? shortDescription;
  String? shortDescriptionBn;
  String? shortDescriptionHi;
  String? shortDescriptionAr;
  String? banner;
  String? sliderLink;
  String? sliderType;
  String? sliderContentType;
  String? sliderSeriesUploadType;
  int? movieId;
  int? seriesId;
  int? seasonId;
  int? episodeId;
  int? tvShowId;
  int? documentaryId;
  int? blogId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  HomeSliderMovie? movie;
  HomeSliderSeries? series;
  SeriesSeasons? season;
  SeasonsEpisodes? episode;

  HomeSlidersData(
      {this.id,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.shortDescription,
        this.shortDescriptionBn,
        this.shortDescriptionHi,
        this.shortDescriptionAr,
        this.banner,
        this.sliderLink,
        this.sliderType,
        this.sliderContentType,
        this.sliderSeriesUploadType,
        this.movieId,
        this.seriesId,
        this.seasonId,
        this.episodeId,
        this.tvShowId,
        this.documentaryId,
        this.blogId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.movie,
        this.series,
        this.season,
        this.episode});

  HomeSlidersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    shortDescription = json['short_description'];
    shortDescriptionBn = json['short_description_bn'];
    shortDescriptionHi = json['short_description_hi'];
    shortDescriptionAr = json['short_description_ar'];
    banner = json['banner'];
    sliderLink = json['slider_link'];
    sliderType = json['slider_type'];
    sliderContentType = json['slider_content_type'];
    sliderSeriesUploadType = json['slider_series_upload_type'];
    movieId = json['movie_id'];
    seriesId = json['series_id'];
    seasonId = json['season_id'];
    episodeId = json['episode_id'];
    tvShowId = json['tv_show_id'];
    documentaryId = json['documentary_id'];
    blogId = json['blog_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    movie = json['movie'] != null ? HomeSliderMovie.fromJson(json['movie']) : null;
    series = json['series'] != null ? HomeSliderSeries.fromJson(json['series']) : null;
    season = json['season'] != null ? SeriesSeasons.fromJson(json['season']) : null;
    episode = json['episode'] != null ? SeasonsEpisodes.fromJson(json['episode']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['short_description'] = shortDescription;
    data['short_description_bn'] = shortDescriptionBn;
    data['short_description_hi'] = shortDescriptionHi;
    data['short_description_ar'] = shortDescriptionAr;
    data['banner'] = banner;
    data['slider_link'] = sliderLink;
    data['slider_type'] = sliderType;
    data['slider_content_type'] = sliderContentType;
    data['slider_series_upload_type'] = sliderSeriesUploadType;
    data['movie_id'] = movieId;
    data['series_id'] = seriesId;
    data['season_id'] = seasonId;
    data['episode_id'] = episodeId;
    data['tv_show_id'] = tvShowId;
    data['documentary_id'] = documentaryId;
    data['blog_id'] = blogId;
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
    if (episode != null) {
      data['episode'] = episode!.toJson();
    }
    return data;
  }
}

/// ========================================//@ Movie Side Model @//=======================================

class HomeSliderMovie {
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
  List<MovieTags>? tags;
  List<MovieGenres>? genres;
  List<MovieCasts>? casts;
  List<MovieDirectors>? directors;
  MovieIndustry? industry;
  List<MovieTrailers>? trailers;

  HomeSliderMovie(
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
        this.tags,
        this.genres,
        this.casts,
        this.directors,
        this.industry,
        this.trailers});

  HomeSliderMovie.fromJson(Map<String, dynamic> json) {
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
    if (json['tags'] != null) {
      tags = <MovieTags>[];
      json['tags'].forEach((v) {
        tags!.add(MovieTags.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <MovieGenres>[];
      json['genres'].forEach((v) {
        genres!.add(MovieGenres.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = <MovieCasts>[];
      json['casts'].forEach((v) {
        casts!.add(MovieCasts.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <MovieDirectors>[];
      json['directors'].forEach((v) {
        directors!.add(MovieDirectors.fromJson(v));
      });
    }
    industry = json['industry'] != null
        ? MovieIndustry.fromJson(json['industry'])
        : null;
    if (json['trailers'] != null) {
      trailers = <MovieTrailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(MovieTrailers.fromJson(v));
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
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieTags {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieTags(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.status,
        this.createdAt,
        this.updatedAt});

  MovieTags.fromJson(Map<String, dynamic> json) {
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

class MovieGenres {
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

  MovieGenres(
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

  MovieGenres.fromJson(Map<String, dynamic> json) {
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

class MovieCasts {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieCasts(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  MovieCasts.fromJson(Map<String, dynamic> json) {
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


class MovieDirectors {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieDirectors(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  MovieDirectors.fromJson(Map<String, dynamic> json) {
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


class MovieIndustry {
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

  MovieIndustry(
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

  MovieIndustry.fromJson(Map<String, dynamic> json) {
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

class MovieTrailers {
  int? id;
  int? movieId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;
  LanguageCodeModel? language;

  MovieTrailers(
      {this.id,
        this.movieId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.language});

  MovieTrailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movie_id'];
    languageId = json['language_id'];
    url = json['url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'] != null
        ? LanguageCodeModel.fromJson(json['language'])
        : null;
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
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}

class LanguageCodeModel {
  String? code;

  LanguageCodeModel({this.code});

  LanguageCodeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}

/// ========================================//@ Series Side Model @//=======================================

class HomeSliderSeries {
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
  List<SeasonSeriesTags>? tags;
  List<SeriesGenres>? genres;
  SeriesIndustry? industry;
  List<SeriesSeasons>? seasons;

  HomeSliderSeries(
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
        this.tags,
        this.genres,
        this.industry,
        this.seasons});

  HomeSliderSeries.fromJson(Map<String, dynamic> json) {
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
    if (json['tags'] != null) {
      tags = <SeasonSeriesTags>[];
      json['tags'].forEach((v) {
        tags!.add(SeasonSeriesTags.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <SeriesGenres>[];
      json['genres'].forEach((v) {
        genres!.add(SeriesGenres.fromJson(v));
      });
    }
    industry = json['industry'] != null
        ? SeriesIndustry.fromJson(json['industry'])
        : null;
    if (json['seasons'] != null) {
      seasons = <SeriesSeasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(SeriesSeasons.fromJson(v));
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
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeasonSeriesTags {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SeasonSeriesTags(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.status,
        this.createdAt,
        this.updatedAt});

  SeasonSeriesTags.fromJson(Map<String, dynamic> json) {
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

class SeriesGenres {
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

  SeriesGenres(
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

  SeriesGenres.fromJson(Map<String, dynamic> json) {
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

class SeriesIndustry {
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

  SeriesIndustry(
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

  SeriesIndustry.fromJson(Map<String, dynamic> json) {
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

class SeriesSeasons {
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
  List<SeasonsEpisodes>? episodes;
  List<SeasonCasts>? casts;
  List<SeasonDirectors>? directors;
  List<SeasonSeriesTags>? tags;
  List<SeasonTrailers>? trailers;

  SeriesSeasons(
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
        this.episodes,
        this.casts,
        this.directors,
        this.tags,
        this.trailers});

  SeriesSeasons.fromJson(Map<String, dynamic> json) {
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
    if (json['episodes'] != null) {
      episodes = <SeasonsEpisodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(SeasonsEpisodes.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = <SeasonCasts>[];
      json['casts'].forEach((v) {
        casts!.add(SeasonCasts.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <SeasonDirectors>[];
      json['directors'].forEach((v) {
        directors!.add(SeasonDirectors.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <SeasonSeriesTags>[];
      json['tags'].forEach((v) {
        tags!.add(SeasonSeriesTags.fromJson(v));
      });
    }
    if (json['trailers'] != null) {
      trailers = <SeasonTrailers>[];
      json['trailers'].forEach((v) {
        trailers!.add(SeasonTrailers.fromJson(v));
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
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeasonsEpisodes {
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

  SeasonsEpisodes(
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
        this.dubbed});

  SeasonsEpisodes.fromJson(Map<String, dynamic> json) {
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

class Language {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? code;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Language(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.code,
        this.status,
        this.createdAt,
        this.updatedAt});

  Language.fromJson(Map<String, dynamic> json) {
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

class SeasonCasts {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SeasonCasts(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  SeasonCasts.fromJson(Map<String, dynamic> json) {
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


class SeasonDirectors {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SeasonDirectors(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  SeasonDirectors.fromJson(Map<String, dynamic> json) {
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


class SeasonTrailers {
  int? id;
  int? seasonId;
  int? languageId;
  String? url;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SeasonTrailers(
      {this.id,
        this.seasonId,
        this.languageId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  SeasonTrailers.fromJson(Map<String, dynamic> json) {
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

/// ========================================//@ Season Side Model @//=======================================