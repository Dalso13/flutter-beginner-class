import 'package:flutter_beginner_class/23_12_20/model/travel.dart';

// 계속쓸 데이터
class TravelRepository {
  List<Travle> getTrable() {
    return [
      Travle(
        id: 1,
        title: "여행지",
        description: "괌은 이쁘다.",
        subTitle: "괌?",
        imgUrl: 'https://content.skyscnr.com/m/59fa7024f4b6f2a2/original/shutterstock_1923629816.jpg?crop=1224px:647px&quality=100&position=attention',
      ),
      Travle(
        id: 2,
        title: "여행지",
        description: "일본은 이쁘다.",
        subTitle: "일본",
        imgUrl: 'https://a.cdn-hotels.com/gdcs/production127/d1781/ac9d03ef-22b4-4330-8e8d-695093138cf4.jpgㅁ',
      ),
    ];
  }
}