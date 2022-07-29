import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> science = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 10',
    subject: 'Science',
    chapters: [
      Chapter(chapterName: "Chemical Reactions and Equations", links: [
        Link(number: 1, link: "jesc101".ncert),
      ]),
      Chapter(chapterName: "Acids, Bases and Salts ", links: [
        Link(number: 1, link: "jesc102".ncert),
      ]),
      Chapter(chapterName: "Metals and Non-metals", links: [
        Link(number: 1, link: "jesc103".ncert),
      ]),
      Chapter(chapterName: "Carbon and its Compounds ", links: [
        Link(number: 1, link: "jesc104".ncert),
      ]),
      Chapter(chapterName: "Periodic Classification of Elements", links: [
        Link(number: 1, link: "jesc105".ncert),
      ]),
      Chapter(chapterName: "Life Processes", links: [
        Link(number: 1, link: "jesc106".ncert),
      ]),
      Chapter(chapterName: "Control and Coordination", links: [
        Link(number: 1, link: "jesc107".ncert),
      ]),
      Chapter(chapterName: "How do Organisms Reproduce?", links: [
        Link(number: 1, link: "jesc108".ncert),
      ]),
      Chapter(chapterName: "Heredity and Evolution", links: [
        Link(number: 1, link: "jesc109".ncert),
      ]),
      Chapter(chapterName: "Light – Reflection and Refraction", links: [
        Link(number: 1, link: "jesc110".ncert),
      ]),
      Chapter(chapterName: "The Human Eye and the Colourful World ", links: [
        Link(number: 1, link: "jesc111".ncert),
      ]),
      Chapter(chapterName: "Electricity", links: [
        Link(number: 1, link: "jesc112".ncert),
      ]),
      Chapter(chapterName: "Magnetic Effects of Electric Current", links: [
        Link(number: 1, link: "jesc113".ncert),
      ]),
      Chapter(chapterName: "Sources of Energy", links: [
        Link(number: 1, link: "jesc114".ncert),
      ]),
      Chapter(chapterName: "Our Environment", links: [
        Link(number: 1, link: "jesc115".ncert),
      ]),
      Chapter(
          chapterName: "Sustainable Management of Natural Resources",
          links: [
            Link(number: 1, link: "jesc116".ncert),
          ]),
      Chapter(chapterName: "Answers", links: [
        Link(number: 1, link: "jesc1an".ncert),
      ]),
    ],
  )
];
