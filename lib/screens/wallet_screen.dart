import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/wallet_provider.dart';
import 'package:wallet_app/screens/air_drop_screen.dart';
import 'package:wallet_app/screens/create_wallet.dart';
import 'package:wallet_app/screens/transfer_balance_screen.dart';
import 'package:wallet_app/screens/wallet_tab_screens/wallet_tab1.dart';
import 'package:wallet_app/themes/themes.dart';
import 'package:wallet_app/widgets/custom_button.dart';

import 'wallet_tab_screens/wallet_tab2.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? superkey}) : super(key: superkey);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Wallet", style: TextStyle(fontSize: 32)),
                ],
              ),
              const SizedBox(height: 25),
              Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  if (walletProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (walletProvider.errorMessage.isNotEmpty) {
                    return Center(child: Text(walletProvider.errorMessage));
                  }
                  if (walletProvider.balance == null) {
                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: container1,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 240,
                                    width: screenWidth * .9,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Total Balance",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                          Text(
                                              "${walletProvider.balance?.balance.toString() ?? 0}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                              walletProvider.balance?.message ??
                                                  'Balance message',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                          const SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                  textColor: textColor,
                                                  height: 70,
                                                  width: screenWidth * 0.35,
                                                  color: buttonColor2,
                                                  text: 'Send',
                                                  onPressed: () async {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            const TransferBalanceScreen());
                                                  }),
                                              CustomButton(
                                                textColor: textColor,
                                                height: 70,
                                                width: screenWidth * .35,
                                                color: buttonColor1,
                                                text: 'Swap',
                                                onPressed: () => showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const AirdropScreen()),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const TabBar(
                            tabs: [
                              Tab(text: 'Tokens'),
                              Tab(text: 'Activity'),
                            ],
                          ),
                          const Expanded(
                            child: TabBarView(
                              children: [
                                Tokens(),
                                Activity(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 250),
                      const Text("Oops! Wallet not created yet... "),
                      const SizedBox(height: 30),
                      CustomButton(
                        color: primaryColor,
                        textColor: container1,
                        text: 'Create Wallet',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const CreateWalletScreen());
                        },
                        height: 50,
                        width: 100,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
