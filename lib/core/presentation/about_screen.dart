import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/models.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApiBloc>().add(AboutUsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(""),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<ApiBloc, ApiState>(
                builder: (context, state) {
                  if (state is ApiLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    );
                  } else if (state is AboutUsSuccessState) {
                    final aboutUsList = state.aboutUs;
                    return ListView.builder(
                      itemCount: aboutUsList.length,
                      itemBuilder: (context, index) {
                        final AboutUs aboutUs = aboutUsList[index];
                        return AboutTile(
                          title: aboutUs.title ?? "",
                          subtitle: "",
                          image: aboutUs.bannerImage ?? "",
                          content: aboutUs.description ?? "",
                        );
                      },
                    );
                  } else {
                    context.read<ApiBloc>().add(AboutUsFetchEvent());
                    // Handle error state
                    return const Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
