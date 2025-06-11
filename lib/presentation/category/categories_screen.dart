import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sodakku/presentation/category/category_bloc.dart';
import 'package:sodakku/presentation/category/category_event.dart';
import 'package:sodakku/presentation/category/category_state.dart';
import 'package:sodakku/model/category/category_model.dart';
import 'package:sodakku/model/category/main_category_model.dart';
import 'package:sodakku/presentation/productlist/product_list_screen.dart';
import 'package:sodakku/presentation/widgets/network_image.dart';
import 'package:sodakku/utils/constant.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static List<Category> categories = [];
  static MainCategory mainCategory = MainCategory();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is MainCategoryLoadedState) {
            debugPrint("mainCategoryLoaded");
            mainCategory = state.mainCategory;
          } else if (state is CategoryLoadedState) {
            debugPrint("CategoryLoadedState");
            categories = state.categories;
          } else if (state is CategoryErrorState) {
            debugPrint("CategoryErrorState");
          }
        },
        builder: (context, state) {
          if (state is CategoryInitialState) {
            debugPrint("CategoryInitialState");
            context.read<CategoryBloc>().add(GetMainCategoryDataEvent());
            context.read<CategoryBloc>().add(GetCategoryDataEvent());
          }
          return OverlayLoaderWithAppIcon(
            appIconSize: 60,
            circularProgressColor: Colors.transparent,
            overlayBackgroundColor: Colors.black87,
            isLoading: state is CategoryLoadingState,
            appIcon: Image.asset(loadGif, fit: BoxFit.fill),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explore by Categories',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (mainCategory.data != null)
                          Visibility(
                            visible: mainCategory.data!.length > 2,
                            child: Row(
                              children: [
                                const Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF034703),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Icon(Icons.arrow_forward_ios_rounded, size: 14),
                              ],
                            ),
                          ),
                      ],
                    ),
                    Row(
                      spacing: 16,
                      children: [
                        if (mainCategory.data != null)
                          for (int i = 0; i < mainCategory.data!.length; i++)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  title = mainCategory.data![i].name ?? "";
                                  id = mainCategory.data![i].id ?? "";
                                  isMainCategory = true;
                                  mainCatId = mainCategory.data![i].id ?? "";
                                  isCategory = false;
                                  catId = "";
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductListMenuScreen(
                                            title:
                                                mainCategory.data![i].name ??
                                                "",
                                            id: mainCategory.data![i].id ?? "",
                                            isMainCategory: true,
                                            mainCatId:
                                                mainCategory.data![i].id ?? "",
                                            isCategory: false,
                                            catId: "",
                                          ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 97,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE5EEC3),
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: greyColor,
                                            blurRadius: 4,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: ImageNetwork(
                                          url:
                                              mainCategory.data![i].imageUrl ??
                                              "",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      mainCategory.data![i].name ?? "",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF222222),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                    SizedBox(),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        double itemWidth =
                            (screenWidth - (22 * 2)) /
                            3; // Adjust for crossAxisSpacing
                        double itemHeight =
                            itemWidth * 1.2; // Adjust height dynamically

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 22,
                                childAspectRatio:
                                    itemWidth /
                                    itemHeight, // Dynamic aspect ratio
                              ),
                          itemCount: categories.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                title = categories[i].name ?? "";
                                id = categories[i].id ?? "";
                                isMainCategory = false;
                                mainCatId = "";
                                isCategory = true;
                                catId = categories[i].id ?? "";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListMenuScreen(
                                      title: categories[i].name ?? "",
                                      id: categories[i].id ?? "",
                                      isMainCategory: false,
                                      mainCatId: "",
                                      isCategory: true,
                                      catId: categories[i].id ?? "",
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        itemHeight *
                                        0.6, // Dynamically adjust height
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE5EEC3),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: greyColor,
                                          blurRadius: 4,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ImageNetwork(
                                          url: categories[i].imageUrl ?? "",
                                          fit: BoxFit.contain,
                                          width:
                                              itemWidth *
                                              0.8, // Adjust image width dynamically
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width:
                                        itemWidth *
                                        0.9, // Ensure text fits within item width
                                    child: Text(
                                      categories[i].name ?? "",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF222222),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    /* GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 22,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: productsList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 97,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE5EEC3),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: greyColor,
                                        blurRadius: 4,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  ImageNetwork(url:
                                        productsList[index]["image"],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  productsList[index]["name"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                              ],
                            );
                          },
                        ) */
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
