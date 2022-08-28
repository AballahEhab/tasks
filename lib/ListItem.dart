import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_one/ListItemData.dart';
class ListItem extends StatelessWidget {
  ListItemData itemData;

  ListItem({Key? key, required this.itemData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Image.asset(itemData.imagePath),
                    ),
                    Visibility(
                      visible: itemData.isVerified,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.verified, color: Colors.green[500]),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 8, 3, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(itemData.hint?? '' ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(itemData.title),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(itemData.name),
                        ),
                        Row(children: [
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  Text(
                                      DateFormat('yyyy.MMMM.dd').format(itemData.date)
                                  ),
                                  const VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                  ),
                                  Text(itemData.address),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(itemData.numOfViews.toString()),
                                  Icon(Icons.remove_red_eye,
                                      color: Colors.grey[800]),
                                  Container(
                                    width: 10,
                                  ),
                                  Icon(
                                      (itemData.isLiked)
                                          ? Icons.heart_broken
                                          : Icons.heart_broken_outlined,
                                      color: Colors.grey[800])
                                ],
                              )
                            ],
                          )),
                        ])
                      ],
                    )))
          ],
        ));
  }
}
