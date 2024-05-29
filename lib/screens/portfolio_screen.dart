import 'package:crypto_hub/components/button_widget.dart';
import 'package:crypto_hub/components/coin_tile.dart';
import 'package:crypto_hub/controllers/home_controller.dart';
import 'package:crypto_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final HomeController _controller = Get.put(
    HomeController(),
  );
  final _colorUtils = ColorUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorUtils.atlbgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            _buildPortfolioCard(),
            _buildButtonBar(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Your Coins',
                style: TextStyle(
                  color: _colorUtils.text1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildCoinSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioCard() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _colorUtils.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _colorUtils.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Holding value',
                style: TextStyle(
                  color: _colorUtils.white,
                  fontSize: 10,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'kes 76,509.75',
                    style: TextStyle(
                      fontSize: 28,
                      color: _colorUtils.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '+9.77%',
                    style: TextStyle(
                      color: _colorUtils.white.withOpacity(
                        0.68,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invested value',
                    style: TextStyle(
                      fontSize: 10,
                      color: _colorUtils.white,
                    ),
                  ),
                  Text(
                    'kes 51,689.75',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: _colorUtils.white,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 1,
                color: _colorUtils.borderColor,
                height: 28,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available KES',
                    style: TextStyle(
                      fontSize: 10,
                      color: _colorUtils.white,
                    ),
                  ),
                  Text(
                    'kes 178589',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: _colorUtils.white,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButtonBar() {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            label: 'Deposit KES',
            bgColor: _colorUtils.primary,
            textColor: _colorUtils.white,
            onTap: () {},
          ),
        ),
        Expanded(
          child: ButtonWidget(
            label: 'Withdraw KES',
            bgColor: _colorUtils.white,
            textColor: _colorUtils.primary,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildCoinSection() {
    return ListView(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      children: _controller.favouriteCoins
          .map(
            (e) => CoinTile(coin: e),
      )
          .toList(),
    );
  }
}