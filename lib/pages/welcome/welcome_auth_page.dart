import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daily_tasks/pages/auth/authentication_page.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final RoundedLoadingButtonController _getStartedBtnController =
  RoundedLoadingButtonController();

  final RoundedLoadingButtonController _haveAnAccountBtnController =
  RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/success.svg',
                  height: 300,
                ),
                SizedBox(
                    height: 30
                ),
                Text("Hey! Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                  ),
                ),
                SizedBox(
                    height: 10
                ),
                Text(
                  "We deliver on demand organic fresh fruits directly from your nearby farms.",
                  style: TextStyle(
                      color: Colors.black87
                  ),
                ),
                SizedBox(
                    height: 30
                ),
                RoundedLoadingButton(
                  child: Text('Get Started', style: TextStyle(color: Colors.white)),
                  color: Colors.lightBlue,
                  successColor: Colors.green,
                  controller: _getStartedBtnController,
                  onPressed: () => _onClickGetStartedButton(),
                ),
                SizedBox(height: 30),
                RoundedLoadingButton(
                  child: Text('I already have an account', style: TextStyle(color: Colors.white)),
                  color: Colors.grey.withOpacity(0.8),
                  controller: _haveAnAccountBtnController,
                  onPressed: _onClickGetStartedButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onClickGetStartedButton(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => AuthenticationPage()
        )
    );
    _getStartedBtnController.stop();
    _haveAnAccountBtnController.stop();
  }
}
