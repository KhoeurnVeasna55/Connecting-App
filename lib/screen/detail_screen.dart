import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/language_controller.dart';
import '../model/top_category_model.dart';
import 'question_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.index});
  final int index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TopCategoryModel _topCategoryModel = TopCategoryModel();
  final LanguageController _languageController = LanguageController();

  @override
  Widget build(BuildContext context) {
    final category = _topCategoryModel.categories[widget.index];

    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          category['language'][_languageController.locale.value.languageCode]
              .toString(),
          style:
              context.textTheme.titleLarge ??
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: context.theme.shadowColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: 78,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const SizedBox(height: 20),
            _buildImage(category),
            const SizedBox(height: 20),
            _buildDescription(category),
            const SizedBox(height: 30),
            Text('Topics', style: context.textTheme.titleMedium),
            const SizedBox(height: 15),
            _buildTopicsList(category),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(Map<String, dynamic> category) {
    return Hero(
      tag: category['image'],
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(category['image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(Map<String, dynamic> category) {
    return Text(
      category['description'][_languageController.locale.value.languageCode]
          .toString(),
      style:
          context.textTheme.bodyLarge ??
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildTopicsList(Map<String, dynamic> category) {
    final topics = category['topics'] as List;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topics.length,
      separatorBuilder: (BuildContext ctx, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final topic = topics[index];
        final isDark = context.isDarkMode;

        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              isDark ? Colors.white : Colors.black,
            ),
            maximumSize: WidgetStateProperty.all<Size>(
              const Size(double.infinity, 100),
            ),
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: isDark ? Colors.white : Colors.black),
              ),
            ),
          ),
          onPressed: () {
            Get.to(
              () => QuestionScreen(index: widget.index, topicIndex: index),
            );
          },
          child: Text(
            topic['language'][_languageController.locale.value.languageCode]
                .toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.black : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
