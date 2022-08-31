import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> civics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 10',
    subject: 'CIVICS',
    chapters: [
      Chapter(chapterName: "Power Sharing", links: [
        Linkurl(number: 1, link: "jess401".ncert),
      ]),
      Chapter(chapterName: "Federalism", links: [
        Linkurl(number: 1, link: "jess402".ncert),
      ]),
      Chapter(chapterName: "Democracy and Diversity", links: [
        Linkurl(number: 1, link: "jess403".ncert),
      ]),
      Chapter(chapterName: "Gender Religion and Caste", links: [
        Linkurl(number: 1, link: "jess404".ncert),
      ]),
      Chapter(chapterName: "Popular Struggles and Movements", links: [
        Linkurl(number: 1, link: "jess405".ncert),
      ]),
      Chapter(chapterName: "Political Parties", links: [
        Linkurl(number: 1, link: "jess406".ncert),
      ]),
      Chapter(chapterName: "Outcomes of Democracy", links: [
        Linkurl(number: 1, link: "jess407".ncert),
      ]),
      Chapter(chapterName: "Challenges to Democracy", links: [
        Linkurl(number: 1, link: "jess408".ncert),
      ]),
    ],
  ),
];
