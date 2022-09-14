import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color(0xFF0ACF83),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white.withAlpha(230),
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                ),
              ),
              const ExpansionTile(
                title: Text('Personal gift'),
                children: [
                  _UnderCategory(
                    nameUnderCategory: 'Personal picture',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: ExpansionTile(
                      title: Text('Personal jewelry'),
                      children: [
                        _UnderCategory(
                          nameUnderCategory: 'Personal ring',
                        ),
                        _UnderCategory(
                          nameUnderCategory: 'Personal earrings',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text('Wood gift'),
                children: [
                  _UnderCategory(
                    nameUnderCategory: 'Wood toys',
                  ),
                  _UnderCategory(
                    nameUnderCategory: 'Wood kitchen board',
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text('Tea cup'),
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _UnderCategory extends StatelessWidget {
  final String nameUnderCategory;

  const _UnderCategory({required this.nameUnderCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        title: Text(nameUnderCategory),
        onTap: () {},
      ),
    );
  }
}
