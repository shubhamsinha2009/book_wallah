import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> civics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 9',
    subject: 'CIVICS',
    chapters: [
      Chapter(chapterName: "What is Democracy? Why Democracy?", links: [
        Linkurl(number: 1, link: "iess401".ncert),
      ]),
      Chapter(chapterName: "Constitutional Design", links: [
        Linkurl(number: 1, link: "iess402".ncert),
      ]),
      Chapter(chapterName: "Electoral Politics", links: [
        Linkurl(number: 1, link: "iess403".ncert),
      ]),
      Chapter(chapterName: "Working of Institutions", links: [
        Linkurl(number: 1, link: "iess404".ncert),
      ]),
      Chapter(chapterName: "Democratic Rights", links: [
        Linkurl(number: 1, link: "iess405".ncert),
      ]),
    ],
  ),
];
