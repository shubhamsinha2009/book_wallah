import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> geography = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 8',
    subject: 'GEOGRAPHY',
    chapters: [
      Chapter(chapterName: "Resources", links: [
        Linkurl(number: 1, link: "hess101".ncert),
      ]),
      Chapter(
          chapterName:
              "Land, Soil, Water, Natural Vegetation and Wildlife Resources",
          links: [
            Linkurl(number: 1, link: "hess102".ncert),
          ]),
      Chapter(chapterName: "Mineral and Power Resources", links: [
        Linkurl(number: 1, link: "hess103".ncert),
      ]),
      Chapter(chapterName: "Agriculture", links: [
        Linkurl(number: 1, link: "hess104".ncert),
      ]),
      Chapter(chapterName: "Industries", links: [
        Linkurl(number: 1, link: "hess105".ncert),
      ]),
      Chapter(chapterName: "Human Resources", links: [
        Linkurl(number: 1, link: "hess106".ncert),
      ]),
    ],
  ),
];
