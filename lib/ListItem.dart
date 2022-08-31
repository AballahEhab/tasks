import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:task_one/CommentData.dart';

class CommentItemView extends StatelessWidget {
  CommentData commentData;

  CommentItemView({Key? key, required this.commentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 8, left: 16, bottom: 16, right: 8),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(commentData.imagePath),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        commentData.name,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      Visibility(
                        visible: commentData.isVerified,
                        child: Icon(
                          Icons.verified_user,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemSize: 15,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text("First Comment"))
        ],
      ),
    );

    // return SizedBox(
    //     height: 140,
    //     child: Row(
    //       children: [
    //         Expanded(
    //             flex: 1,
    //             child: Stack(
    //               children: [
    //                 Container(
    //                   padding: const EdgeInsets.only(bottom: 5),
    //                   child: Image.asset(commentData.imagePath),
    //                 ),
    //                 Visibility(
    //                   visible: commentData.isVerified,
    //                   child: Container(
    //                     alignment: Alignment.bottomRight,
    //                     padding: const EdgeInsets.only(right: 15),
    //                     child: Icon(Icons.verified, color: Colors.green[500]),
    //                   ),
    //                 )
    //               ],
    //             )),
    //         Expanded(
    //             flex: 2,
    //             child: Container(
    //                 padding: const EdgeInsets.fromLTRB(5, 8, 3, 5),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     Container(
    //                       alignment: Alignment.centerLeft,
    //                       child: Text(commentData.hint?? '' ),
    //                     ),
    //                     Container(
    //                       alignment: Alignment.centerLeft,
    //                       child: Text(commentData.title),
    //                     ),
    //                     Container(
    //                       alignment: Alignment.centerLeft,
    //                       child: Text(commentData.name),
    //                     ),
    //                     Row(children: [
    //                       Expanded(
    //                           child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Row(
    //                             children:  [
    //                               Text(
    //                                   DateFormat('yyyy.MMMM.dd').format(commentData.date)
    //                               ),
    //                               const VerticalDivider(
    //                                 color: Colors.black,
    //                                 thickness: 2,
    //                               ),
    //                               Text(commentData.address),
    //                             ],
    //                           ),
    //                           Row(
    //                             children: [
    //                               Text(commentData.numOfViews.toString()),
    //                               Icon(Icons.remove_red_eye,
    //                                   color: Colors.grey[800]),
    //                               Container(
    //                                 width: 10,
    //                               ),
    //                               InkWell(
    //                                 child: Icon(
    //                                     (commentData.isLiked)
    //                                         ? Icons.heart_broken
    //                                         : Icons.heart_broken_outlined,
    //                                     color: Colors.grey[800],
    //                                 ),
    //                                 onTap: (){
    //
    //                               }
    //                               )
    //                             ],
    //                           )
    //                         ],
    //                       )),
    //                     ])
    //                   ],
    //                 )))
    //       ],
    //     ));
  }
}
