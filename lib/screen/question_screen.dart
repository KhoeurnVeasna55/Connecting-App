import 'package:connecting_app/controller/quesiton_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/language_controller.dart';
import '../model/top_category_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.index,
    required this.topicIndex,
  });

  final int index;
  final int topicIndex;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final TopCategoryModel topCategoryModel = TopCategoryModel();
  final LanguageController _languageController = LanguageController();
  final QuestionController _questionController = Get.find();
  @override
  void initState() {
    super.initState();
    _questionController.loadQuestions(widget.index, widget.topicIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = _languageController.locale.value.languageCode;
    final topic =
        topCategoryModel.categories[widget.index]['topics'][widget.topicIndex];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            topic['language'][currentLocale] ?? 'No title',
            style: context.textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color:
                      context.isDarkMode
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          leadingWidth: 64,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Obx(() {
                if (_questionController.questions.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  height: context.height * 0.6,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color:
                        context.isDarkMode
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      _questionController.currentQuestionText,
                      style: context.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buttonWidget(
                    const Icon(Icons.keyboard_arrow_left_outlined),
                    _questionController.previousQuestion,
                  ),
                  _buttonWidget(
                    const Icon(Icons.keyboard_arrow_right_outlined),
                    _questionController.nextQuestion,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonWidget(Widget icon, void Function()? onPressed) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          context.isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      onPressed: onPressed,
      label: icon,
    );
  }
}
