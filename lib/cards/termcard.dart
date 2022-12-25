import 'package:flutter/material.dart';

class TermCard extends StatefulWidget {
  @override
  _TermCardState createState() => _TermCardState();
}

class _TermCardState extends State<TermCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: ExpansionPanelList(
              elevation: 0,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                });
              },
              children: [
            ExpansionPanel(
              canTapOnHeader: true,
              // backgroundColor: Color(0xFF4354b3),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Center(
                  child: Text(
                    'TERM',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                       fontFamily: 'Quicksand',
                      color: Color(0xFF4354b3),
                    ),
                  ),
                );
              },
              isExpanded: _isExpanded,
              body: Container(
                // height: 100,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Laborum amet ex esse cillum ipsum est tempor et dolor cupidatat officia minim aute occaecat. Mollit magna aliqua eu amet cillum dolore. Enim eiusmod et veniam labore magna non mollit qui. Non tempor incididunt ea irure ut amet dolor dolor minim. Et elit in commodo culpa est veniam enim. Exercitation id aliqua dolor ipsum aliqua incididunt consequat labore cupidatat nisi pariatur proident.',
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                     fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
