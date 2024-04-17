import 'package:flutter/material.dart';
import 'package:quran/services/lang_service.dart';

class TranslationButton extends StatelessWidget {
  const TranslationButton({super.key}); // Use Key? key

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () => LangService.changeLang(),
        icon: const Icon(Icons.language_rounded),
      ),
    );
  }
}
