class FooterPopularMoviesModel {
  int? code;
  String? status;
  String? message;
  List<FooterPopularMoviesData>? data;

  FooterPopularMoviesModel({this.code, this.status, this.message, this.data});

  FooterPopularMoviesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FooterPopularMoviesData>[];
      json['data'].forEach((v) {
        data!.add(FooterPopularMoviesData.fromJson(v));
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

class FooterPopularMoviesData {
  int? id;
  String? slug;
  int? sortOrder;
  String? pageTitle;
  String? pageTitleBn;
  String? pageTitleHi;
  String? pageTitleAr;
  String? subPageTitle;
  String? subPageTitleBn;
  String? subPageTitleHi;
  String? subPageTitleAr;
  String? cover;
  String? image;
  String? description;
  String? descriptionBn;
  String? descriptionHi;
  String? descriptionAr;
  String? footerType;
  String? footerUrlType;
  String? customUrl;
  bool? status;
  String? createdAt;
  String? updatedAt;

  FooterPopularMoviesData(
      {this.id,
        this.slug,
        this.sortOrder,
        this.pageTitle,
        this.pageTitleBn,
        this.pageTitleHi,
        this.pageTitleAr,
        this.subPageTitle,
        this.subPageTitleBn,
        this.subPageTitleHi,
        this.subPageTitleAr,
        this.cover,
        this.image,
        this.description,
        this.descriptionBn,
        this.descriptionHi,
        this.descriptionAr,
        this.footerType,
        this.footerUrlType,
        this.customUrl,
        this.status,
        this.createdAt,
        this.updatedAt});

  FooterPopularMoviesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    pageTitle = json['page_title'];
    pageTitleBn = json['page_title_bn'];
    pageTitleHi = json['page_title_hi'];
    pageTitleAr = json['page_title_ar'];
    subPageTitle = json['sub_page_title'];
    subPageTitleBn = json['sub_page_title_bn'];
    subPageTitleHi = json['sub_page_title_hi'];
    subPageTitleAr = json['sub_page_title_ar'];
    cover = json['cover'];
    image = json['image'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
    footerType = json['footer_type'];
    footerUrlType = json['footer_url_type'];
    customUrl = json['custom_url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['sort_order'] = sortOrder;
    data['page_title'] = pageTitle;
    data['page_title_bn'] = pageTitleBn;
    data['page_title_hi'] = pageTitleHi;
    data['page_title_ar'] = pageTitleAr;
    data['sub_page_title'] = subPageTitle;
    data['sub_page_title_bn'] = subPageTitleBn;
    data['sub_page_title_hi'] = subPageTitleHi;
    data['sub_page_title_ar'] = subPageTitleAr;
    data['cover'] = cover;
    data['image'] = image;
    data['description'] = description;
    data['description_bn'] = descriptionBn;
    data['description_hi'] = descriptionHi;
    data['description_ar'] = descriptionAr;
    data['footer_type'] = footerType;
    data['footer_url_type'] = footerUrlType;
    data['custom_url'] = customUrl;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
