import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 104, 48),
        title: const Text(
          'Venture',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Colors.transparent), // remove background
              elevation: MaterialStateProperty.all(0), // remove elevation
              foregroundColor: MaterialStateProperty.all(
                  Colors.black), // change icon color to black
            ),
            icon: const Icon(
              Icons.search,
              size: 24.0,
            ),
            label: const Text('Search'),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 134, 104, 48),
              ),
              child: Text(""),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Add your action here
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                // Add your action here
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Add your action here
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CarouselSlider(
                items: [
                  Image.asset('Asset/Screenshot (248).png'),
                  Image.asset('Asset/Screenshot (261).png'),
                  Image.asset('Asset/Screenshot (254).png'),
                  Image.asset('Asset/Screenshot (251).png'),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // add gap between categories
                  children: categories.map((category) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            //
                          },
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.only(
                                left: 5,
                                right:
                                    5), // add margin left and right to each category
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: category.color,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 0.5,
                                  blurRadius: 1.5,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final Color color;
  final Icon icon;

  Category({
    required this.name,
    required this.color,
    required this.icon,
  });
}

List<Category> categories = [
  Category(
    icon: Icon(Icons.fireplace),
    name: 'Culture',
    color: const Color.fromARGB(255, 134, 104, 48),
  ),
  Category(
    icon: Icon(Icons.nature),
    name: 'Nature',
    color: const Color.fromARGB(255, 134, 104, 48),
  ),
  Category(
    icon: Icon(Icons.food_bank),
    name: 'Food',
    color: const Color.fromARGB(255, 134, 104, 48),
  ),
  Category(
    icon: Icon(Icons.sports),
    name: 'Sport',
    color: const Color.fromARGB(255, 134, 104, 48),
  ),
];
