import 'package:app1/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // user want to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form valid
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV Code: $cvvCode")
              ],
            ),
          ),
          actions: [
            // cancel btn
            TextButton(
              onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
            ),
            
            // yes btn
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryProgressPage(),
                  ),
              ), 
            child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (po) {},
          ),

          // Credit card form
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
                // isCvvFocused = data.isCvvFocused;
              });
            }, 
            formKey: formKey,
          ),

          const Spacer(),

          MyButton(
            onTap: userTappedPay, 
            text: "Pay Now!",
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
