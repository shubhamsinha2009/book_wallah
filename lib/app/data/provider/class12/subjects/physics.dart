import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> physics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 12',
    subject: 'Physics',
    chapters: [
      Chapter(chapterName: "ELECTRIC CHARGES AND FIELDS", links: [
        Link(number: 1, link: "leph101".ncert),
      ]),
      Chapter(chapterName: "ELECTROSTATIC POTENTIAL AND CAPACITANCE", links: [
        Link(number: 1, link: "leph102".ncert),
      ]),
      Chapter(chapterName: "CURRENT ELECTRICITY", links: [
        Link(number: 1, link: "leph103".ncert),
      ]),
      Chapter(chapterName: "MOVING CHARGES AND MAGNETISM", links: [
        Link(number: 1, link: "leph104".ncert),
      ]),
      Chapter(chapterName: "MAGNETISM AND MATTER", links: [
        Link(number: 1, link: "leph105".ncert),
      ]),
      Chapter(chapterName: "ELECTROMAGNETIC INDUCTION", links: [
        Link(number: 1, link: "leph106".ncert),
      ]),
      Chapter(chapterName: "ALTERNATING CURRENT", links: [
        Link(number: 1, link: "leph107".ncert),
      ]),
      Chapter(chapterName: "ELECTROMAGNETIC WAVES", links: [
        Link(number: 1, link: "leph108".ncert),
      ]),
      Chapter(chapterName: "RAY OPTICS AND OPTICAL INSTRUMENTS", links: [
        Link(number: 1, link: "leph201".ncert),
      ]),
      Chapter(chapterName: "WAVE OPTICS", links: [
        Link(number: 1, link: "leph202".ncert),
      ]),
      Chapter(chapterName: "DUAL NATURE OF RADIATION AND MATTER", links: [
        Link(number: 1, link: "leph203".ncert),
      ]),
      Chapter(chapterName: "ATOMS", links: [
        Link(number: 1, link: "leph204".ncert),
      ]),
      Chapter(chapterName: "NUCLEI", links: [
        Link(number: 1, link: "leph205".ncert),
      ]),
      Chapter(
          chapterName:
              "SEMICONDUCTOR ELECTRONICS: MATERIALS, DEVICES AND SIMPLE CIRCUITS",
          links: [
            Link(number: 1, link: "leph206".ncert),
          ]),
    ],
  )
];
