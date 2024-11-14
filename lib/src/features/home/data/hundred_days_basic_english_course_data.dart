class HundredDaysBasicEnglishCourseData {
  final String id, title, youtubeLink, thumbnail, shortDescription;

  HundredDaysBasicEnglishCourseData({
    required this.id,
    required this.title,
    required this.youtubeLink,
    required this.thumbnail,
    required this.shortDescription,
  });

  factory HundredDaysBasicEnglishCourseData.fromJson(Map<String, dynamic> json) {
    return HundredDaysBasicEnglishCourseData(
      id: json['id'],
      title: json['title'],
      youtubeLink: json['youtubeLink'],
      thumbnail: json['thumbnail'],
      shortDescription: json['shortDescription'],
    );
  }
}

final List<HundredDaysBasicEnglishCourseData> hundredDaysBasicEnglishCourseData = [
  HundredDaysBasicEnglishCourseData(
    id: '01',
    title: 'Day 1/100, Basic Spoken English Practice Class for Beginners',
    thumbnail: 'assets/dummy_img/Daily-Talks-medium-1024x576.png',
    youtubeLink: 'https://www.youtube.com/watch?v=i-z3hkSU_vY&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=59',
    shortDescription: "The meaning of DESCRIPTION is an act of describing; specifically.",
  ),
  HundredDaysBasicEnglishCourseData(
    id: '02',
    title: 'Day 2/100, Basic Spoken English Practice Class for Beginners',
    thumbnail: 'assets/dummy_img/gammmar-basic-1024x576.png',
    youtubeLink: 'https://www.youtube.com/watch?v=bHeHZxnA3dE&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=57',
    shortDescription: "The meaning of DESCRIPTION is an act of describing; specifically.",
  ),
  HundredDaysBasicEnglishCourseData(
    id: '03',
    title: 'Day 3/100, Basic Spoken English Practice Class for Beginners',
    thumbnail: 'assets/dummy_img/Live-Practice-1024x576.png',
    youtubeLink: 'https://www.youtube.com/watch?v=nlUzB3O1WrA&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=55',
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
  HundredDaysBasicEnglishCourseData(
    id: '04',
    title: 'Day 4/100, Basic Spoken English Practice Class for Beginners',
    thumbnail: 'assets/dummy_img/Daily-Talks-basic.png',
    youtubeLink: 'https://www.youtube.com/watch?v=grLU1XC1PDo&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=53',
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
  HundredDaysBasicEnglishCourseData(
    id: '05',
    title: 'Day 5/100, Basic Spoken English Practice Class for Beginners',
    thumbnail: 'assets/dummy_img/course-1024x576.png',
    youtubeLink: 'https://www.youtube.com/watch?v=4ReQjxJEhHo&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=52',
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
];