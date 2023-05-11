import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  Razorpay razorpay = Razorpay();

  void oninit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // continueBooking(id, cxt);
    // Navigator.of(cxt).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => BottomNavigation()),
    //     (Route<dynamic> route) => false);
    // notifyListeners();
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  // razorpay.clear();

  razorpayOption(int totalPrice) {
    // id = data;
    // cxt = context;
    var options = {
      'key': 'rzp_test_YN3VzyjJeQGglQ',
      'amount': totalPrice * 100, //in the smallest currency sub-unit.
      'name': 'Naseef',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Turf',
      'timeout': 60, // in seconds
      'prefill': {'contact': '7012873850', 'email': 'naseefali3321@gmail.com'}
    };
    razorpay.open(options);
  }
}
