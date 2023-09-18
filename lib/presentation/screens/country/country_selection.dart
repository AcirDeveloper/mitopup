import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/config/config.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../../data/data.dart';

class CountrySelectionScreen extends StatefulWidget {
  final List<CountryEntity> countries;
  final CountryEntity? selectedCountry;

  const CountrySelectionScreen({
    super.key,
    required this.countries,
    this.selectedCountry,
  });

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  List<CountryEntity> countries = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      final fetchedCountries = await CountryServices.fetchCountries();
      setState(() {
        countries = fetchedCountries;
      });
    } catch (error) {
      // Manejar el error aquí
      print('Error: $error');
    }
  }

  void filterCountries(String query) {
    setState(() {
      countries
          .where((country) =>
              country.countryName.toLowerCase().contains(query.toLowerCase()) ||
              country.countryCode.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(),
        ),
        title: Center(
          child: Text(
            capitalize(Literals.of(context).textCountryPhone),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              // todo: onChanged: filterCountries,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: capitalize(Literals.of(context).search_country),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: HexColor("#D2D5DA")),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: HexColor("#0743DF")),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Image.network(
                            country.flag ?? 'Sin data',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8.0),
                          Text(country.countryName ?? 'Sin name country'),
                          const SizedBox(width: 8.0),
                          Text(country.countryCode ?? 'Sin code country'),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context, country);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
