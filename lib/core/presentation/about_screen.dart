import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/models.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ApiBloc>().add(AboutUsFetchEvent());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const CustomSearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "About",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
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
                      child: CircularProgressIndicator(),
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
                    // Handle error state
                    return const Center(
                      child: Text('Failed to fetch About Us'),
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
