import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> history = [
  Book(
    bookName: "NCERT 2022-2023",
    className: 'Class 9',
    subject: 'HISTORY',
    chapters: [
      Chapter(chapterName: "The French Revolution", links: [
        Linkurl(number: 1, link: "iess301".ncert),
      ]),
      Chapter(
          chapterName: "Socialism in Europe and the Russian Revolution",
          links: [
            Linkurl(number: 1, link: "iess302".ncert),
          ]),
      Chapter(chapterName: "Nazism and the Rise of Hitler", links: [
        Linkurl(number: 1, link: "iess303".ncert),
      ]),
      Chapter(chapterName: "Forest Society and Colonialism", links: [
        Linkurl(number: 1, link: "iess304".ncert),
      ]),
      Chapter(chapterName: "Pastoralists in the Modern World", links: [
        Linkurl(number: 1, link: "iess305".ncert),
      ]),
    ],
  ),
];
