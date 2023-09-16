abstract class PaymentStates{}


class PaymentInitialState extends PaymentStates{}

class PaymentSuccessState extends PaymentStates{}
class PaymentErrorState extends PaymentStates{
   final dynamic error  ;

  PaymentErrorState(this.error);
}


class PaymentOrderIDSuccessState extends PaymentStates{}
class PaymentOrderIDErrorState extends PaymentStates{
  final dynamic error  ;

  PaymentOrderIDErrorState(this.error);
}


class PaymentRequestFinalTokenSuccessState extends PaymentStates{}
class PaymentRequestFinalTokenErrorState extends PaymentStates{
  final dynamic error  ;

  PaymentRequestFinalTokenErrorState(this.error);
}


class PaymentRequestKioskTokenSuccessState extends PaymentStates{}
class PaymentRequestKioskTokenErrorState extends PaymentStates{
  final dynamic error  ;

  PaymentRequestKioskTokenErrorState(this.error);
}



class PaymentReferenceCodeSuccessState extends PaymentStates{}
class PaymentReferenceCodeErrorState extends PaymentStates{
  final dynamic error  ;

  PaymentReferenceCodeErrorState(this.error);
}