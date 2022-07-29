import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> chemistry = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 12',
    subject: 'Chemistry',
    chapters: [
      Chapter(chapterName: "The Solid State", links: [
        Link(number: 1, link: "lech101".ncert),
      ]),
      Chapter(chapterName: "Solutions", links: [
        Link(number: 1, link: "lech102".ncert),
      ]),
      Chapter(chapterName: "Electrochemistry", links: [
        Link(number: 1, link: "lech103".ncert),
      ]),
      Chapter(chapterName: "Chemical Kinetics", links: [
        Link(number: 1, link: "lech104".ncert),
      ]),
      Chapter(chapterName: "Surface Chemistry", links: [
        Link(number: 1, link: "lech105".ncert),
      ]),
      Chapter(
          chapterName:
              "General Principles and Processes of Isolation of Elements",
          links: [
            Link(number: 1, link: "lech106".ncert),
          ]),
      Chapter(chapterName: "The p-Block Elements", links: [
        Link(number: 1, link: "lech107".ncert),
      ]),
      Chapter(chapterName: "The d-and f-Block Elements", links: [
        Link(number: 1, link: "lech108".ncert),
      ]),
      Chapter(chapterName: "Coordination Compounds", links: [
        Link(number: 1, link: "lech109".ncert),
      ]),
      Chapter(chapterName: "Haloalkanes and Haloarenes", links: [
        Link(number: 1, link: "lech201".ncert),
      ]),
      Chapter(chapterName: "Alcohols, Phenols and Ethers", links: [
        Link(number: 1, link: "lech202".ncert),
      ]),
      Chapter(chapterName: "Aldehydes, Ketones and Carboxylic Acids", links: [
        Link(number: 1, link: "lech203".ncert),
      ]),
      Chapter(chapterName: "Amines", links: [
        Link(number: 1, link: "lech204".ncert),
      ]),
      Chapter(chapterName: "Biomolecules", links: [
        Link(number: 1, link: "lech205".ncert),
      ]),
      Chapter(chapterName: "Polymers", links: [
        Link(number: 1, link: "lech206".ncert),
      ]),
      Chapter(chapterName: "Chemistry in Everyday Life", links: [
        Link(number: 1, link: "lech207".ncert),
      ]),
    ],
  )
];
