import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> history = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 8',
    subject: 'HISTORY',
    chapters: [
      Chapter(chapterName: "How, When and Where", links: [
        Linkurl(number: 1, link: "hess201".ncert),
      ]),
      Chapter(
          chapterName: "From Trade to Territory The Company Establishes Power",
          links: [
            Linkurl(number: 1, link: "hess202".ncert),
          ]),
      Chapter(chapterName: "Ruling the Countryside", links: [
        Linkurl(number: 1, link: "hess203".ncert),
      ]),
      Chapter(
          chapterName: "Tribals, Dikus and the Vision of a Golden Age",
          links: [
            Linkurl(number: 1, link: "hess204".ncert),
          ]),
      Chapter(chapterName: "When People Rebel 1857 and After", links: [
        Linkurl(number: 1, link: "hess205".ncert),
      ]),
      Chapter(chapterName: "Weavers, Iron Smelters and Factory Owners", links: [
        Linkurl(number: 1, link: "hess206".ncert),
      ]),
      Chapter(
          chapterName: "Civilising the “Native”, Educating the Nation",
          links: [
            Linkurl(number: 1, link: "hess207".ncert),
          ]),
      Chapter(chapterName: "Women, Caste and Reform", links: [
        Linkurl(number: 1, link: "hess208".ncert),
      ]),
      Chapter(
          chapterName: "The Making of the National Movement: 1870s--1947",
          links: [
            Linkurl(number: 1, link: "hess209".ncert),
          ]),
      Chapter(chapterName: "India After Independence", links: [
        Linkurl(number: 1, link: "hess210".ncert),
      ]),
    ],
  ),
];
