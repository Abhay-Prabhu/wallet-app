import 'package:flutter/material.dart';
import 'package:wallet_app/services/transfer_balance_service.dart';
import 'package:wallet_app/themes/themes.dart';
import 'package:wallet_app/widgets/custom_button.dart';
import 'package:wallet_app/widgets/custom_text_field.dart';

class TransferBalanceScreen extends StatelessWidget {
  const TransferBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController recipientController = TextEditingController();
    final TextEditingController networkController = TextEditingController();
    final TextEditingController senderController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final TextEditingController pinController = TextEditingController();

    final transferService = BalanceTransfer();

    return AlertDialog(
      title: const Text('Transfer'),
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Recipient:"),
                const SizedBox(width: 10),
                SizedBox(
                  child: Flexible(
                    child: TextFieldWidget(
                      height: 50,
                      width: 177,
                      controller: recipientController,
                      hintText: "Recipient Address",
                      labelText: "Recipient address",
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
                const SizedBox(width: 16),
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
                const Text("Sender:"),
                const SizedBox(width: 26),
                Flexible(
                  child: TextFieldWidget(
                    height: 50,
                    width: 180,
                    controller: senderController,
                    hintText: "Sender Address",
                    labelText: "Sender address",
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
                const SizedBox(width: 21),
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
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("PIN:"),
                const SizedBox(width: 48),
                Flexible(
                  child: TextFieldWidget(
                    height: 50,
                    width: 180,
                    controller: pinController,
                    hintText: "User PIN",
                    labelText: "Enter PIN",
                    obscureText: true,
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
            Navigator.pop(context);
          },
          text: 'Cancel',
          textColor: Colors.white,
          width: 70,
        ),
        CustomButton(
          color: primaryColor,
          height: 50,
          onPressed: () async {
            final result = await transferService.makeTransfer(
                recipientController.text,
                networkController.text,
                senderController.text,
                int.tryParse(amountController.text) ?? 0,
                pinController.text);
    
            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Transfer successful!')),
              );
              Navigator.pop(context); // Close the dialog
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to transfer...')),
              );
              Navigator.pop(context);
            }
          },
          text: 'Send',
          textColor: Colors.white,
          width: 70,
        ),
      ],
    );
  }
}
