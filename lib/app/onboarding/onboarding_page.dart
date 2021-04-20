import 'package:flutter/material.dart';

import '../../constants.dart';
import '../landing_page.dart';
import 'onboard_elevated_button.dart';
import 'onboard_outlined_button.dart';
import 'onboarding_data.dart';
import 'slider_model.dart';
import 'slider_tile.dart';

class OnboardingPage extends StatefulWidget {
  static const String id = 'onboarding_page';

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SliderModel> _slides = [];
  int _currentIndex = 0;
  OnboardingData _onboarding = OnboardingData();
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _slides = _onboarding.getSlides();
  }

  //////// WIDGET METHODS ///////////

  Widget _bottomSheetDisplay() {
    if (_currentIndex != _slides.length - 1) {
      return Container(
        padding: EdgeInsets.only(bottom: 30.0, top: 20.0),
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            OnboardOutlinedButton(
              label: 'SKIP',
              onPressed: () {
                _pageController.animateToPage(
                  _slides.length - 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
            ),
            Row(
              children: <Widget>[
                for (int i = 0; i < _slides.length; i++)
                  _currentIndex == i
                      ? _pageIndexIndicator(true)
                      : _pageIndexIndicator(false)
              ],
            ),
            OnboardOutlinedButton(
              label: 'Next',
              onPressed: () {
                _pageController.animateToPage(
                  _currentIndex + 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: OnboardElevatedButton(
          label: 'Get Started',
          onPressed: () => Navigator.of(context).pushNamed(LandingPage.id),
        ),
      );
    }
  }

  Widget _pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 4.0,
      width: isCurrentPage ? 20.0 : 13.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? kAccentColor : kScaffoldColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Widget _buildContent() {
    return PageView.builder(
      controller: _pageController,
      itemCount: _slides.length,
      itemBuilder: (_, i) => SliderTile(
        imageString: _onboarding.getImageAssetPath(i),
        title: _onboarding.getTitle(i),
        desc: _onboarding.getDesc(i),
      ),
      onPageChanged: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: _buildContent(),
      bottomSheet: _bottomSheetDisplay(),
    );
  }
}
