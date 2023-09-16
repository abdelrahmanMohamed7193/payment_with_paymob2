import 'package:flutter/material.dart';
import 'package:payment_paymob/shared/components/constants.dart';
import 'package:payment_paymob/shared/styles/colors.dart';

class ReferenceCodeScreen extends StatelessWidget {
  const ReferenceCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('You Should Go To Any Market To Pay' ,style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),) ,
          SizedBox(height: 20,) ,
          Text('this is reference code :',style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold),) ,
          SizedBox(height: 20,),
            Card(
              elevation:12 ,
              shape: Border.all(color: defaultColor,width: 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '$ReferenceCode',
                    style: TextStyle(fontSize: 40 ,fontWeight: FontWeight.bold)),
              ),
            )
        ],),
      )


    );
  }
}


