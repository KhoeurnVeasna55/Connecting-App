

import 'package:get/get.dart';

import '../controller/Language_controller.dart';

class TopCategoryModel {
  final LanguageController _languageController = Get.put(LanguageController());
  List<Map<String, dynamic>> categories = [
    {
      "id": 1,
      "language": {"en": "Parents", "km": "ឪពុកម្តាយ"},
      "image": "assets/image/istockphoto-1808764078-612x612.jpg",
      "description": {
        "en":
            "Your parents are the people who have given you life and raised you. They are your first teachers, and they have shaped your values, beliefs, and character.",
        "km":
            "ឪពុកម្តាយគឺជាអ្នកផ្តល់ជីវិត និងចិញ្ចឹមអ្នក។ ពួកគេជាគ្រូដំបូងដែលបង្កើតតម្លៃ និងជំនឿរបស់អ្នក។",
      },
      "isFavorite": true,
      "topics": [
        {
          "id": 1,
          "language": {"en": "Daily Talking", "km": "ការសន្ទនាប្រចាំថ្ងៃ"},
          "questions": [
            {
              "en": "How was your day?",
              "km": "ថ្ងៃនេះអ្នកមានអារម្មណ៍យ៉ាងដូចម្តេច?",
            },
            {
              "en": "What did you eat today?",
              "km": "ថ្ងៃនេះអ្នកបានបរិភោគអ្វីខ្លះ?",
            },
            {
              "en": "Did anything special happen at work or school?",
              "km": "មានអ្វីពិសេសកើតឡើងនៅការងារ ឬសាលារៀនទេ?",
            },
          ],
        },
        {
          "id": 2,
          "language": {"en": "Advice", "km": "ដំបូន្មាន"},
          "questions": [
            {
              "en":
                  "What is the most important lesson your parents taught you?",
              "km": "អ្វីជារង្រួនដ៏សំខាន់បំផុតដែលឪពុកម្តាយបានបង្រៀនអ្នក?",
            },
            {
              "en": "What advice do you give to your kids now?",
              "km": "អ្នកផ្តល់ដំបូន្មានអ្វីទៅកូនៗរបស់អ្នកឥឡូវនេះ?",
            },
            {
              "en": "What would you do differently if you could go back?",
              "km": "បើអាចត្រឡប់ក្រោយ អ្នកនឹងធ្វើអ្វីខុសគ្នាឡើយ?",
            },
          ],
        },
        {
          "id": 3,
          "language": {"en": "Childhood Memories", "km": "អនុស្សាវរីយ៍កុមារភាព"},
          "questions": [
            {
              "en": "What was I like as a child?",
              "km": "កាលពីខ្ញុំនៅក្មេង ខ្ញុំនឹងមានអាកប្បកិរិយាយ៉ាងដូចម្តេច?",
            },
            {
              "en": "Do you remember any funny moments from my childhood?",
              "km": "តើអ្នកចាំពេលវេលារីករាយពីកុមារភាពរបស់ខ្ញុំបានទេ?",
            },
            {
              "en": "What toy did I love the most?",
              "km": "តើអ្នកចាំបានទេថាខ្ញុំចូលចិត្តរូបល្បែងណាច្រើនបំផុត?",
            },
          ],
        },
      ],
    },
    {
      "id": 2,
      "language": {"en": "Couple", "km": "គូស្នេហ៍"},
      "image": "assets/image/istockphoto-157676310-612x612.jpg",
      "description": {
        "en":
            "Couples share love, commitment, and support. This bond helps build a foundation of trust and emotional connection.",
        "km":
            "គូស្នេហ៍ចែករំលែកសេចក្ដីស្រលាញ់ ការប្តេជ្ញា និងការគាំទ្រ។ ទំនាក់ទំនងនេះជាស្រទាប់គ្រឹះនៃការជឿជាក់ និងទំនាក់ទំនងផ្លូវចិត្ត។",
      },
      "isFavorite": false,
      "topics": [
        {
          "id": 1,
          "language": {"en": "Relationship Goals", "km": "គោលបំណងទំនាក់ទំនង"},
          "questions": [
            {
              "en": "What do you want our future to look like?",
              "km": "អ្នកចង់ឲ្យអនាគតរបស់យើងមានរូបរាងយ៉ាងដូចម្តេច?",
            },
            {
              "en": "How do we grow together as a couple?",
              "km": "យើងអាចអភិវឌ្ឍរួមគ្នាជាគូស្នេហ៍យ៉ាងដូចម្តេច?",
            },
            {
              "en": "What do you admire most about me?",
              "km": "អ្វីដែលអ្នកគោរពជាពិសេសអំពីខ្ញុំ?",
            },
          ],
        },
        {
          "id": 2,
          "language": {"en": "Daily Check-In", "km": "សួរសុខទុក្ខប្រចាំថ្ងៃ"},
          "questions": [
            {
              "en": "How are you feeling today?",
              "km": "ថ្ងៃនេះអ្នកមានអារម្មណ៍យ៉ាងដូចម្តេច?",
            },
            {
              "en": "Is there anything bothering you?",
              "km": "មានអ្វីខ្លះកំពុងធ្វើឲ្យអ្នកកក់ក្ដៅទេ?",
            },
            {
              "en": "What can I do to support you more?",
              "km": "ខ្ញុំអាចធ្វើអ្វីបានដើម្បីគាំទ្រអ្នកបន្ថែមទៀត?",
            },
          ],
        },
        {
          "id": 3,
          "language": {"en": "Memories", "km": "អនុស្សាវរីយ៍"},
          "questions": [
            {
              "en": "What was your first impression of me?",
              "km": "អ្វីជាការចាប់អារម្មណ៍ដំបូងរបស់អ្នកចំពោះខ្ញុំ?",
            },
            {
              "en": "What’s your favorite memory of us together?",
              "km": "អនុស្សាវរីយ៍ណាដែលអ្នកចូលចិត្តបំផុតនៃពេលវេលារួមគ្នា?",
            },
            {
              "en": "What little thing do I do that makes you smile?",
              "km": "អ្វីដែលខ្ញុំធ្វើតូចៗដែលធ្វើឲ្យអ្នកញញឹម?",
            },
          ],
        },
      ],
    },
    {
      "id": 4,
      "language": {"en": "Best Friend", "km": "មិត្តភក្តិល្អបំផុត"},
      "image": "assets/image/depositphotos_18784165-stock-photo-young-friends.jpg",
      "description": {
        "en":
            "Best friends are like chosen family — they stand by you through laughter and tears, sharing your highs and lows.",
        "km":
            "មិត្តភក្តិល្អបំផុតគឺដូចជាគ្រួសារដែលបានជ្រើសរើស។ ពួកគេនៅក្បែរអ្នកក្នុងសំណើចនិងទឹកភ្នែក ដោយចែករំលែកទាំងអំណះអំណាងនិងអំពើរលំបាក។",
      },
      "isFavorite": false,
      "topics": [
        {
          "id": 1,
          "language": {"en": "Fun & Random", "km": "កម្សាន្ត និង ចៃដន្យ"},
          "questions": [
            {
              "en":
                  "If you could teleport anywhere right now, where would you go?",
              "km": "បើអ្នកអាចផ្លាស់ទីទៅកន្លែងណាមួយភ្លាមៗ អ្នកនឹងទៅណា?",
            },
            {
              "en": "What’s the dumbest thing we’ve ever done together?",
              "km": "អ្វីជារឿងឆ្កួតបំផុតដែលយើងធ្វើរួមគ្នា?",
            },
            {
              "en": "If your life were a movie, what would the title be?",
              "km": "បើជីវិតអ្នកជាភាពយន្ត ចំណងជើងនឹងជាអ្វី?",
            },
          ],
        },
        {
          "id": 2,
          "language": {"en": "Real Talk", "km": "ការសន្ទនាដែលមានន័យ"},
          "questions": [
            {
              "en": "What’s something you’ve been thinking about lately?",
              "km": "ពេលនេះមានរឿងអ្វីដែលអ្នកបានគិតច្រើន?",
            },
            {
              "en":
                  "What’s one thing you wish more people understood about you?",
              "km": "មានអ្វីមួយដែលអ្នកសង្ឃឹមឲ្យមនុស្សជាច្រើនយល់អំពីអ្នក?",
            },
            {
              "en": "What scares you the most about the future?",
              "km": "អ្វីធ្វើឲ្យអ្នកភ័យខ្លាចបំផុតអំពីអនាគត?",
            },
          ],
        },
      ],
    },
  ];

  void changeLanguage(String langCode) {
    _languageController.changeLanguage(langCode);
  }

  String get currentLanguage => _languageController.locale.value.languageCode;

  String getCategoryName(int index) {
    return categories[index]['language'][currentLanguage] ?? '';
  }

  String getCategoryDescription(int index) {
    return categories[index]['description'][currentLanguage] ?? '';
  }

  String getTopicName(int categoryIndex, int topicIndex) {
    return categories[categoryIndex]['topics'][topicIndex]['language'][currentLanguage] ?? '';
  }

  List<String> getTopicQuestions(int categoryIndex, int topicIndex) {
    final questions = categories[categoryIndex]['topics'][topicIndex]['questions'];
    return questions
        .map<String>((q) => q[currentLanguage] ?? '')
        .toList();
  }
}

