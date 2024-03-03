import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/category_model/category.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ApiBloc>().add(ApiCategoryListFetchEvent());
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
                  "Category",
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
                  } else if (state is ApiCategorySuccessState) {
                    final categoryList = state.category;
                    return ListView.builder(
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        final Category category = categoryList[index];
                        return CategoryTile(
                          category: category.category ?? "",
                          categoryImage: category.banner_image ?? "",
                        );
                      },
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
