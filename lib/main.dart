import 'package:flutter/material.dart';

import 'currency_service.dart';

void main() => runApp(CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final CurrencyService _currencyService = CurrencyService();
  double _amount = 1.0;
  String _selectedBaseCurrency = 'USD';
  String _selectedTargetCurrency = 'EUR';
  Map<String, double>? _exchangeRates;

  @override
  void initState() {
    super.initState();
    _loadExchangeRates();
  }

  Future<void> _loadExchangeRates() async {
    try {
      final response =
          await _currencyService.getExchangeRates(_selectedBaseCurrency);
      setState(() {
        _exchangeRates = response['rates'].cast<String, double>();
      });
    } catch (e) {
      print('Error loading exchange rates: $e');
    }
  }

  double _convertCurrency(double amount, String targetCurrency) {
    if (_exchangeRates != null && _exchangeRates!.containsKey(targetCurrency)) {
      return amount * _exchangeRates![targetCurrency]!;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: _exchangeRates == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: '$_amount',
                          decoration: InputDecoration(labelText: 'Amount'),
                          onChanged: (value) {
                            setState(() {
                              _amount = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Flexible(
                        child: DropdownButtonFormField<String>(
                          value: _selectedBaseCurrency,
                          items: _exchangeRates!.keys.map((currency) {
                            return DropdownMenuItem<String>(
                              value: currency,
                              child: Text(currency),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedBaseCurrency = value!;
                              _loadExchangeRates();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text('$_amount $_selectedBaseCurrency ='),
                      ),
                      SizedBox(width: 16.0),
                      Flexible(
                        child: Text(
                            '${_convertCurrency(_amount, _selectedTargetCurrency)} $_selectedTargetCurrency'),
                      ),
                      SizedBox(width: 16.0),
                      Flexible(
                        child: DropdownButtonFormField<String>(
                          value: _selectedTargetCurrency,
                          items: _exchangeRates!.keys.map((currency) {
                            return DropdownMenuItem<String>(
                              value: currency,
                              child: Text(currency),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedTargetCurrency = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
