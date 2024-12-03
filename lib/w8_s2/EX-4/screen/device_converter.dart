import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final TextEditingController _controller = TextEditingController();
  String _selectedDevice = 'Euro';
  double _convertedAmount = 0.0;

  // Conversion rates
  final Map<String, double> conversionRates = {
    'Euro': 0.92, // Example rate: 1 USD = 0.92 EUR
    'Riels': 4050.0, // Example rate: 1 USD = 4050 KHR
    'Dong': 23000.0, // Example rate: 1 USD = 23000 VND
  };

  @override
  void initState() {
    super.initState();
  }

  void _convertCurrency() {
    final double dollarAmount = double.tryParse(_controller.text) ?? 0.0;
    if (dollarAmount > 0) {
      setState(() {
        _convertedAmount = dollarAmount * conversionRates[_selectedDevice]!;
      });
    } else {
      setState(() {
        _convertedAmount = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollars',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (text) {
                _convertCurrency();
              },
            ),
            const SizedBox(height: 30),
            const Text("Device:"),
            DropdownButton<String>(
              value: _selectedDevice,
              items: conversionRates.keys.map((device) {
                return DropdownMenuItem<String>(
                  value: device,
                  child: Text(device),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDevice = newValue;
                    _convertCurrency();
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _convertedAmount > 0
                    ? _convertedAmount.toStringAsFixed(2)
                    : 'TODO!',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
