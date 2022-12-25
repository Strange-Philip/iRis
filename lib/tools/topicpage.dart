// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';
// import 'package:op_app/cards/coursecards.dart';

// class TopicPage extends StatefulWidget {
//   final Topic topic;
//   final String path;

//   const TopicPage({Key key, this.topic, this.path}) : super(key: key);
//   @override
//   _TopicPageState createState() => _TopicPageState();
// }

// class _TopicPageState extends State<TopicPage> {
//   var pdfController;
//    int _totalPages = 0;
//   int _currentPage = 0;
//   bool pdfReady = false;
//   PDFViewController _pdfViewController;
//   @override
//   void initState() {
//     pdfController = PdfController(
//       document: PdfDocument.openAsset(widget.topic.pdf),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color(0xFF4354b3),
//           elevation: 0,
//         ),
//         floatingActionButton: widget.topic.pdf == ''
//             ? SizedBox()
//             : FloatingActionButton.extended(
//                 backgroundColor: Color(0xFF4354b3),
//                 onPressed: () {
//                   Navigator.of(context).pushNamed('noteEdit');
//                 },
//                 elevation: 0,
//                 label: Row(
//                   children: [
//                     Text(
//                       'Note',
//                       style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20),
//                     ),
//                     Icon(
//                       LineIcons.alternatePencil,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               ),
//         body: widget.topic.pdf == ''
//             ? Center(
//                 child: Column(
//                   children: [
//                     Spacer(),
//                     SvgPicture.asset(
//                       'images/books.svg',
//                       width: 200,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 5),
//                       child: Text(
//                         "Topic not available yet",
//                         maxLines: 5,
//                         style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w500,
//                             // color: Colors.black,
//                             fontFamily: 'Quicksand'),
//                       ),
//                     ),
//                     Spacer(),
//                   ],
//                 ),
//               )
//             : Stack(
//         children: <Widget>[
//           PDFView(
//             filePath: widget.path,
//             autoSpacing: false,
//             enableSwipe: true,
//             pageSnap: false,
//             onError: (e) {
//               print(e);
//             },
//             onRender: (_pages) {
//               setState(() {
//                 _totalPages = _pages;
//                 pdfReady = true;
//               });
//             },
//             onViewCreated: (PDFViewController vc) {
//               _pdfViewController = vc;
//             },
//             onPageChanged: (int page, int total) {
//               setState(() {});
//             },
//             onPageError: (page, e) {},
//           ),
//           !pdfReady
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Offstage()
//         ],
//       )
//             // PdfView(
//             //     controller: pdfController,
//             //     pageSnapping: false,
//             //     backgroundDecoration: BoxDecoration(),
//             //     physics: BouncingScrollPhysics(),
//             //     scrollDirection: Axis.vertical,
//             //   ),
//       ),
//     );
//   }
// }
