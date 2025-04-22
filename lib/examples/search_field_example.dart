import 'package:flutter/material.dart';
import '../widgets/search_field.dart';

class SearchFieldExample extends StatefulWidget {
  const SearchFieldExample({Key? key}) : super(key: key);

  @override
  _SearchFieldExampleState createState() => _SearchFieldExampleState();
}

class _SearchFieldExampleState extends State<SearchFieldExample> {
  final TextEditingController _searchController = TextEditingController();
  String _searchResults = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic search field
            AppSearchField(
              controller: _searchController,
              hintText: 'Search',
              onChanged: (value) {
                setState(() {
                  _searchResults = 'Typing: $value';
                });
              },
              onSubmitted: (value) {
                setState(() {
                  _searchResults = 'Submitted: $value';
                });
              },
            ),

            const SizedBox(height: 24),

            // Search field with clear button
            AppSearchField(
              hintText: 'Search with clear button',
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchResults = '';
                        });
                      },
                    )
                  : null,
            ),

            const SizedBox(height: 24),

            // Disabled search field
            const AppSearchField(
              hintText: 'Disabled search field',
              isDisabled: true,
            ),

            const SizedBox(height: 32),

            // Display search results
            if (_searchResults.isNotEmpty)
              Text(
                _searchResults,
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
