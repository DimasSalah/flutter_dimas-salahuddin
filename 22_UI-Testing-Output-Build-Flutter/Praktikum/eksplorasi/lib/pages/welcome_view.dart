import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/pages/component/custom_form.dart';
import 'package:project/pages/controller/welcome_controller.dart';

import 'component/carousel_item.dart';
import 'component/indicator_slider.dart';
import 'component/submit_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  Color darkGrey = const Color(0xFFD9D9D9);
  Color grey = const Color(0xFFECECEC);
  Color greyActive = const Color(0xFFC3C3C3);

  int _current = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        key: Key('appBar'),
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Image.asset(
              'assets/logo.png',
              height: 70,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                key: Key('carousel'),
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 450.0,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: const [
                      CarouselItem(
                        imageAssetPath: 'assets/item1.png',
                        title: 'Full Functionality',
                        description:
                            'Manage your finances easily and efficiently. Discover the Latest Features to Track Expenses and Achieve Your Financial Goals.',
                      ),
                      CarouselItem(
                        imageAssetPath: 'assets/item2.png',
                        title: 'Easy Management',
                        description:
                            'Find Smart Solutions to Manage Your Expenses and Income. Budget, Monitor Debt, and Plan Your Investments with Our App',
                      ),
                      CarouselItem(
                        imageAssetPath: 'assets/item3.png',
                        title: 'Real-Time Updates',
                        description:
                            'Enjoy Interactive Reporting Features, Personalized Financial Consulting, and Real-Time Updates that Make it Easy for You to Manage Your Finances.',
                      ),
                    ],
                  ),
                  IndicatorSlider(current: _current)
                ],
              ),
            ),
            const SizedBox(height: 3),
            Form(
              key: _formKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 35),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      key: Key('title'),
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      key: Key('subtitle'),
                      'Having trouble using the app? Submit a question via the form below for feedback',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: greyActive, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    CustomForm(
                      title: 'Name',
                      dense: true,
                      validator: Controller().validateUsername,
                      controller: nameController,
                    ),
                    const SizedBox(height: 8),
                    CustomForm(
                      title: 'Email',
                      validator: Controller().validateEmail,
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),
                    CustomForm(
                      title: 'feedback',
                      maxLines: 3,
                      validator: Controller().validateFeedback,
                      controller: feedbackController,
                    ),
                    const SizedBox(height: 20),
                    SubmitButton(
                      key: Key('button submit'),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Data"),
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name: ${nameController.text}"),
                                      Text("Email: ${emailController.text}"),
                                      Text(
                                          "Feedback: ${feedbackController.text}"),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Tutup"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        Future.delayed(const Duration(seconds: 1))
                            .then((value) {
                          nameController.clear();
                          emailController.clear();
                          feedbackController.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
