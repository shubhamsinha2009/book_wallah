import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> geography = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 9',
    subject: 'GEOGRAPHY',
    chapters: [
      Chapter(chapterName: "India – Size and Location", links: [
        Link(number: 1, link: "iess101".ncert),
      ]),
      Chapter(chapterName: "Physical Features of India", links: [
        Link(number: 1, link: "iess102".ncert),
      ]),
      Chapter(chapterName: "Drainage", links: [
        Link(number: 1, link: "iess103".ncert),
      ]),
      Chapter(chapterName: "Climate", links: [
        Link(number: 1, link: "iess104".ncert),
      ]),
      Chapter(chapterName: "Natural Vegetation and Wildlife", links: [
        Link(number: 1, link: "iess105".ncert),
      ]),
      Chapter(chapterName: "Population", links: [
        Link(number: 1, link: "iess106".ncert),
      ]),
    ],
  ),
];
