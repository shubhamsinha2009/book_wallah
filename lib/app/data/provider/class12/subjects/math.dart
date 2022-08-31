import 'package:books_wallah/app/core/extensions.dart';
import 'package:books_wallah/app/data/model/books.dart';
import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:books_wallah/app/data/model/links.dart';

List<Book> maths = [
  Book(
    bookName: "NCERT 2022-2023",
    subject: 'Mathematics',
    className: 'Class 12',
    chapters: [
      Chapter(
        chapterName: 'Relations and Functions',
        links: [
          Linkurl(number: 1, link: 'lemh101'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'Inverse Trigonometric Functions',
        links: [Linkurl(number: 1, link: 'lemh102'.ncert)],
      ),
      Chapter(
        chapterName: 'Matrices',
        links: [Linkurl(number: 1, link: 'lemh103'.ncert)],
      ),
      Chapter(
        chapterName: 'Determinants',
        links: [Linkurl(number: 1, link: 'lemh104'.ncert)],
      ),
      Chapter(
        chapterName: 'Continuity and Differentiability',
        links: [Linkurl(number: 1, link: 'lemh105'.ncert)],
      ),
      Chapter(
        chapterName: 'Application of Derivatives',
        links: [Linkurl(number: 1, link: 'lemh106'.ncert)],
      ),
      Chapter(
        chapterName: 'Integrals',
        links: [Linkurl(number: 1, link: 'lemh201'.ncert)],
      ),
      Chapter(
        chapterName: 'Application of Integrals',
        links: [Linkurl(number: 1, link: 'lemh202'.ncert)],
      ),
      Chapter(
        chapterName: 'Differential Equations',
        links: [Linkurl(number: 1, link: 'lemh203'.ncert)],
      ),
      Chapter(
        chapterName: 'Vector Algebra',
        links: [Linkurl(number: 1, link: 'lemh204'.ncert)],
      ),
      Chapter(
        chapterName: 'Three Dimensional Geometry',
        links: [Linkurl(number: 1, link: 'lemh205'.ncert)],
      ),
      Chapter(
        chapterName: 'Linear Programming',
        links: [Linkurl(number: 1, link: 'lemh206'.ncert)],
      ),
      Chapter(
        chapterName: 'Probability',
        links: [Linkurl(number: 1, link: 'lemh207'.ncert)],
      ),
    ],
  ),
  Book(
    bookName: "NCERT EXEMPLAR",
    subject: 'Mathematics',
    className: 'Class 12',
    chapters: [
      Chapter(
        chapterName: 'Relations and Functions',
        links: [
          Linkurl(number: 1, link: '01'.class12mathsexemplar),
        ],
      ),
      Chapter(
        chapterName: 'Inverse Trigonometric Functions',
        links: [Linkurl(number: 1, link: '02'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Matrices',
        links: [Linkurl(number: 1, link: '03'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Determinants',
        links: [Linkurl(number: 1, link: '04'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Continuity and Differentiability',
        links: [Linkurl(number: 1, link: '05'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Application of Derivatives',
        links: [Linkurl(number: 1, link: '06'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Integrals',
        links: [Linkurl(number: 1, link: '07'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Application of Integrals',
        links: [Linkurl(number: 1, link: '08'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Differential Equations',
        links: [Linkurl(number: 1, link: '09'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Vector Algebra',
        links: [Linkurl(number: 1, link: '10'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Three Dimensional Geometry',
        links: [Linkurl(number: 1, link: '11'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Linear Programming',
        links: [Linkurl(number: 1, link: '12'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Probability',
        links: [Linkurl(number: 1, link: '13'.class12mathsexemplar)],
      ),
      Chapter(
        chapterName: 'Answer',
        links: [Linkurl(number: 1, link: '16'.class12mathsexemplar)],
      ),
    ],
  ),
];
