import 'package:flutter/material.dart';
import 'package:wallet_app/services/air_drop_service.dart';
import 'package:wallet_app/themes/themes.dart';
import 'package:wallet_app/widgets/custom_button.dart';
import 'package:wallet_app/widgets/custom_text_field.dart';
class AirdropScreen extends StatelessWidget {
  const AirdropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController walletController = TextEditingController();
    final TextEditingController networkController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    final AirdropService airdropService = AirdropService();

    return AlertDialog(
      title: const Text('Request Airdrop'),
      content: SizedBox(
        width: 300, 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Wallet Address:"),
                const SizedBox(width: 10),
                SizedBox(
                  child: Flexible(
                    child: TextFieldWidget(
                      height: 50,
                      width: 140,
                      controller: walletController,
                      hintText: "Wallet Address",
                      labelText: "Wallet address",
                      obscureText: false,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Network:"),
                const SizedBox(width: 53),
                Flexible(
                  child: TextFieldWidget(
                    height: 50,
                    width: 180,
                    controller: networkController,
                    hintText: "Network",
                    labelText: "Enter network",
                    obscureText: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Amount:"),
                const SizedBox(width: 55),
                Flexible(
                  child: TextFieldWidget(
                    height: 50,
                    width: 180,
                    controller: amountController,
                    hintText: "Amount",
                    labelText: "Enter amount",
                    obscureText: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        CustomButton(
          color: primaryColor,
          height: 50,
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          text: 'Cancel',
          textColor: Colors.white,
          width: 70,
        ),
        CustomButton(
          color: primaryColor,
          height: 50,
          onPressed: () async {
            bool success = await airdropService.requestAirdrop(
              walletController.text,
              networkController.text,
              int.tryParse(amountController.text) ?? 0,
            );
  Navigator.pop(context);
            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Airdrop request successful!')),
              );
              
              Navigator.pop(context); // Close the dialog
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to request airdrop.')),
              );
            }
          },
          text: 'Request Airdrop',
          textColor: Colors.white,
          width: 150,
        ),
      ],
    );
  }
}
