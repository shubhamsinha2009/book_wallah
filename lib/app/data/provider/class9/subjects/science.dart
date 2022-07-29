import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> science = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 9',
    subject: 'Science',
    chapters: [
      Chapter(chapterName: "MATTER IN OUR SURROUNDINGS", links: [
        Link(number: 1, link: "iesc101".ncert),
      ]),
      Chapter(chapterName: "IS MATTER AROUND US PURE?", links: [
        Link(number: 1, link: "iesc102".ncert),
      ]),
      Chapter(chapterName: "ATOMS AND MOLECULES", links: [
        Link(number: 1, link: "iesc103".ncert),
      ]),
      Chapter(chapterName: "STRUCTURE OF THE ATOM", links: [
        Link(number: 1, link: "iesc104".ncert),
      ]),
      Chapter(chapterName: "THE FUNDAMENTAL UNIT OF LIFE", links: [
        Link(number: 1, link: "iesc105".ncert),
      ]),
      Chapter(chapterName: "TISSUES", links: [
        Link(number: 1, link: "iesc106".ncert),
      ]),
      Chapter(chapterName: "DIVERSITY IN LIVING ORGANISMS", links: [
        Link(number: 1, link: "iesc107".ncert),
      ]),
      Chapter(chapterName: "MOTION", links: [
        Link(number: 1, link: "iesc108".ncert),
      ]),
      Chapter(chapterName: "FORCE AND LAWS OF MOTION", links: [
        Link(number: 1, link: "iesc109".ncert),
      ]),
      Chapter(chapterName: "GRAVITATION", links: [
        Link(number: 1, link: "iesc110".ncert),
      ]),
      Chapter(chapterName: "WORK AND ENERGY", links: [
        Link(number: 1, link: "iesc111".ncert),
      ]),
      Chapter(chapterName: "SOUND", links: [
        Link(number: 1, link: "iesc112".ncert),
      ]),
      Chapter(chapterName: "WHY DO WE FALL ILL?", links: [
        Link(number: 1, link: "iesc113".ncert),
      ]),
      Chapter(chapterName: "NATURAL RESOURCES", links: [
        Link(number: 1, link: "iesc114".ncert),
      ]),
      Chapter(chapterName: "IMPROVEMENT IN FOOD RESOURCES", links: [
        Link(number: 1, link: "iesc115".ncert),
      ]),
      Chapter(chapterName: "Answers", links: [
        Link(number: 1, link: "iesc1an".ncert),
      ]),
    ],
  )
];
