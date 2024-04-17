import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String routeName = "/PrivacyPolicy";
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy policy'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/quran-app.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Privacy policy'.tr,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1.0, color: Colors.grey),
              const SizedBox(height: 20.0),
              Text(
                'data_collection'.tr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'data_collection_content'.tr,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30.0),
              Text(
                'data_usage'.tr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'data_usage_content'.tr,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30.0),
              Text(
                'third_party_services'.tr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'third_party_services_content'.tr,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30.0),
              Text(
                'data_security'.tr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'data_security_content'.tr,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30.0),
              Text(
                'changes_to_policy'.tr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'changes_to_policy_content'.tr,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30.0),
              Text(
                'contact_us'.tr,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'contact_us_content'.tr,
                style: const TextStyle(fontSize: 16.0),
              ),
              GestureDetector(
                onTap: () {
                  // Open email client with pre-filled email address
                },
                child: const Text(
                  'mohammedaydan12@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              const Divider(height: 1.0, color: Colors.grey),
              const SizedBox(height: 20.0),
              Text(
                'last_updated'.tr,
                textAlign: TextAlign.center,
              ),
              Text(
                'powered_by'.tr,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
