import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> physics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 11',
    subject: 'Physics',
    chapters: [
      Chapter(chapterName: "PHYSICAL WORLD", links: [
        Link(number: 1, link: "keph101".ncert),
      ]),
      Chapter(chapterName: "UNITS AND MEASUREMENTS", links: [
        Link(number: 1, link: "keph102".ncert),
      ]),
      Chapter(chapterName: "MOTION IN A STRAIGHT LINE", links: [
        Link(number: 1, link: "keph103".ncert),
      ]),
      Chapter(chapterName: "MOTION IN A PLANE", links: [
        Link(number: 1, link: "keph104".ncert),
      ]),
      Chapter(chapterName: "LAWS OF MOTION", links: [
        Link(number: 1, link: "keph105".ncert),
      ]),
      Chapter(chapterName: "WORK, ENERGY AND POWER", links: [
        Link(number: 1, link: "keph106".ncert),
      ]),
      Chapter(chapterName: "SYSTEM OF PARTICLES AND ROTATIONAL MOTION", links: [
        Link(number: 1, link: "keph107".ncert),
      ]),
      Chapter(chapterName: "GRAVITATION", links: [
        Link(number: 1, link: "keph108".ncert),
      ]),
      Chapter(chapterName: "MECHANICAL PROPERTIES OF SOLIDS", links: [
        Link(number: 1, link: "keph201".ncert),
      ]),
      Chapter(chapterName: "MECHANICAL PROPERTIES OF FLUIDS", links: [
        Link(number: 1, link: "keph202".ncert),
      ]),
      Chapter(chapterName: "THERMAL PROPERTIES OF MATTER", links: [
        Link(number: 1, link: "keph203".ncert),
      ]),
      Chapter(chapterName: "THERMODYNAMICS", links: [
        Link(number: 1, link: "keph204".ncert),
      ]),
      Chapter(chapterName: "KINETIC THEORY", links: [
        Link(number: 1, link: "keph205".ncert),
      ]),
      Chapter(chapterName: "OSCILLATIONS", links: [
        Link(number: 1, link: "keph206".ncert),
      ]),
      Chapter(chapterName: "WAVES", links: [
        Link(number: 1, link: "keph207".ncert),
      ]),
    ],
  )
];
