import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_paymob/Modules/payment/Cubit/cubit.dart';
import 'package:payment_paymob/Modules/payment/Cubit/states.dart';
import 'package:payment_paymob/Modules/payment/toggle.dart';
import 'package:payment_paymob/shared/components/components.dart';
import 'package:payment_paymob/shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

   var formKey =GlobalKey<FormState>();

  var firstNameController =TextEditingController();
  var lastNameController =TextEditingController();
  var emailController =TextEditingController();
  var phoneNumController =TextEditingController();
  var priceController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PaymentCubit(),
      child: BlocConsumer<PaymentCubit,PaymentStates>(
        listener: (context,state){
if(state is PaymentReferenceCodeSuccessState){
  navigateAndFinish(context: context, widget: ToggleScreen());


}
        },
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: defaultColor,
                title: Center(
                  child: Text(
                    'Payment Integration',
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Row(
                       children: [
                         Expanded(
                           child: myTextField(
                             context: context, onTap: (){}, validateText: 'please enter your first name',
                             onChanged: (){}, controller: firstNameController, label: 'first name',
                             type: TextInputType.name,prefixIcon: Icons.person,prefixSize: 30 ,),
                         ),

                         Expanded(
                           child: myTextField(
                             context: context, onTap: (){}, validateText: 'please enter your last name',
                             onChanged: (){}, controller: lastNameController, label: 'last name',
                             type: TextInputType.name,prefixIcon: Icons.person,prefixSize: 30 ,
                           ),
                         ),
                       ],
                     )  ,

                      myTextField(
                        context: context, onTap: (){}, validateText: 'please enter your email',
                        onChanged: (){}, controller: emailController, label: 'email',
                        type: TextInputType.emailAddress,prefixIcon: Icons.mail_lock_outlined,prefixSize: 30 ,
                      ),

                      myTextField(
                        context: context, onTap: (){}, validateText: 'please enter your phone',
                        onChanged: (){}, controller: phoneNumController, label: 'phone',
                        type: TextInputType.phone,prefixIcon: Icons.phone,prefixSize: 30 ,
                      ),

                      myTextField(
                        context: context, onTap: (){}, validateText: 'please enter your price',
                        onChanged: (){}, controller: priceController, label: 'price',
                        type: TextInputType.number,prefixIcon: Icons.monetization_on_outlined,prefixSize: 30 ,
                      ),

                      myButton(
                          text: 'GO TO PAY',
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              PaymentCubit.get(context).getFirstToken(
                                priceController.text ,
                                firstNameController.text ,
                                lastNameController.text ,
                                emailController.text ,
                                phoneNumController.text ,

                              ) ;

                            }

                      } ,
                          color: defaultColor ,
                          width: MediaQuery.of(context).size.width *0.6 ,
                          height: 50
                      )


                    ],
                  ),
                ),
              ),
            ),
          ) ;
        },

      ),
    );
  }
}
