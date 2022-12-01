import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RequiredDocuments extends StatelessWidget {
  const RequiredDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildRow('Driver\'s licence'),
            const SizedBox(height: 10.0),
            _buildRow('Tin Number'),
            const SizedBox(height: 10.0),
            _buildRow('Libre document'),
          ],
        ),
      ),
    );
  }

  _buildRow(String title) {
    return Row(
      children: [
        const Icon(PhosphorIcons.check),
        const SizedBox(width: 18.0),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
