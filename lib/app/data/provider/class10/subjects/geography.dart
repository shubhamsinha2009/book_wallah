import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> geography = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 10',
    subject: 'GEOGRAPHY',
    chapters: [
      Chapter(chapterName: "Resources and Development", links: [
        Link(number: 1, link: "jess101".ncert),
      ]),
      Chapter(chapterName: "Forest and Wildlife Resources", links: [
        Link(number: 1, link: "jess102".ncert),
      ]),
      Chapter(chapterName: "Water Resources", links: [
        Link(number: 1, link: "jess103".ncert),
      ]),
      Chapter(chapterName: "Agriculture", links: [
        Link(number: 1, link: "jess104".ncert),
      ]),
      Chapter(chapterName: "Minerals and Energy Resources", links: [
        Link(number: 1, link: "jess105".ncert),
      ]),
      Chapter(chapterName: "Manufacturing Industries", links: [
        Link(number: 1, link: "jess106".ncert),
      ]),
      Chapter(chapterName: "Lifelines of National Economy", links: [
        Link(number: 1, link: "jess107".ncert),
      ]),
    ],
  ),
];
