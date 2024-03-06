import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/models.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUs contactUs = const ContactUs();
    context.read<ApiBloc>().add(ContactUsFetchEvent());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Contact",
                    style: GoogleFonts.beVietnamPro(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<ApiBloc, ApiState>(
                builder: (context, state) {
                  if (state is ApiLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ContactUsSuccessState) {
                    contactUs = state.contactUs;
                    return Column(
                      children: [
                        Text(
                          contactUs.description ?? '',
                          style: GoogleFonts.beVietnamPro(
                            color: const Color(0xFFA4A4A4),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SupportCard(
                          phone: contactUs.phone ?? "",
                          mobile: contactUs.mobile ?? "",
                          googleMap: contactUs.googleMap ?? "",
                        ),
                        const SizedBox(height: 20),
                        SocialMediaCard(
                          instagramLink: contactUs.instagramLink ?? "",
                          facebookLink: contactUs.facebookLink ?? "",
                          youTubeLink: contactUs.youtubeLink ?? "",
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contactUs.address ?? "",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.beVietnamPro(
                            color: const Color(0xFF242A2F),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            height: 1.11,
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Handle error state
                    return const Center(
                      child: Text('Failed to fetch Category List'),
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
