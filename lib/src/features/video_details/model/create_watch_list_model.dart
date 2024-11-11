class CreateWatchListModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  CreateWatchListModel({this.code, this.status, this.message, this.data});

  CreateWatchListModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? subscriberId;
  int? movieId;
  int? seriesId;
  int? seasonId;
  int? episodeId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.subscriberId,
        this.movieId,
        this.seriesId,
        this.seasonId,
        this.episodeId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriberId = json['subscriber_id'];
    movieId = json['movie_id'];
    seriesId = json['series_id'];
    seasonId = json['season_id'];
    episodeId = json['episode_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subscriber_id'] = subscriberId;
    data['movie_id'] = movieId;
    data['series_id'] = seriesId;
    data['season_id'] = seasonId;
    data['episode_id'] = episodeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
