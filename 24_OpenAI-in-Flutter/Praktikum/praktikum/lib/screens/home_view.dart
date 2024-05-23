import 'package:flutter/material.dart';
import 'package:praktikum/screens/result_view.dart';
import 'package:praktikum/service/recomendation_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

TextEditingController budgetController = TextEditingController();
TextEditingController cameraController = TextEditingController();
TextEditingController storageController = TextEditingController();
bool isLoading = false;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


class _HomeViewState extends State<HomeView> {
   void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        budget: budgetController.text,
        camera: cameraController.text,
        storage: storageController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Phone Recomendation'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: budgetController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your budget.';
                  }
                  return null;
                
                },
                decoration: const InputDecoration(
                  labelText: 'Budget in IDR',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter camera resolution.';
                  }
                  return null;
                
                },
                controller: cameraController,
                decoration: const InputDecoration(
                  labelText: 'Camera Resolution in MP',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter internal storage.';
                  }
                  return null;
                
                },
                controller: storageController,
                decoration: const InputDecoration(
                  labelText: 'Internal Storage in GB',
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity ,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _getRecommendations();
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Get Recommendations'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
