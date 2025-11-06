import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchBox({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = 'Search',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (_, value, __) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    if (onChanged != null) onChanged!('');
                  },
                );
              },
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }
}