import 'package:books_wallah/app/core/extensions.dart';

import '../../../model/books.dart';
import '../../../model/chapter.dart';
import '../../../model/links.dart';

List<Book> ap = [
  Book(
    className: 'Bsc Electronics',
    bookName: 'S. M. Sze',
    subject: 'Semiconductor Devices',
    chapters: [
      Chapter(
          chapterName:
              "Energy Bands and Carrier Concentration inThermal Equilibrium",
          links: [
            Linkurl(
                number: 1, link: "1KOIYFgPm0mC-hH-OY4eJjzom1ANeUvJE".gdrive),
            // Link(number: 2, link: "62efb3a3ebd48h".uploadgram),
          ]),
      Chapter(chapterName: "Carrier Transport Phenomena", links: [
        Linkurl(number: 1, link: "1_LUwf1CsGk7ugRCfMH--m0VIQKWhsbzy".gdrive),
        // Link(number: 2, link: "62efb3a45d5edh".uploadgram),
      ]),
      Chapter(chapterName: "p-n Junction", links: [
        Linkurl(number: 1, link: "1KeVFBIW-bDwaFLnTZaIH7BMEKf_Hiuip".gdrive),
        //Link(number: 2, link: "62efb3a4a8f21h".uploadgram),
      ]),
      Chapter(chapterName: "Bipolar Transistors and Related Devices ", links: [
        Linkurl(number: 1, link: "1cvsrGIJqPDP-X0dlJ_uJLmxyYwbK9jIg".gdrive),
        //Link(number: 2, link: "62efb3a501461h".uploadgram),
      ]),
      Chapter(chapterName: "MOS Capacitor and MOSFET", links: [
        Linkurl(number: 1, link: "1NUpKzU2hlOKgR1fjwkaCE_diuLvkAdhr".gdrive),
        //Link(number: 2, link: "62efb3a550400h".uploadgram),
      ]),
      Chapter(chapterName: "Advanced MOSFET and Related Devices", links: [
        Linkurl(number: 1, link: "1NVsj-Qc8kHyCsnudc8kqaV5yGFUgqp91".gdrive),
        //Link(number: 2, link: "62efb3a599e9fh".uploadgram),
      ]),
      Chapter(chapterName: "MESFET and Related Devices", links: [
        Linkurl(number: 1, link: "1fnFc9aV0Kobb3dYEnfFxguHx0Dpl4nkv".gdrive),
        //Link(number: 2, link: "62efb3a9eec64h".uploadgram),
      ]),
      Chapter(
          chapterName:
              "Microwave Diodes; Quantum-Effect and Hot-Electron Devices",
          links: [
            Linkurl(
                number: 1, link: "1dkSpX_Ba3ZE82itqG4rZrJLsRCwdNnzv".gdrive),
            //  Link(number: 2, link: "62efb3aa410cch".uploadgram),
          ]),
      Chapter(
        chapterName: "Light Emitting Diodes and Lasers",
        links: [
          Linkurl(number: 1, link: "1XZQUm1TApZCuHnQVqiKWF6t7pRI22MCx".gdrive),
          //Link(number: 2, link: "62efb3aa8970dh".uploadgram),
        ],
      ),
      Chapter(chapterName: "Photodetectors and Solar Cells", links: [
        Linkurl(number: 1, link: "1yEUjoZS8IneARx2FwJ5w0yAiDqs2HsoQ".gdrive),
        // Link(number: 2, link: "62efb3aad352ah".uploadgram),
      ]),
      Chapter(chapterName: "Crystal Growth and Epitaxy", links: [
        Linkurl(number: 1, link: "1XXm0jWNAbmDuxy9rhYWUh__cKF1Ih087".gdrive),
        //Link(number: 2, link: "62efb5e66ee68h".uploadgram),
      ]),
      Chapter(chapterName: "Film Formation", links: [
        Linkurl(number: 1, link: "1Xhb8el9tfprwU-Cs1f1OEO1cJ5WUdz7Y".gdrive),
        //Link(number: 2, link: "62efb5e704each".uploadgram),
      ]),
      Chapter(chapterName: "Lithography and Etching", links: [
        Linkurl(number: 1, link: "1XRkzQ9ac5GpnfRcqDoqiqNJXIVoFS14j".gdrive),
        //Link(number: 2, link: "62efb5e8028aeh".uploadgram),
      ]),
      Chapter(chapterName: "Impurity Doping", links: [
        Linkurl(number: 1, link: "1boBHMM0Smh6bzCA2bER5cMDTqx89vev6".gdrive),
        //Link(number: 2, link: "62efb5e86b134h".uploadgram),
      ]),
      Chapter(chapterName: "Integrated Devices", links: [
        Linkurl(number: 1, link: "1bflcs4bLQlFsBaNXJL_Q434OcTLbZq2O".gdrive),
        //Link(number: 2, link: "62efb5e8ae5a1h".uploadgram),
      ]),
      Chapter(chapterName: "List of Symbols", links: [
        Linkurl(number: 1, link: "1NUtELqfAMUpNv69x6WmrMVpjVzlhamH7".gdrive),
        //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(chapterName: "International Systems of Units (SI Units)", links: [
        Linkurl(number: 1, link: "1S7Ih5CtruUQ0uOa1BPsGVAIjyy6VJ4o0".gdrive),
        // Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(chapterName: "Unit Prefixes", links: [
        Linkurl(number: 1, link: "1GnPYYNLEaLfD5_EmScjQZQzEd2wsFpFQ".gdrive),
        // Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(chapterName: "Greek Alphabet", links: [
        Linkurl(number: 1, link: "17vbVWXNrSYHevT2l61sSePgLNTk5O89N".gdrive),
        // Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(chapterName: "Physical Constants", links: [
        Linkurl(number: 1, link: "1Qd5j2UvR_7sNOqWA-QIB0JWY0Klji7HE".gdrive),
        //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(
          chapterName:
              "Properties of Important Element and Binary Compound Semiconductors at 300 K",
          links: [
            Linkurl(
                number: 1, link: "1YaevvaVTdrbesrPyNWzAdxUYiNskIu5k".gdrive),
            //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
          ]),
      Chapter(chapterName: "Properties of Si and GaAs at 300 K", links: [
        Linkurl(number: 1, link: "1F6152xzlfR5pgTeKy_Fc7hmG1mT7c87h".gdrive),
        //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(
          chapterName: "Derivation of the Density of States in a Semiconductor",
          links: [
            Linkurl(
                number: 1, link: "1Erhc0DwiZXRt1NiQxzRkfh-A3KPZ7aaf".gdrive),
            //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
          ]),
      Chapter(
          chapterName:
              "Derivation of Recombination Rate for Indirect Recombination",
          links: [
            Linkurl(
                number: 1, link: "1VkpCF8vJD8Fjjw_aJW8PoF5LOmj6G0TN".gdrive),
            //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
          ]),
      Chapter(
          chapterName:
              "Calculation of the Transmission Coefficient for a Symmetric Resonant-Tunneling Diode",
          links: [
            Linkurl(
                number: 1, link: "1Fv-Tff50lzks5yK11W4liAjoCidEbgQL".gdrive),
            //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
          ]),
      Chapter(chapterName: "Basic Kinetic Theory of Gases", links: [
        Linkurl(number: 1, link: "1cawaj1TVXVL9H4Fbo3KX0DANnemm6AYo".gdrive),
        //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
      Chapter(chapterName: "Answers to Selected Problems", links: [
        Linkurl(number: 1, link: "1roUELsDiWGC3y5sQjV4LCNFg5wYIsqZe".gdrive),
        //Link(number: 2, link: "62efb5ec76a69h".uploadgram),
      ]),
    ],
  ),
];
