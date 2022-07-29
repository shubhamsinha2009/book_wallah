import 'package:books_wallah/app/core/extensions.dart';
import 'package:books_wallah/app/data/model/books.dart';
import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:books_wallah/app/data/model/links.dart';

List<Book> maths = [
  Book(
    bookName: "NCERT 2022-2023",
    subject: 'Mathematics',
    className: 'Class 6',
    chapters: [
      Chapter(
        chapterName: 'KNOWING OUR NUMBERS',
        links: [
          Link(number: 1, link: 'femh101'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'WHOLE NUMBERS',
        links: [Link(number: 1, link: 'femh102'.ncert)],
      ),
      Chapter(
        chapterName: 'PLAYING WITH NUMBERS',
        links: [
          Link(number: 1, link: 'femh103'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'BASIC GEOMETRICAL IDEAS',
        links: [
          Link(number: 1, link: 'femh104'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'UNDERSTANDING ELEMENTARY SHAPESData Handling',
        links: [
          Link(number: 1, link: 'femh105'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'INTEGERS',
        links: [
          Link(number: 1, link: 'femh106'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'FRACTIONS',
        links: [
          Link(number: 1, link: 'femh107'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'DECIMALS',
        links: [
          Link(number: 1, link: 'femh108'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'DATA HANDLING',
        links: [
          Link(number: 1, link: 'femh109'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'MENSURATION',
        links: [
          Link(number: 1, link: 'femh110'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'ALGEBRA',
        links: [
          Link(number: 1, link: 'femh111'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'RATIO AND PROPORTION',
        links: [
          Link(number: 1, link: 'femh112'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'SYMMETRY',
        links: [
          Link(number: 1, link: 'femh113'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'PRACTICAL GEOMETRY ',
        links: [
          Link(number: 1, link: 'femh114'.ncert),
        ],
      ),
    ],
  ),
];
