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
          Linkurl(number: 1, link: 'femh101'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'WHOLE NUMBERS',
        links: [Linkurl(number: 1, link: 'femh102'.ncert)],
      ),
      Chapter(
        chapterName: 'PLAYING WITH NUMBERS',
        links: [
          Linkurl(number: 1, link: 'femh103'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'BASIC GEOMETRICAL IDEAS',
        links: [
          Linkurl(number: 1, link: 'femh104'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'UNDERSTANDING ELEMENTARY SHAPESData Handling',
        links: [
          Linkurl(number: 1, link: 'femh105'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'INTEGERS',
        links: [
          Linkurl(number: 1, link: 'femh106'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'FRACTIONS',
        links: [
          Linkurl(number: 1, link: 'femh107'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'DECIMALS',
        links: [
          Linkurl(number: 1, link: 'femh108'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'DATA HANDLING',
        links: [
          Linkurl(number: 1, link: 'femh109'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'MENSURATION',
        links: [
          Linkurl(number: 1, link: 'femh110'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'ALGEBRA',
        links: [
          Linkurl(number: 1, link: 'femh111'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'RATIO AND PROPORTION',
        links: [
          Linkurl(number: 1, link: 'femh112'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'SYMMETRY',
        links: [
          Linkurl(number: 1, link: 'femh113'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'PRACTICAL GEOMETRY ',
        links: [
          Linkurl(number: 1, link: 'femh114'.ncert),
        ],
      ),
    ],
  ),
  Book(
    bookName: "NCERT EXEMPLAR",
    subject: 'Mathematics',
    className: 'Class 6',
    chapters: [
      Chapter(
        chapterName: 'NUMBER SYSTEM',
        links: [
          Linkurl(number: 1, link: '01'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'GEOMETRY',
        links: [Linkurl(number: 1, link: '02'.class6mathsexemplar)],
      ),
      Chapter(
        chapterName: 'INTEGERS',
        links: [
          Linkurl(number: 1, link: '03'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'Fractions & Decimals',
        links: [
          Linkurl(number: 1, link: '04'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'Data Handling',
        links: [
          Linkurl(number: 1, link: '05'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'MENSURATION',
        links: [
          Linkurl(number: 1, link: '06'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'ALGEBRA',
        links: [
          Linkurl(number: 1, link: '07'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'RATIO AND PROPORTION',
        links: [
          Linkurl(number: 1, link: '08'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'SYMMETRY & PRACTICAL GEOMETRY',
        links: [
          Linkurl(number: 1, link: '09'.class6mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'Answer',
        links: [
          Linkurl(number: 1, link: 'an'.class6mathsexemplar),
        ],
      ),
    ],
  ),
];
