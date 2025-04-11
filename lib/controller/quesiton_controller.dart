
// import 'package:connecting_app/model/top_category_model.dart';
// import 'package:get/get.dart';
// class QuesitonController extends GetxController {
//   final TopCategoryModel _topCategoryModel = TopCategoryModel();
//   final currentLocale = Get.locale?.languageCode ?? 'en';
//   final currentIndex = 0.obs;
//   final questions = [].obs;
//   late int categoryIndex;
//   late int topicIndex;

//   void laodQuestions(int cateIndex, int topIndex) {
//     categoryIndex = cateIndex;
//     topicIndex = topIndex;
//     final topic =
//         _topCategoryModel.categories[categoryIndex]['topics'][topicIndex];
//     questions.value = (topic['questions'] as List<dynamic>);
//     currentIndex.value = 0;
//   }
//   void nextQestion (){
//     if(currentIndex.value <questions.length -1 ){
//       currentIndex.value++;
//     }
//   }
//   void previousQuestion(){
//     if(currentIndex.value > 0){
//       currentIndex.value--;
//     }
//   }
// }
import 'package:connecting_app/controller/Language_controller.dart';
import 'package:connecting_app/model/top_category_model.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  final TopCategoryModel _topCategoryModel = TopCategoryModel();
    final LanguageController _languageController = LanguageController();

  late String currentLocale;

  final currentIndex = 0.obs;
  final questions = <Map<String, String>>[].obs;

  late int categoryIndex;
  late int topicIndex;

  void loadQuestions(int cateIndex, int topIndex) {
    categoryIndex = cateIndex;
    topicIndex = topIndex;

    final topic = _topCategoryModel.categories[categoryIndex]['topics'][topicIndex];
    questions.value = (topic['questions'] as List)
        .map((q) => Map<String, String>.from(q))
        .toList();

    currentIndex.value = 0;
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    }
  }

  void previousQuestion() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    currentLocale = _languageController.locale.value.languageCode;
  }

  String get currentQuestionText =>
      questions.isNotEmpty ? questions[currentIndex.value][currentLocale] ?? '' : '';
}

