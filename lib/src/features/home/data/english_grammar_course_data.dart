class EnglishGrammarCourseData {
  final String id, title, youtubeLink, thumbnail, shortDescription;

  EnglishGrammarCourseData({
    required this.id,
    required this.title,
    required this.youtubeLink,
    required this.thumbnail,
    required this.shortDescription,
  });

  factory EnglishGrammarCourseData.fromJson(Map<String, dynamic> json) {
    return EnglishGrammarCourseData(
      id: json['id'],
      title: json['title'],
      youtubeLink: json['youtubeLink'],
      thumbnail: json['thumbnail'],
      shortDescription: json['shortDescription'],
    );
  }
}

final List<EnglishGrammarCourseData> englishGrammarCourseData = [
  EnglishGrammarCourseData(
    id: '01',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/dummy_img/Daily-Talks-medium-1024x576.png',
    youtubeLink: "https://www.youtube.com/watch?v=i-z3hkSU_vY&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=59",
    shortDescription: "The meaning of DESCRIPTION is an act of describing; specifically.",
  ),
  EnglishGrammarCourseData(
    id: '02',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/dummy_img/gammmar-basic-1024x576.png',
    youtubeLink: "https://www.youtube.com/watch?v=bHeHZxnA3dE&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=57",
    shortDescription: "The meaning of DESCRIPTION is an act of describing; specifically.",
  ),
  EnglishGrammarCourseData(
    id: '03',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/dummy_img/Live-Practice-1024x576.png',
    youtubeLink: """https://www.youtube.com/watch?v=nlUzB3O1WrA&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=55""",
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
  EnglishGrammarCourseData(
    id: '04',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/dummy_img/Daily-Talks-basic.png',
    youtubeLink: """https://www.youtube.com/watch?v=grLU1XC1PDo&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=53""",
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
  EnglishGrammarCourseData(
    id: '05',
    title: 'Description Definition & Meaning',
    thumbnail: 'assets/dummy_img/course-1024x576.png',
    youtubeLink: """https://www.youtube.com/watch?v=4ReQjxJEhHo&list=PLY6ZzoZt9su0l1-wJSj659Du3j3DqllY2&index=52""",
    shortDescription: """The meaning of DESCRIPTION is an act of describing; specifically.""",
  ),
];
