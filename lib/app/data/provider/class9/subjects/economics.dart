import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> economics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 9',
    subject: 'ECONOMICS',
    chapters: [
      Chapter(chapterName: "The Story of Village Palampur", links: [
        Linkurl(number: 1, link: "iess201".ncert),
      ]),
      Chapter(chapterName: "People as Resource", links: [
        Linkurl(number: 1, link: "iess202".ncert),
      ]),
      Chapter(chapterName: "Poverty as a Challenge", links: [
        Linkurl(number: 1, link: "iess203".ncert),
      ]),
      Chapter(chapterName: "Food Security in India", links: [
        Linkurl(number: 1, link: "iess204".ncert),
      ]),
    ],
  ),
];
