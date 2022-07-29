import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> science = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 6',
    subject: 'Science',
    chapters: [
      Chapter(chapterName: "FOOD: WHERE DOES IT COME FROM?", links: [
        Link(number: 1, link: "fesc101".ncert),
      ]),
      Chapter(chapterName: "COMPONENTS OF FOOD", links: [
        Link(number: 1, link: "fesc102".ncert),
      ]),
      Chapter(chapterName: "FIBRE TO FABRIC", links: [
        Link(number: 1, link: "fesc103".ncert),
      ]),
      Chapter(chapterName: "SORTING MATERIALS INTO GROUPS", links: [
        Link(number: 1, link: "fesc104".ncert),
      ]),
      Chapter(chapterName: "SEPARATION OF SUBSTANCES", links: [
        Link(number: 1, link: "fesc105".ncert),
      ]),
      Chapter(chapterName: "CHANGES AROUND US", links: [
        Link(number: 1, link: "fesc106".ncert),
      ]),
      Chapter(chapterName: "GETTING TO KNOW PLANTS", links: [
        Link(number: 1, link: "fesc107".ncert),
      ]),
      Chapter(chapterName: "BODY MOVEMENTS", links: [
        Link(number: 1, link: "fesc108".ncert),
      ]),
      Chapter(
          chapterName: "THE LIVING ORGANISMS — CHARACTERISTICS AND HABITATS",
          links: [
            Link(number: 1, link: "fesc109".ncert),
          ]),
      Chapter(chapterName: "MOTION AND MEASUREMENT OF DISTANCES", links: [
        Link(number: 1, link: "fesc110".ncert),
      ]),
      Chapter(chapterName: "LIGHT, SHADOWS AND REFLECTIONS", links: [
        Link(number: 1, link: "fesc111".ncert),
      ]),
      Chapter(chapterName: "ELECTRICITY AND CIRCUITS", links: [
        Link(number: 1, link: "fesc112".ncert),
      ]),
      Chapter(chapterName: "FUN WITH MAGNETS", links: [
        Link(number: 1, link: "fesc113".ncert),
      ]),
      Chapter(chapterName: "WATER", links: [
        Link(number: 1, link: "fesc114".ncert),
      ]),
      Chapter(chapterName: "AIR AROUND US", links: [
        Link(number: 1, link: "fesc115".ncert),
      ]),
      Chapter(chapterName: "GARBAGE IN, GARBAGE OUT", links: [
        Link(number: 1, link: "fesc116".ncert),
      ]),
    ],
  )
];
