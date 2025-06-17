import 'package:connecting_app/controller/language_controller.dart';
import 'package:connecting_app/l10n/app_localizations.dart';
import 'package:connecting_app/model/top_category_model.dart';
import 'package:connecting_app/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TopCategoryModel _categoryModel = TopCategoryModel();
  final LanguageController _languageController = LanguageController();
  final double _spaceHeight = 30;


  @override
  Widget build(BuildContext context) {
    final AppLocalizations tran = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, ), 
          child: Column(
            spacing: _spaceHeight,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_showAvatar, _showNotification],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: context.width * 0.7,
                  child: Text(
                    tran.letMakeYour,
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tran.topcategory, style: context.textTheme.bodyMedium),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      tran.viewALL,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Color(0xffFF7029),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.3,
                width: double.infinity,
                child: _buildTopCategoryList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get _showNotification => CircleAvatar(
    backgroundColor:context.isDarkMode ? Colors.white.withValues(alpha: 0.1): Colors.black.withValues(alpha: 0.1),

    radius: 25,
    child: Icon(
      Icons.notifications,
      size: 30,
      color: context.isDarkMode ? Colors.white : Colors.black,
    ),
  );

  get _showAvatar => Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: context.isDarkMode ? Colors.white.withValues(alpha: 0.1): Colors.black.withValues(alpha: 0.1),
    ),
    child: Row(
      spacing: 8,
      children: [
        CircleAvatar(
          minRadius: 23,
          backgroundImage: AssetImage(
            'assets/image/—Pngtree—creative boys avatar_17327785.png',
          ),
        ),
        Text('User name'),
      ],
    ),
  );
  Widget _buildTopCategoryList(BuildContext context) {
    return ListView.separated(
      itemCount: _categoryModel.categories.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: false,
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemBuilder: (BuildContext ctx, index) {
        final category = _categoryModel.categories[index];
        bool isFavorite = category['isFavorite'];
        return GestureDetector(
          onTap: () {
            Get.to(() => DetailScreen(index: index));
          },
          child: Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  blurRadius: 3,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: category['image'],
                      child: Image.asset(category['image'], fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Text(
                        category['language'][_languageController
                                .locale
                                .value
                                .languageCode] ??
                            'Unknown',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Koulen',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.2),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _categoryModel.categories[index]['isFavorite'] =
                                  !_categoryModel
                                      .categories[index]['isFavorite'];
                            });
                          },
                          icon: Icon(
                            isFavorite == true
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                          color:
                              isFavorite == true ? Colors.yellow : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget _typeofCategory() {
  //   return ListView.separated(
  //     itemBuilder: (BuildContext ctx, index) {
  //       return Container(
  //         width: context.width * 0.2,
  //         height: context.height * 0.03,
  //         decoration: BoxDecoration(
  //           color: _typeCategoryModel.colors[index].withValues(alpha: 0.2),
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(color: Colors.white),
  //         ),
  //         child: Center(
  //           child: Text(_typeCategoryModel.typeofCategory[index]['name']),
  //         ),
  //       );
  //     },
  //     scrollDirection: Axis.horizontal,
  //     separatorBuilder:
  //         (BuildContext context, index) => const SizedBox(width: 16),
  //     itemCount: _categoryModel.categories.length,
  //   );
  // }
}
