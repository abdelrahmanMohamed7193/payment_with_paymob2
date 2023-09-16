import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payment_paymob/Modules/register/register.dart';
import 'package:payment_paymob/shared/components/components.dart';
import 'package:payment_paymob/shared/components/constants.dart';
import 'package:payment_paymob/shared/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaCardScreen extends StatelessWidget {
   VisaCardScreen({Key? key}) : super(key: key);

   final Completer<WebViewController> _controller = Completer<
       WebViewController>();
  @override
  Widget build(BuildContext context) {
    print(    '////////////////////////////////////////////////////////////////////////////////////') ;
    print(    'https://accept.paymob.com/api/acceptance/iframes/783609?payment_token=$FinalTokenCard') ;
    print('////////////////////////////////////////////////////////////////////////////////////');
    return Scaffold(

      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
paymentExit(context);
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child:
                Icon(Icons.exit_to_app) ,

            ),
          ),
        ],
      ),

       body:WebView(
         initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/783609?payment_token=$FinalTokenCard',
         javascriptMode: JavascriptMode.unrestricted,
         onWebViewCreated: (WebViewController webViewController) {
           _controller.complete(webViewController);
         },
         onProgress: (int progress) {
           print('WebView is loading (progress : $progress%)');
         },
         javascriptChannels: <JavascriptChannel>{
           _toasterJavascriptChannel(context),
         },
         navigationDelegate: (NavigationRequest request) {
           if (request.url.startsWith('https://www.youtube.com/')) {
             print('blocking navigation to $request}');
             return NavigationDecision.prevent;
           }
           print('allowing navigation to $request');
           return NavigationDecision.navigate;
         },
         onPageStarted: (String url) {
           print('Page started loading: $url');
         },
         onPageFinished: (String url) {
           print('Page finished loading: $url');
         },
         gestureNavigationEnabled: true,
         backgroundColor: const Color(0x00000000),
       ),
      // floatingActionButton: ExitButton(),
    );
  }


  }

  paymentExit(BuildContext context){
    showDialog(
        context: context,
        builder: (s){
          return AlertDialog(
            title: Text(
              'Are You Sure Completed Payment', style: TextStyle(color: defaultColor ,fontSize: 14),),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context) ;
                navigateAndFinish(context: context, widget: RegisterScreen());
              },
                  child:Text('Yes')
              ) ,
              TextButton(onPressed: (){
                Navigator.pop(context) ;
              },
                  child:Text('No')
              )
            ],

          );

        } ,
    );

  }

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      }





  );


}
