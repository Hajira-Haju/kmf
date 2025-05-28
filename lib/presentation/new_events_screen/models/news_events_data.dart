import 'package:get/get.dart';

class NewsEventsData {
  static RxList<String> choiceData = <String>['All', 'News', 'Events'].obs;

  static List<LatestNews> latestNews = [
    LatestNews(
      imgUrl: 'http://kmfkuwait.com/img/22.jpg',
      description:
          'KMF Kuwait proudly presents \"Aardram 2025,\" a heartfelt celebration honoring the dedication of nurses and lab professionals for their vital roles in healthcare and humanity.',
      title: '"Aardram 2025" Celebrating Nurses Day & Lab Day',
    ),
    LatestNews(
      imgUrl: 'http://kmfkuwait.com/img/1.jpg',
      description:
          'KMF Kuwait proudly celebrates International Nurses Day, honoring the dedication, compassion, and tireless service of nurses who make a difference in lives every single day.',
      title: 'Celebrating International Nurses Day',
    ),
    LatestNews(
      imgUrl: 'http://kmfkuwait.com/img/3.jpg',
      description:
          'കല കുവൈറ്റ് നടത്തിയ സാഹിത്യ മത്സരങ്ങളിൽ വിജയകളായ കെ.എം.ഫ് കേന്ദ്രകമ്മിറ്റിയംഗങ്ങൾ ലിപി പ്രസീദ്, ജോബി ബേബി എന്നിവർക്ക് അഭിനന്ദങ്ങൾ',
      title: 'സാഹിത്യ മത്സരങ്ങളിൽ വിജയകളായി.',
    ),
  ];

  static List<LatestNews> newsList = [
    LatestNews(
      imgUrl:
          'https://static.langimg.com/thumb/121359614/samayam-malayalam-121359614.jpg?imgsize=1860666&width=540&height=304&resizemode=75',
      description:
          'കേരളത്തിൽ അതിതീവ്ര മഴയ്ക്ക് സാധ്യതയെന്ന് കേന്ദ്ര കാലാവസ്ഥാ വകുപ്പിന്റെ മുന്നറിയിപ്പ്. വെള്ളിയാഴ്ച 6 ...',
      title:
          'അറബിക്കടലിൽ ന്യൂനമർദം, മഴ കനക്കും; നാളെ 2 ജില്ലകളിൽ റെ‍ഡ് അലർട്ട്, ഇന്ന് 6 ജില്ലകളിൽ ഓറഞ്ച് അലർട്ട്...',
    ),

    LatestNews(
      imgUrl:
          'https://static.toiimg.com/thumb/msid-121340748,imgsize-93128,width-400,resizemode-4/121340748.jpg',
      description:
          'Sivakumar attended the screening of \'Charukesi\' at Four Frames Preview Theatre in Chennai. Among those spotted at the event were director Suresh Krissna, art director Thota Tharani, Sindhu Bhairavi co-stars Sivakumar and Suhasini and others.Veteran artistes and film personalities were special invitee',
      title:
          'Sivakumar attended the screening of \'Charukesi\' at Four Fram ..',
    ),

    LatestNews(
      imgUrl:
          'https://c.ndtvimg.com/2023-03/2vl2sq2_bengaluru-generic-getty-_625x300_29_March_23.jpg?downsize=773:435',
      description:
          '''A Bengaluru-based man alleged that he was denied parking after he asked someone to move aside in Hindi. Following the incident, the man, a software engineer at Google, argued that English should become India\'s mandatory language.
      In a LinkedIn post, Arpit Bhayani said, "Today, I was denied parking just because I asked the person to move aside in Hindi." He added that most parents, even in small towns and rural areas, preferred sending their children to English-medium schools.''',
      title:
          'Make English Mandatory": Google Techie Claims Denied Parking In Bengaluru Over Hindi ',
    ),
  ];
}

class LatestNews {
  final String imgUrl;
  final String description;
  final String title;
  LatestNews({
    required this.imgUrl,
    required this.description,
    required this.title,
  });
}
