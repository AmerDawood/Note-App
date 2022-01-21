import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GridViewWidget extends StatelessWidget {
  // const GridViewWidget({
  //   Key? key,
  // }) : super(key: key);
  final String title;
  final String NumberOfNode;
  final Image image;
  final Color backColor;
  GridViewWidget({

    required this.title,
    required this.NumberOfNode,
    required this.image,
    required this.backColor
});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
      child: Card(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: backColor,
                    borderRadius: BorderRadius.circular(70)
                ),
                child:image,
              ),
              Text(title,style: TextStyle(
                fontSize: 20,

              ),),
              Text(NumberOfNode,style: TextStyle(
                fontSize: 17,

              ),),
              Text('Notes',style: TextStyle(
                fontSize: 17,

              ),),
            ],
          ),
        ),
      ),
    );
  }

}
