import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/home_controller.dart';

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextFormField(
          controller: controller.searchController,
          onChanged: (value) {
            controller.search(value);
          },
          decoration: InputDecoration(
            hintText: "Search".tr,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: context.theme.colorScheme.secondary.withOpacity(
                  0.9,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: context.theme.colorScheme.secondary.withOpacity(
                  0.9,
                ),
              ),
            ),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
