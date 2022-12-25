import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

import 'cards/coursecards.dart';

class ReadView extends StatefulWidget {
  final Topic topic;

  const ReadView({Key? key,required this.topic}) : super(key: key);
  @override
  _ReadViewState createState() => _ReadViewState();
}

class _ReadViewState extends State<ReadView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              centerTitle: true,
              backgroundColor: Color(0xFF4354b3),
              elevation: 0,
              title: Text(
                widget.topic.name.toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            floatingActionButton: widget.topic.pdf == ''
                ? SizedBox()
                : FloatingActionButton.extended(
                    backgroundColor: Color(0xFF4354b3),
                    onPressed: () {
                      Navigator.of(context).pushNamed('noteEdit');
                    },
                    elevation: 0,
                    label: Row(
                      children: [
                        Text(
                          'Note',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        Icon(
                          LineIcons.alternatePencil,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
            body:widget.topic.pdf == ''
            ? Center(
                child: Column(
                  children: [
                    Spacer(),
                    SvgPicture.asset(
                      'images/books.svg',
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "Topic not available yet",
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            // color: Colors.black,
                            fontFamily: 'Quicksand'),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SelectableText(
                    //     widget.topic.name,
                    //     style: TextStyle(
                    //         fontFamily: 'Quicksand',
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'images/pdf/T1P1.jpg',
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(
                        "Overview".toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(
                        " The eyeball is protected by a bony socket called the orbit on the two sides of the nose. The seven bones that make up the orbit are FS MZPEL (frontal, sphenoid, Maxilla, Zygoma, Palatine, Ethmoid and Lacrimal). The four-sided orbital cavity is pyramidal in shape with an open base in front and an apex on the back. The four walls of the orbit converge posteriorly to reach the apex on their back formed by the optic foramen. \n Base: Opens out into the face, bounded by the orbital margins. \n Walls: roof, floor, and medial and lateral walls.\n Apex: Posterior, located at the opening of the optic canal, the optic foramen. \n Entry Points: the optic canal, superior orbital fissure, and the inferior orbital fissure.\n Sinuses: air-filled cavities in the bones; frontal, ethmoidal, sphenoid, and maxillary ",
                        style: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(
                        "Bones Of the Skull ".toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(
                        " The skull has 22 bones divided into cranial and facial bones. We start our discussion here because the bones of the orbit are made of 7 different bones from the cranium and the face. The bones of the skull protect the brain. There are 8 cranial bones and 14 facial bones. \n Cranial Bones: Frontal, Parietal (2), Temporal (2), Occipital, Sphenoid and Ethmoid The 14 facial bones are; Frontal bone, Maxilla, Mandible, Zygoma, \n Palatine bones, Lacrimal bones, nasal bones, vomer and inferior nasal conchae. Out of the skull bones, only mandible and auditory ossicles are movable.",
                        style: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'images/pdf/T1P2.jpg',
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'images/pdf/T1P3.jpg',
                                ),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(
                        "bones of orbit".toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText(
                        "The orbits are two bony cavities on either side of the mid-sagittal plane below the anterior cranium that houses the eyeball. It houses other structures such as the extraocular muscles, nerves, lacrimal apparatus, fat and blood vessels. The bony orbit is shaped like a foursided pyramid comprising of an apex and four walls. \n Three cranial bones form part of the orbit: the frontal, sphenoid, and the ethmoid bones. The rest are facial bones—maxillary, zygomatic, palatine, and lacrimal bones. The lacrimal bone is the smallest bone of the face and articulates with maxillary bone, ethmoid and frontal bones. \n1. Frontal bone \n2. Sphenoid \n3. Maxilla \n4. Zygoma  \n5. Palatine \n6. Ethmoid \n7. Lacrimal \n Mnemonic: FS MZPEL \n Out of the 7 orbital bones, 3 are single; ethmoid, frontal and sphenoid (EFS). The rest are paired, 1 in each orbit. ",
                        style: TextStyle(fontFamily: 'Quicksand', fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
