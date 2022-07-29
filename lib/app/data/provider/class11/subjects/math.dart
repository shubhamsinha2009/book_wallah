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
    className: 'Class 11',
    chapters: [
      Chapter(
        chapterName: 'Sets',
        links: [
          Link(number: 1, link: 'kemh101'.ncert),
        ],
      ),
      Chapter(
        chapterName: 'Relations and Functions',
        links: [Link(number: 1, link: 'kemh102'.ncert)],
      ),
      Chapter(
        chapterName: 'Trigonometric Functions',
        links: [Link(number: 1, link: 'kemh103'.ncert)],
      ),
      Chapter(
        chapterName: 'Principle of Mathematical Induction',
        links: [Link(number: 1, link: 'kemh104'.ncert)],
      ),
      Chapter(
        chapterName: 'Complex Numbers and Quadratic Equations',
        links: [Link(number: 1, link: 'kemh105'.ncert)],
      ),
      Chapter(
        chapterName: 'Linear Inequalities',
        links: [Link(number: 1, link: 'kemh106'.ncert)],
      ),
      Chapter(
        chapterName: 'Permutations and Combinations',
        links: [Link(number: 1, link: 'kemh107'.ncert)],
      ),
      Chapter(
        chapterName: 'Binomial Theorem',
        links: [Link(number: 1, link: 'kemh108'.ncert)],
      ),
      Chapter(
        chapterName: 'Sequences and Series',
        links: [Link(number: 1, link: 'kemh109'.ncert)],
      ),
      Chapter(
        chapterName: 'Straight Lines',
        links: [Link(number: 1, link: 'kemh110'.ncert)],
      ),
      Chapter(
        chapterName: 'Conic Sections',
        links: [Link(number: 1, link: 'kemh111'.ncert)],
      ),
      Chapter(
        chapterName: 'Introduction to Three Dimensional Geometry',
        links: [Link(number: 1, link: 'kemh112'.ncert)],
      ),
      Chapter(
        chapterName: 'Limits and Derivatives',
        links: [Link(number: 1, link: 'kemh113'.ncert)],
      ),
      Chapter(
        chapterName: 'Mathematical Reasoning',
        links: [Link(number: 1, link: 'kemh114'.ncert)],
      ),
      Chapter(
        chapterName: 'Statistics',
        links: [Link(number: 1, link: 'kemh115'.ncert)],
      ),
      Chapter(
        chapterName: 'Probability',
        links: [Link(number: 1, link: 'kemh116'.ncert)],
      ),
      Chapter(
        chapterName: 'Answers',
        links: [Link(number: 1, link: 'kemh1an'.ncert)],
      ),
    ],
  ),
];
