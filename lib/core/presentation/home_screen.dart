import 'package:flutter/material.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomSearchBar(),
          const SizedBox(
            height: 10,
          ),
          ListView(
            children: const [
              ListTile(
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              ListTile(
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              ListTile(
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              ListTile(
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              ListTile(
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
