import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> economics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 10',
    subject: 'ECONOMICS',
    chapters: [
      Chapter(chapterName: "DEVELOPMENT", links: [
        Linkurl(number: 1, link: "jess201".ncert),
      ]),
      Chapter(chapterName: "SECTORS OF THE INDIAN ECONOMY", links: [
        Linkurl(number: 1, link: "jess202".ncert),
      ]),
      Chapter(chapterName: "MONEY AND CREDIT", links: [
        Linkurl(number: 1, link: "jess203".ncert),
      ]),
      Chapter(chapterName: "GLOBALISATION AND THE INDIAN ECONOMY", links: [
        Linkurl(number: 1, link: "jess204".ncert),
      ]),
      Chapter(chapterName: "CONSUMER RIGHTS", links: [
        Linkurl(number: 1, link: "jess205".ncert),
      ]),
    ],
  ),
];
