import 'package:books_wallah/app/core/extensions.dart';
import 'package:books_wallah/app/data/model/books.dart';
import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:books_wallah/app/data/model/links.dart';

List<Book> maths = [
  Book(
    bookName: "NCERT 2022-2023",
    subject: 'Mathematics',
    className: 'Class 9',
    chapters: [
      Chapter(
        chapterName: 'NUMBER SYSTEMS',
        links: [
          Link(number: 1, link: 'iemh101'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'POLYNOMIALS',
        links: [Link(number: 1, link: 'iemh102'.ncert)],
      ),
      Chapter(
        chapterName: 'COORDINATE GEOMETRY',
        links: [
          Link(number: 1, link: 'iemh103'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'LINEAR EQUATIONS IN TWO VARIABLES ',
        links: [
          Link(number: 1, link: 'iemh104'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'INTRODUCTION TO EUCLID’S GEOMETRY',
        links: [
          Link(number: 1, link: 'iemh105'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'LINES AND ANGLES',
        links: [
          Link(number: 1, link: 'iemh106'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'TRIANGLES',
        links: [
          Link(number: 1, link: 'iemh107'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'QUADRILATERALS',
        links: [
          Link(number: 1, link: 'iemh108'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'AREAS OF PARALLELOGRAMS AND TRIANGLES',
        links: [
          Link(number: 1, link: 'iemh109'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'CIRCLES',
        links: [
          Link(number: 1, link: 'iemh110'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'Constructions',
        links: [
          Link(number: 1, link: 'iemh111'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'HERON’S FORMULA',
        links: [
          Link(number: 1, link: 'iemh112'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'SURFACE AREAS AND VOLUMES',
        links: [
          Link(number: 1, link: 'iemh113'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'STATISTICS',
        links: [
          Link(number: 1, link: 'iemh114'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'PROBABILITY',
        links: [
          Link(number: 1, link: 'iemh115'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'Answers',
        links: [
          Link(number: 1, link: 'iemh1an'.ncert),
        ],
      ),
    ],
  ),
];
