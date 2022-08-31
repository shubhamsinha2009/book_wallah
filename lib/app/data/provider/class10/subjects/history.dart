import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> history = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 10',
    subject: 'HISTORY',
    chapters: [
      Chapter(chapterName: "The Rise of Nationalism in Europe", links: [
        Linkurl(number: 1, link: "jess301".ncert),
      ]),
      Chapter(chapterName: "Nationalism in India", links: [
        Linkurl(number: 1, link: "jess302".ncert),
      ]),
      Chapter(chapterName: "The Making of Global World", links: [
        Linkurl(number: 1, link: "jess303".ncert),
      ]),
      Chapter(chapterName: "The Age of Industrialisation", links: [
        Linkurl(number: 1, link: "jess304".ncert),
      ]),
      Chapter(chapterName: "Print Culture and the Modern World", links: [
        Linkurl(number: 1, link: "jess305".ncert),
      ]),
    ],
  ),
];
