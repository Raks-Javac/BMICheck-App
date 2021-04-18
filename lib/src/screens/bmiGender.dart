import 'package:bmi_checker/src/inheritedState.dart';
import 'package:bmi_checker/src/model/image.dart';
import 'package:bmi_checker/src/theme/constants.dart';
import 'package:flutter/material.dart';

final Decoration kActiveButtonColor2 = BoxDecoration(
  gradient: LinearGradient(colors: [
    gradientStartColor,
    gradientEndColor,
  ]),
  borderRadius: BorderRadius.circular(50),
);
final Decoration kInActiveButtonColor2 = BoxDecoration();

class BmiSelectGender extends StatelessWidget {
  Widget _gender(GenderImage genderImage, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "${genderImage.imagePath}",
          ),
        ),
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[800],
      ),
      height: 400,
      width: MediaQuery.of(context).size.width / 1.3,
      margin: EdgeInsets.only(
        left: 52,
        top: 30,
        bottom: 10,
        right: 52,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _container = StateContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Gender",
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
                flex: 2.toInt(),
                child: Container(
                    width: double.infinity,
                    child: TabBarView(
                        controller: _container.tabController,
                        children: _container
                            .genderPictureList()
                            .map((genderImage) => _gender(genderImage, context))
                            .toList()))),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black12,
                          )
                        ]),
                    width: MediaQuery.of(context).size.width / 1.15,
                    child: TabBar(
                        controller: _container.tabController,
                        indicator: kActiveButtonColor2,
                        unselectedLabelStyle: TextStyle(color: Colors.grey),
                        unselectedLabelColor: Colors.black12,
                        tabs: [
                          Tab(
                            child: ButtonText(
                              buttonText: "Female",
                            ),
                          ),
                          Tab(
                            child: ButtonText(
                              buttonText: "Male",
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RawMaterialButton(
                    constraints: BoxConstraints(minWidth: 50),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String buttonText;
  const ButtonText({this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$buttonText",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

//  ListView(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 400,
//                   color: gradientEndColor,
//                 )
//               ],
//             )
