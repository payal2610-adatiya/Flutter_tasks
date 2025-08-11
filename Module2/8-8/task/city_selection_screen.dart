import 'package:flutter/material.dart';

class CitySelectionDialog extends StatefulWidget {
  const CitySelectionDialog({super.key});

  @override
  State<CitySelectionDialog> createState() => _CitySelectionDialogState();
}

class _CitySelectionDialogState extends State<CitySelectionDialog> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Your City'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: const Text('Rajkot'),
            value: 'Rajkot',
            groupValue: selectedCity,
            onChanged: (String? value) => setState(() => selectedCity = value),
          ),
          RadioListTile<String>(
            title: const Text('Ahmedabad'),
            value: 'Ahmedabad',
            groupValue: selectedCity,
            onChanged: (String? value) => setState(() => selectedCity = value),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: selectedCity != null
              ? () => Navigator.pop(context, selectedCity)
              : null,
          child: const Text('Continue'),
        ),
      ],
    );
  }
}