
import '../../../global/constants/enum.dart';

enum AppConfig {
  base,
  baseImage,
  logInUrl,
  registrationUrl,
  subscribersMeUrl,
  logOutUrl,

  /// ==========/@ Home Controller @/==========
  homeSlidersUrl,
  homeSectionUrl,
  homeSectionRecentUrl,
  homeSectionGenresUrl,
  homeSectionUpComingUrl,
  homeSectionAllMovieUrl,
  homeSectionAllSeriesUrl,
  homeSectionTopMovieUrl,
  homeSectionTopSeriesUrl,
  homeSectionApplicationFeaturesUrl,
  homeSectionBlogsUrl,

  footerExploreUrl,
  footerPopularSeriesUrl,
  footerPopularMoviesUrl,
  footerCompanyUrl,

  /// ==========/@ Account Controller @/==========
  languageListUrl,
  watchListUrl,
  watchHistoryUrl,
  homeUpComingUrl,
  subscriptionUrl,
  allSubscriptionUrl,
  allSubscriptionPaginationUrl,
  subscriptionPlanListUrl,
  subscriberListUrl,
  subscriberPaginationUrl,
  subscriberUrl,
  subscriptionEnrollMeUrl,

  /// ==========/@ Tab Controller @/==========
  genresListUrl,
  movieTabViewIndustriesUrl,
  freeTabViewUrl,
  freeTabViewSeeAllUrl,

  /// ==========/@ Video Details Controller @/==========
  createWatchListUrl,

  /// ==========/@ Search Controller @/==========
  searchUrl,
  searchPopularUrl,

}

extension AppUrlExtention on AppConfig {
  static String _baseUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";

        break;
      case UrlLink.isDev:
        _baseUrl = "https://api.softwarezoneltd.com/api";

        break;
      case UrlLink.isLocalServer:
        _baseUrl = "";

        break;

    }
  }

  String get url {
    switch (this) {
      case AppConfig.base:
        return _baseUrl;
      case AppConfig.baseImage:
        return "";

    /// ==========/@ Auth Api Url @/==========
      case AppConfig.logInUrl:
        return '/subscribers/login';
      case AppConfig.registrationUrl:
        return '/subscribers/register';
      case AppConfig.subscribersMeUrl:
        return '/subscribers/me';
      case AppConfig.logOutUrl:
        return '/subscribers/logout';

    /// ==========/@ Home Controller @/==========
      case AppConfig.homeSlidersUrl:
        return '/sliders/client';
      case AppConfig.homeSectionUrl:
        return '/home-sections/client';
      case AppConfig.homeSectionRecentUrl:
        return '/home-section-details/recent';
      case AppConfig.homeSectionGenresUrl:
        return '/home-section-details/client';
      case AppConfig.homeSectionUpComingUrl:
        return '/home-section-details/upcoming';
      case AppConfig.homeSectionAllMovieUrl:
        return '/movies/client';
      case AppConfig.homeSectionAllSeriesUrl:
        return '/series/client';
      case AppConfig.homeSectionTopMovieUrl:
        return '/home-section-details/top_movies';
      case AppConfig.homeSectionTopSeriesUrl:
        return '/home-section-details/top_series';
      case AppConfig.homeSectionApplicationFeaturesUrl:
        return '/application-features/client';
      case AppConfig.homeSectionBlogsUrl:
        return '/blogs/client/pages';

      case AppConfig.footerExploreUrl:
        return'/footer/footer-type/explore';
      case AppConfig.footerPopularSeriesUrl:
        return'/footer/footer-type/popular_series';
      case AppConfig.footerPopularMoviesUrl:
        return'/footer/footer-type/popular_movies';
      case AppConfig.footerCompanyUrl:
        return'/footer/footer-type/company';

    /// ==========/@ Account Controller @/==========
      case AppConfig.languageListUrl:
        return '/languages/client';
      case AppConfig.watchListUrl:
        return '/watch-list';
      case AppConfig.watchHistoryUrl:
        return '/watch-history/1';
      case AppConfig.subscriptionUrl:
        return'/subscriptions';
      case AppConfig.allSubscriptionUrl:
        return'/subscriptions';
      case AppConfig.allSubscriptionPaginationUrl:
        return'/subscriptions/pagination';
      case AppConfig.subscriptionPlanListUrl:
        return'/plans/client';
      case AppConfig.subscriberListUrl:
        return'/subscribers';
      case AppConfig.subscriberPaginationUrl:
        return'/subscribers/pagination';
      case AppConfig.subscriberUrl:
        return'/subscribers/12';
      case AppConfig.subscriptionEnrollMeUrl:
        return'/subscriptions/me';


    /// ==========/@ Tab Controller @/==========
      case AppConfig.genresListUrl:
        return"/genres/client";
      case AppConfig.movieTabViewIndustriesUrl:
        return"/industries/client";
      case AppConfig.freeTabViewUrl:
        return"/free-content/client";
      case AppConfig.freeTabViewSeeAllUrl:
        return"/free-content/pages/client";


    /// ==========/@ Video Details Controller @/==========
      case AppConfig.createWatchListUrl:
        return '/watch-list';


    /// ==========/@ Search Controller @/==========
      case AppConfig.searchUrl:
        return '/search';
      case AppConfig.searchPopularUrl:
        return '/search/popular';

      default:
    }
    return "";
  }
}

