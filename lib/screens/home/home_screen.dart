
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uorfindproject/screens/PrayerRoom/prayer_room.dart';

import '../BedeHouse/bede_house.dart';
import '../Cafe/cafe.dart';
import '../Library/library.dart';
import '../QueemBuilding/queen_building.dart';
import '../Richardson/richardson.dart';
import '../SouthlandColllege/southland_college.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  final List<GridItem> gridItems = [
    GridItem(title: 'Richardson', icon: Icons.account_balance),
    GridItem(title: 'Bede house', icon: Icons.house),
    GridItem(title: 'Cafe', icon: Icons.local_cafe),
    GridItem(title: 'Library', icon: Icons.library_books),
    GridItem(title: 'Richardson', icon: Icons.account_balance),
    GridItem(title: 'Bede house', icon: Icons.house),
    GridItem(title: 'Cafe', icon: Icons.local_cafe),
    GridItem(title: 'Library', icon: Icons.library_books),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber.shade600,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          title: Text(
            'UOR FIND',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_important_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
             ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: [
                      Image.asset("assets/1.jpeg", fit: BoxFit.cover),
                      Image.asset("assets/2.jpeg", fit: BoxFit.cover),
                      Image.asset("assets/3.jpeg", fit: BoxFit.cover),
                      Image.asset("assets/4.jpeg", fit: BoxFit.cover),
                      Image.asset("assets/5.jpeg", fit: BoxFit.cover),
                    ],
                    carouselController: carouselController,
                    options: CarouselOptions(
                      aspectRatio: 30,
                      pageSnapping: true,
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,

                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    child: SmoothPageIndicator(
                      controller: PageController(initialPage: currentIndex),
                      count: 5,
                      effect: WormEffect(
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        activeDotColor: Colors.amber.shade600,
                        dotColor: Colors.grey.shade300,
                      ),
                      onDotClicked: (index) {
                        carouselController.animateToPage(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: gridItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => getScreenByIndex(index),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.shade600,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              gridItems[index].icon,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              gridItems[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getScreenByIndex(int index) {
    switch (index) {
      case 0:
        return RichardsonScreen();
      case 1:
        return BedeHouseScreen();
      case 2:
        return CafeScreen();
      case 3:
        return LibraryScreen();
      case 4:
        return QueenBuilding();
      case 5:
        return  const SouthLandCollege();
      case 6:
        return const PrayerRoom();
      default:
        return HomeScreen();
    }
  }
}

class GridItem {
  final String title;
  final IconData icon;

  GridItem({required this.title, required this.icon});
}
