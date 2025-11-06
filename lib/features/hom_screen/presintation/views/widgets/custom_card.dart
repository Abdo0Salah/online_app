import 'package:flutter/material.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.subjectModel});

   SubjectModel? subjectModel ;
   @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
        width: double.infinity,
        height: 100,
        alignment: Alignment.center,
        child: Row(

          children: [
            SizedBox(width: 20),
            Image(image: NetworkImage(subjectModel?.icon ??"" ), fit: BoxFit.fill,height: 48,width: 48,),
            SizedBox(width: 10),
            Text(subjectModel?.name ??"" , style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
