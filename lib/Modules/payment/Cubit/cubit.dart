import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_paymob/Models/final_token_model.dart';
import 'package:payment_paymob/Models/first_token_model.dart';
import 'package:payment_paymob/Models/order_ID_model.dart';
import 'package:payment_paymob/Modules/payment/Cubit/states.dart';
import 'package:payment_paymob/network/DioHelper.dart';
import 'package:payment_paymob/shared/components/constants.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  FirstTokenModel? firstTokenModel;
  OrderIdModel? orderIdModel;
  FinalTokenModel? finalTokenModel ;

  Future getFirstToken(
      String price ,
      String? firstNAme ,
      String? lastNAme ,
      String? email ,
      String? phone ,
      ) async {
    DioHelperPayment.postData(
      url: 'auth/tokens',
      data: {"api_key": PaymobapiKey},
    ).then((value) {
      firstTokenModel = FirstTokenModel.fromJson(value.data);
      FirstToken = firstTokenModel!.token;
      print('FirstToken : ${FirstToken}');
      print('//////////////////////////////////////////');
      getOrderID(price,firstNAme,lastNAme,email,phone);
      emit(PaymentSuccessState());
    }).catchError((error) {
      emit(PaymentErrorState(error));
      print('error in get first Token : ${error.toString()}');
    });
  }

  Future getOrderID(
      String? price ,
      String? firstNAme ,
      String? lastNAme ,
      String? email ,
      String? phone ,

      ) async {
    DioHelperPayment.postData(
      url: 'ecommerce/orders',
      data: {
        "auth_token": FirstToken,
        "delivery_needed": "false",
        "items": [],
        "amount_cents": price,
        "currency": "EGP",
      },
    ).then((value) {
      // orderIdModel = OrderIdModel.fromJson(value.data);
      // OrderID = orderIdModel!.id.toString();
      // اي وسطر من الاتنين الفرق ان التاني مش معتمدين ع المودل وهكذا في جميع الميثودز
      OrderID = value.data['id'].toString();

      print('order ID : ${OrderID}');
      print('//////////////////////////////////////////');
      getFinalTokenCard(price ,firstNAme,lastNAme,email,phone);
      getFinalTokenKiosk(price, firstNAme, lastNAme, email, phone);
      emit(PaymentOrderIDSuccessState());
    }).catchError((error) {
      emit(PaymentOrderIDErrorState(error));
      print('error in get Order ID : ${error.toString()}');
    });
  }

  Future getFinalTokenCard(
      String? price ,
      String? firstNAme ,
      String? lastNAme ,
      String? email ,
      String? phone ,
      ) async {
    DioHelperPayment.postData(
        url: 'acceptance/payment_keys',
        data: {
      "auth_token": FirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": OrderID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstNAme,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastNAme,
        "state": "NA" ,
      },
      "currency": "EGP",
      "integration_id": IntegrationIDCard,
    }).then((value) {
      FinalTokenCard = value.data['token'].toString();
      // finalTokenModel =FinalTokenModel.fromJson(value.data);
      // FinalTokenCard = finalTokenModel!.token.toString();
      print('Final Token Card: ${FinalTokenCard}');
      print('//////////////////////////////////////////');
      emit(PaymentRequestFinalTokenSuccessState());
    }).catchError((error) {
      emit(PaymentRequestFinalTokenErrorState(error));
      print('error in get Final Token Card : ${error.toString()}');
    });
  }



  Future getFinalTokenKiosk(
      String? price ,
      String? firstNAme ,
      String? lastNAme ,
      String? email ,
      String? phone ,
      ) async {
    DioHelperPayment.postData(
        url: 'acceptance/payment_keys',
        data: {
          "auth_token": FirstToken,
          "amount_cents": price,
          "expiration": 3600,
          "order_id": OrderID,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstNAme,
            "street": "NA",
            "building": "NA",
            "phone_number": phone,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastNAme,
            "state": "NA" ,
          },
          "currency": "EGP",
          "integration_id": IntegrationIDKiosk,
        }).then((value) {
      FinalTokenKiosk = value.data['token'].toString();

      getReferenceCodeAfterKioskToken() ;

      print('Kiosk Token: ${FinalTokenKiosk}');
      print('//////////////////////////////////////////');
      emit(PaymentRequestKioskTokenSuccessState());
    })
        .catchError((error) {
      emit(PaymentRequestKioskTokenErrorState(error));
      print('error in get Kiosk Token : ${error.toString()}');
    });
  }



  Future getReferenceCodeAfterKioskToken(

      ) async {
    DioHelperPayment.postData(
        url: 'acceptance/payments/pay',
        data: {
          "source": {
            "identifier": "AGGREGATOR",
            "subtype": "AGGREGATOR"
          },
          "payment_token": FinalTokenKiosk ,
        }).then((value) {
      ReferenceCode = value.data['id'].toString();
      print('Reference Code: ${ReferenceCode}');
      print('//////////////////////////////////////////');
      emit(PaymentReferenceCodeSuccessState());
    })
        .catchError((error) {
      emit(PaymentReferenceCodeErrorState(error));
      print('error in get Reference Code : ${error.toString()}');
    });
  }



}
