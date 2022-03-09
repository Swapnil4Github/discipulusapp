import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'https://www.umeacademy.com/wp-content/uploads/2021/06/LPUNEST-2021-Application-Form-Extended.jpg',
  'https://www.fosslinux.com/wp-content/uploads/2020/02/GSoC-2020.png',
  'https://scontent.flko7-2.fna.fbcdn.net/v/t1.6435-9/49494433_10156682895276590_6530934318338932736_n.png?_nc_cat=107&ccb=1-5&_nc_sid=e3f864&_nc_ohc=64EtoKIhCxsAX8ZmTSq&_nc_ht=scontent.flko7-2.fna&oh=00_AT-bRe7cvqfoERgETkE8URteafWbD64wHkHP6YIqaDakWg&oe=624ACFA5',
  'https://i0.wp.com/fullopportunities.com/wp-content/uploads/2021/07/Microsoft-Internship-Opportunity-2021-Fully-Funded.jpg',
  'https://theinterviewguys.com/wp-content/uploads/2020/08/apple-interview-questions.png',
  'https://tbcdn.talentbrew.com/company/3413/v3_0/img/amazondelivers-social-share.jpg',
];

final List<String> titles = [
  'LPU Campus',
  ' Google ',
  'LPU ',
  ' Microsoft ',
  ' Apple ',
  ' Amazon ',
];
class HomeSlider extends StatefulWidget {
  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(
                    () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imagesList
              .map(
                (item) =>  Card(
                margin: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                elevation: 6.0,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                   Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),

                      // Positioned(
                      //   left: 20,
                      //   bottom: 10,
                      //   child: Text(
                      //     '${titles[_currentIndex]}',
                      //     style: TextStyle(
                      //       fontSize: 24.0,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

          )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesList.map((urlOfItem) {
            int index = imagesList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.8)
                    : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

