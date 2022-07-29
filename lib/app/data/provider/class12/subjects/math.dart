import 'package:books_wallah/app/core/extensions.dart';
import 'package:books_wallah/app/data/model/books.dart';
import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:books_wallah/app/data/model/links.dart';

//TODO: Neha Mam Pdfs
//TODO: vedantu , etc
List<Book> maths = [
  Book(
    bookName: "NCERT 2022-2023",
    subject: 'Mathematics',
    className: 'Class 12',
    chapters: [
      Chapter(
        chapterName: 'Relations and Functions',
        links: [
          Link(number: 1, link: 'lemh101'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'Inverse Trigonometric Functions',
        links: [Link(number: 1, link: 'lemh102'.ncert)],
      ),
      Chapter(
        chapterName: 'Matrices',
        links: [Link(number: 1, link: 'lemh103'.ncert)],
      ),
      Chapter(
        chapterName: 'Determinants',
        links: [Link(number: 1, link: 'lemh104'.ncert)],
      ),
      Chapter(
        chapterName: 'Continuity and Differentiability',
        links: [Link(number: 1, link: 'lemh105'.ncert)],
      ),
      Chapter(
        chapterName: 'Application of Derivatives',
        links: [Link(number: 1, link: 'lemh106'.ncert)],
      ),
      Chapter(
        chapterName: 'Integrals',
        links: [Link(number: 1, link: 'lemh201'.ncert)],
      ),
      Chapter(
        chapterName: 'Application of Integrals',
        links: [Link(number: 1, link: 'lemh202'.ncert)],
      ),
      Chapter(
        chapterName: 'Differential Equations',
        links: [Link(number: 1, link: 'lemh203'.ncert)],
      ),
      Chapter(
        chapterName: 'Vector Algebra',
        links: [Link(number: 1, link: 'lemh204'.ncert)],
      ),
      Chapter(
        chapterName: 'Three Dimensional Geometry',
        links: [Link(number: 1, link: 'lemh205'.ncert)],
      ),
      Chapter(
        chapterName: 'Linear Programming',
        links: [Link(number: 1, link: 'lemh206'.ncert)],
      ),
      Chapter(
        chapterName: 'Probability',
        links: [Link(number: 1, link: 'lemh207'.ncert)],
      ),
    ],
  ),
];
