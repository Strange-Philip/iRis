import 'package:flutter/material.dart';
import 'cards/flashcard.dart';

class FlashCard {
  final String frontText;
  final String backText;

  FlashCard(this.frontText, this.backText);
}

class FlashCards extends StatefulWidget {
  @override
  _FlashCardsState createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  List<FlashCard> flashcardlist = [
    FlashCard('Orbital Roof Bones.',
        'The Orbital roof has two bones: \n(1) The frontal and \n(2) Greater wings of sphenoid bone. \nIt has four important structures medially: the frontal sinus, trochlear pulley, and trochlear fossa, and, laterally, the main lacrimal gland.'),
    FlashCard('Cranial Nerves Involved in Vision.',
        'The orbital structures are innervated by cranial nerves (CNs) II, III, IV, V, VI, and VII. Motor functions of the striated muscles are controlled by CN III, the oculomotor nerve; CN IV, the trochlear nerve; CN VI, the abducens nerve; and CN VII, the facial nerve. CN V, the trigeminal nerve, carries the sensory supply from the orbital structures. CN II, the optic nerve, carries visual information.'),
    FlashCard('The floor of orbit.',
        'The floor has three bones: \n(1) Orbital plate of maxilla,\n(2) Orbital surface of zygomatic, and \n(3) Orbital process of palatine bone. It has an infraorbital groove, which changes into infraorbital canal, causing anesthesia of the upper lip because of infraorbital nerve involvement.'),
    FlashCard('Lateral Wall of orbit.',
        'The strongest wall of all the orbital wall is the lateral wall. It has two bones: \n(1) Zygomatic and (2) Sphenoid. It includes the Whitnall’s tubercle, which attaches to the following:\n(1) Lateral palpebral ligament\n(2) Lateral check ligament\n(3) Lateral edge of aponeurosis of levator palpebrae superioris'),
    FlashCard('Medial Orbital Wall.',
        'The thinnest medial wall has four bones:\n(1) Frontal process of Maxilla\n(2) Lacrimal bone\n(3) Orbital plate of ethmoid bone\n(4) A small part of body of sphenoid bone\nIt has a lacrimal fossa between the anterior and posterior lacrimal crest, lodging the lacrimal sac, which opens into the nasolacrimal duct (NLD), opening into the inferior meatus of the nose'),
    FlashCard('FACTS TO REMEMBER.',
        'Back: Medial walls run parallel to each other\nLateral walls are inclined almost ninety degrees to each other.\nWidest point of orbit is 1cm inside the orbital margin. \nThe orbit has a volume of 25-30ml and globe occupies 7ml\nEach orbit composed of seven bones.'),
    FlashCard('Orbital Rim Fracture.',
        'Blow-in fractures The frontal bone is the strongest component of the craniofacial skeleton, withstanding between 800 and 2200 pounds of force before fracturing. This is equivalent to the force achieved in a frontal collision at 30 mph for an unrestrained adult passenger. Orbital roof “blow-in” fractures may be associated with a number of ocular and neurologic injuries including proptosis, ptosis, optic nerve contusion, orbital hematoma, as well as contusive and hemorrhagic injuries to the ipsilateral frontal and parietal lobes. '),
    FlashCard('Clinical Signs of Blow out Fracture.',
        ' Signs \na.	Orbital swelling  \nb.	Ecchymosis \nc.	Anaesthesia of the area innervated by the infraorbital nerve.'),
    FlashCard('ORBITAL CELLULITIS  .',
        'The thin walls of the sinus cavities are poor barriers to the passage of infection from the air cavities into the orbit. If pathogens from a sinusitis penetrate the thin, bony barrier, a serious infection involving the orbital contents might ensue. A major infection that involves the orbital connective-tissue contents is called orbital cellulitis, and one of its major causes is sinusitis. Signs and symptoms include: sudden onset of pain, edema, proptosis, and a decrease in ocular motility. '),
    FlashCard('The Eight Extraocular Muscles.',
        'There are eight extraocular muscles in each eye. They are:  \nA.	Orbicularis Oculi \nB.	Levator palpebrae superioris \nC.	Two oblique muscles \n  1.	Superior Oblique Muscle \n  2.	Inferior Oblique Muscle \nD.	Four recti muscles \n  1.	Superior Rectus Muscle \n  2.	Inferior Rectus Muscle \n  3.	Medial Rectus Muscle \n  4.	Lateral Rectus Muscle '),
    FlashCard('Corneal Dimensions.',
        'The central corneal thickness is 0.53 mm, whereas the corneal periphery is 0.71 mm thick.  The transparent cornea appears from the front to be oval, as the sclera encroaches on the superior and inferior aspects. The anterior horizontal diameter is 12 mm and the anterior vertical diameter is 11 mm. If viewed from behind, the cornea appears circular, with horizontal and vertical diameters of 11.7 mm. The radius of curvature of the central cornea at the anterior surface is 7.8 mm and at the posterior surface is 6.5 mm. '),
    FlashCard('Corneal Transparency.',
        '	Regular arrangement of collagen fibrils in the stroma \n1.	Collagen fibrils are ineffective at scattering light (Spaces between collagen fibres is less than the wavelength of light)\n2.	Avascular: The cornea is avascular and obtains its nourishment by diffusion from the aqueous humor and from the conjunctival and episcleral capillary networks located in the limbus.\n3.	Regular diameter of fibres\n4.	Relative dehydration '),
    FlashCard('Layers of the Retina.',
        'A.	The outer pigmented layer \n-	The pigmented layer is tightly adherent to the choroid throughout. \nB.	The neural retina \n-	The neural retina is attached to the choroid only in a peripapillary ring around the disc and at the ora serrata.'),
    FlashCard('Muscles of the eyelid.',
        'There are two types of muscles in the lid- the retractors (which open the lid) and the protractors (which close the lid). The main retractor of the lid is the levator palpebrae superiors. It originates near the apex of the orbit and is inserted anteriorly into the skin of the upper lid forming the lid crease. This muscle is supplied by the 3rd cranial nerve. \nThe protractor of the eyelid is the orbicularis oculi. This muscle is situated beneath the skin of the eyelid. This is supplied by the 7th cranial nerve. Orbicularis oculi muscle helps in blinking.'),
    FlashCard('Corneal Endothelial pump mechanism.',
        "Corneal Endothelial pump mechanism - it's formed of enzymes in the plasma membrane that catalyze the movement of ions from stroma to aqueous thus creating an osmotic gradient that draws water out of the stroma. - Na+ & HCO3 transported across the endothelium from stroma to aqueous is mediated by Na+/K+ ATPase & carbonic anhydrase enzymes."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF4354b3),
        title: Text(
          'FlashCards',
          style: TextStyle(
            fontFamily: 'Quicksand',
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: flashcardlist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Flash(
                    flashCard: flashcardlist[index],
                  ),
                );
              })),
    );
  }
}
