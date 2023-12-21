import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_20/model/travel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CampingWidget(
        trable: Travle(
          id: 1,
          title: "여행지",
          description: "괌은 이쁘다.",
          subTitle: "괌?",
          imgUrl: 'https://content.skyscnr.com/m/59fa7024f4b6f2a2/original/shutterstock_1923629816.jpg?crop=1224px:647px&quality=100&position=attention',
        ),
      ),
    );
  }
}

class CampingWidget extends StatefulWidget {
  final Travle trable;

  const CampingWidget({super.key, required this.trable});

  @override
  State<CampingWidget> createState() => _CampingWidgetState();
}

class _CampingWidgetState extends State<CampingWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 윗 설정바(노티바) 공간 안쓰게 하기
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.trable.imgUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              secondArea(),
              thirdArea(),
              forthArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget secondArea() {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.trable.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.trable.subTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              isFavorite = !isFavorite;
              setState(() {});
            },
            child: Row(
              children: [
                Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: Colors.red,
                ),
                Text("41"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget thirdArea() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButtonWidget(
          icon: Icon(
            Icons.phone,
            color: Colors.lightBlueAccent,
          ),
          title: Text('CALL', style: TextStyle(color: Colors.lightBlueAccent)),
        ),
        IconButtonWidget(
          icon: Icon(
            Icons.near_me,
            color: Colors.lightBlueAccent,
          ),
          title: Text('ROUTE', style: TextStyle(color: Colors.lightBlueAccent)),
        ),
        IconButtonWidget(
          icon: Icon(
            Icons.share,
            color: Colors.lightBlueAccent,
          ),
          title: Text('SHARE', style: TextStyle(color: Colors.lightBlueAccent)),
        ),
      ],
    );
  }

  Widget forthArea() {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Text(
        widget.trable.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final Text title;
  final Icon icon;

  const IconButtonWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        title,
      ],
    );
  }
}
