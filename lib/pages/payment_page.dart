import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_page.dart';

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
  bool isChipVisible = false;
  bool isCvvFocused = false;

  void userTappedPay(){
    if(formKey.currentState!.validate()){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: const Text("Confrim payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card Number: " + cardNumber),
              Text("Expiry Date:" + expiryDate),
              Text("card holder name: " + cardHolderName),
              Text("Cvv" + cvvCode),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text("Cancel")
          ),
          TextButton(
            onPressed: () =>{
              Navigator.pop(context),
              Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => DeliveryPage()
              )
            ), },
            child: Text("Yes")
          )
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            isChipVisible: isChipVisible,
            onCreditCardWidgetChange: (p0){}
          ),

          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data){
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            }, 
            formKey: formKey
          ),
          Spacer(),

          MyButton(onTap: () => {userTappedPay()}, text: "Pay Now"),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}