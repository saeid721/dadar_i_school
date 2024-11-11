
class BasicEnglishCourseData {
  final String id, title, videoUrl, thumbnail, shortDescription;

  BasicEnglishCourseData({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnail,
    required this.shortDescription,
  });
}

final List<BasicEnglishCourseData> basicEnglishCourseData = [
  BasicEnglishCourseData(
    id: '01',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/app_src/texture.jpg',
    videoUrl: """https://www.youtube.com/watch?v=xHZeSySUFR0""",
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
  BasicEnglishCourseData(
    id: '02',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/app_src/texture.jpg',
    videoUrl: """https://www.youtube.com/watch?v=xHZeSySUFR0""",
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
  BasicEnglishCourseData(
    id: '03',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/app_src/texture.jpg',
    videoUrl: """https://www.youtube.com/watch?v=xHZeSySUFR0""",
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
];
