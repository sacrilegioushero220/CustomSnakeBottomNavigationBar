import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/models/category_model/category.dart';
import 'package:jeevan_diabetes_app/core/presentation/search_results_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/category_tile.dart';
import 'package:jeevan_diabetes_app/network/api_service.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApiBloc>().add(CategoryListFetchEvent());
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
                  } else if (state is CategorySuccessState) {
                    final categoryList = state.category;
                    return ListView.builder(
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        final Category category = categoryList[index];
                        return CategoryTile(
                          category: category.category_name ?? "",
                          categoryImage: category.banner_image ?? "",
                          onTap: () {
                            // context.read<ApiBloc>().add(
                            //     CategoryVideosFetchEvent(category.id ?? ""));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: context.read<ApiBloc>(),
                                  child: ResultsPage(
                                    isSearchNeeded: false,
                                    title: category.category_name ?? "",
                                    future: ApiService()
                                        .fetchCategoryVideos(category.id ?? ""),
                                  ),
                                ),
                              ),
                            );
                          },
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
