import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> civics = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 8',
    subject: 'CIVICS',
    chapters: [
      Chapter(chapterName: "The Indian Constitution", links: [
        Link(number: 1, link: "hess301".ncert),
      ]),
      Chapter(chapterName: "Understanding Secularism", links: [
        Link(number: 1, link: "hess302".ncert),
      ]),
      Chapter(chapterName: "Why do we need a Parliament?", links: [
        Link(number: 1, link: "hess303".ncert),
      ]),
      Chapter(chapterName: "Understanding Laws", links: [
        Link(number: 1, link: "hess304".ncert),
      ]),
      Chapter(chapterName: "Judiciary", links: [
        Link(number: 1, link: "hess305".ncert),
      ]),
      Chapter(chapterName: "Understanding Our Criminal Justice System", links: [
        Link(number: 1, link: "hess306".ncert),
      ]),
      Chapter(chapterName: "Understanding Marginalisation", links: [
        Link(number: 1, link: "hess307".ncert),
      ]),
      Chapter(chapterName: "Confronting Marginalisation", links: [
        Link(number: 1, link: "hess308".ncert),
      ]),
      Chapter(chapterName: "Public Facilities", links: [
        Link(number: 1, link: "hess309".ncert),
      ]),
      Chapter(chapterName: "Law and Social Justice", links: [
        Link(number: 1, link: "hess310".ncert),
      ]),
    ],
  ),
];
