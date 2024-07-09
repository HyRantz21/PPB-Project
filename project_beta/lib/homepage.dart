import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BottomNavBar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        indicatorColor: Color.fromARGB(255, 255, 255, 255),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            label: 'History',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
            label: 'Wishlist',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Venture',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
      body: currentPageIndex == 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 1000,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 245, 245),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 0.5,
                          blurRadius: 1.5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        carousel(),
                        categoryList(),
                        item(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : currentPageIndex == 1
              ? // History page
              const Center(child: Text('History'))
              : currentPageIndex == 2
                  ? // Wishlist page
                  const Center(child: Text('Wishlist'))
                  : // Profile page
                  const Center(
                      child: Text('Profile'),
                    ),
    );
  }

  //Carousel
  Widget carousel() {
    return ClipRRect(
      child: CarouselSlider(
        items: [
          _buildCarouselItem('Asset/Screenshot (248).png'),
          _buildCarouselItem('Asset/Screenshot (261).png'),
          _buildCarouselItem('Asset/Screenshot (254).png'),
          _buildCarouselItem('Asset/Screenshot (251).png'),
        ],
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String assetPath) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  //Category
  Widget categoryList() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.travel_explore,
                size: 35,
              ),
              Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Find Your Preference"),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryItem(categories[0]),
                    _buildCategoryItem(categories[1]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCategoryItem(categories[2]),
                    _buildCategoryItem(categories[3]),
                  ],
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
  final Icon icon;
  final String backgroundImage;

  Category(
      {required this.name, required this.icon, required this.backgroundImage});
}

List<Category> categories = [
  Category(
      icon: const Icon(
        Icons.fireplace,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 30,
      ),
      name: 'Culture',
      backgroundImage: "Asset/Screenshot (261).png"),
  Category(
      icon: const Icon(
        Icons.nature,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 30,
      ),
      name: 'Nature',
      backgroundImage: "Asset/Screenshot (262).png"),
  Category(
      icon: const Icon(
        Icons.food_bank,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 30,
      ),
      name: 'Food',
      backgroundImage: "Asset/Screenshot (248).png"),
  Category(
      icon: const Icon(
        Icons.sports,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 30,
      ),
      name: 'Sport',
      backgroundImage: "Asset/Screenshot (251).png"),
];

Widget _buildCategoryItem(Category category) {
  return Expanded(
    child: InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 90,
        width: 90,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(category.backgroundImage),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 0.5,
              blurRadius: 1.5,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            category.icon,
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const ProductItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 100.0,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Text(
                title,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget item() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        Column(
          children: [
            Text(
              "Recomended",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text('chouses by your activity'),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (177).png',
                title: 'Product 1',
                onTap: () {
                  // Handle tap for Product 1
                  print('Product 1 tapped');
                },
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (176).png',
                title: 'Product 2',
                onTap: () {
                  // Handle tap for Product 2
                  print('Product 2 tapped');
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (175).png',
                title: 'Product 3',
                onTap: () {
                  // Handle tap for Product 3
                  print('Product 3 tapped');
                },
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (174).png',
                title: 'Product 4',
                onTap: () {
                  // Handle tap for Product 4
                  print('Product 4 tapped');
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
