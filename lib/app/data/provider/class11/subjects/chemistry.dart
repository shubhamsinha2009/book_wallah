import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> chemistry = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 11',
    subject: 'Chemistry',
    chapters: [
      Chapter(chapterName: "SOME BASIC CONCEPTS OF CHEMISTRY", links: [
        Link(number: 1, link: "lech101".ncert),
      ]),
      Chapter(chapterName: "STRUCTURE OF ATOM", links: [
        Link(number: 1, link: "lech102".ncert),
      ]),
      Chapter(
          chapterName:
              "CLASSIFICATION OF ELEMENTS AND PERIODICITY IN PROPERTIES",
          links: [
            Link(number: 1, link: "lech103".ncert),
          ]),
      Chapter(chapterName: "CHEMICAL BONDING AND MOLECULAR STRUCTURE", links: [
        Link(number: 1, link: "lech104".ncert),
      ]),
      Chapter(chapterName: "STATES OF MATTER", links: [
        Link(number: 1, link: "lech105".ncert),
      ]),
      Chapter(chapterName: "THERMODYNAMICS", links: [
        Link(number: 1, link: "lech106".ncert),
      ]),
      Chapter(chapterName: "EQUILIBRIUM", links: [
        Link(number: 1, link: "lech107".ncert),
      ]),
      Chapter(chapterName: "Redox Reactions", links: [
        Link(number: 1, link: "lech201".ncert),
      ]),
      Chapter(chapterName: "Hydrogen", links: [
        Link(number: 1, link: "lech202".ncert),
      ]),
      Chapter(chapterName: "The s-Block Elements", links: [
        Link(number: 1, link: "lech203".ncert),
      ]),
      Chapter(chapterName: "The p-Block Elements", links: [
        Link(number: 1, link: "lech204".ncert),
      ]),
      Chapter(
          chapterName:
              "Organic Chemistry – Some Basic Principles and Techniques",
          links: [
            Link(number: 1, link: "lech205".ncert),
          ]),
      Chapter(chapterName: "Hydrocarbons", links: [
        Link(number: 1, link: "lech206".ncert),
      ]),
      Chapter(chapterName: "Environmental Chemistry", links: [
        Link(number: 1, link: "lech207".ncert),
      ]),
    ],
  )
];
