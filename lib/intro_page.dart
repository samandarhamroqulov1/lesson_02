import 'package:flutter/material.dart';
import 'package:lesson_02/home_page.dart';
import 'package:lesson_02/title_utils.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";

  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Skip",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                index = page;
              });
            },
            children: [
              makePage(
                image: "assets/img.png",
                title: TitleUtils.stepOneTitle,
                title2: TitleUtils.stepOneContent,
              ),
              makePage(
                image: "assets/img_1.png",
                title: TitleUtils.stepTwoTitle,
                title2: TitleUtils.stepTwoContent,
              ),
              makePage(
                image: "assets/img_2.png",
                title: TitleUtils.stepThreeTitle,
                title2: TitleUtils.stepThreeContent,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children:buildIndecator()


            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, title2}) {
    return Container(
        padding: EdgeInsets.only(
          left: 50,
          right: 50,
          bottom: 60,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 400,
                child: Image.asset(image),
              )
            ),
            SizedBox(
              height: 30,
            ),
            Text(title,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Text(title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ));
  }
  Widget indecator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive? 30:6,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.black, ),

    );
  }


  List <Widget> buildIndecator(){
    List <Widget> indecotors=[];
    for(int i=0;i<3;i++){
      if(index==i){
         indecotors.add(indecator(true));
      }
      else{
        indecotors.add(indecator(false));
      }
    }
    return indecotors;
  }
}
