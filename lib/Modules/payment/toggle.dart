import 'package:flutter/material.dart';
import 'package:payment_paymob/Modules/payment/ref_codeScreen.dart';
import 'package:payment_paymob/Modules/payment/visaCardScreen.dart';
import 'package:payment_paymob/shared/components/components.dart';
import 'package:payment_paymob/shared/styles/colors.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateAndFinish(context: context, widget: VisaCardScreen()) ;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12) ,
                      border: Border.all(color: defaultColor ,)
                    ),

                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image(image: AssetImage('assets/images/visa.png'),height: 300) ,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Text('Pay With Visa Card' ,
                          style: TextStyle(
                            fontSize: 17.0 ,fontWeight: FontWeight.bold
                          )
                        ),
                      ) ,

                    ],),
                  ),
                ),
              ) ,
              SizedBox(height: 30,),
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateAndFinish(
                        context: context,
                        widget: ReferenceCodeScreen() ,
                    ) ;

                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12) ,
                      border: Border.all(color: defaultColor ,)
                    ),

                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image(image: AssetImage('assets/images/ref_code.png'),height: 300) ,
                      Text('Pay With Reference Code' ,
                        style: TextStyle(
                          fontSize: 17.0 ,fontWeight: FontWeight.bold
                        )
                      ) ,

                    ],),
                  ),
                ),
              ) ,
            ],),
        ),
      ),
    );
  }
}

