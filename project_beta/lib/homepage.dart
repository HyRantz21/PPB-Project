import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_beta/aboutus.dart';
import 'package:project_beta/itemDetail.dart';
import 'package:project_beta/login.dart';
import 'package:project_beta/service/api.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ApiService _apiService = ApiService();
  List<ProductItem> filteredProducts = [];
  List<ProductItem> allProducts = [
    const ProductItem(
      imagePath: 'Asset/Screenshot (177).png',
      title: 'Product 1',
      price: '788.000',
      descrip: 'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
    ),
    const ProductItem(
      imagePath: 'Asset/Screenshot (176).png',
      title: 'Product 2',
      price: '1.299.000',
      descrip: 'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
    ),
    const ProductItem(
      imagePath: 'Asset/Screenshot (174).png',
      title: 'Product 4',
      price: '899.000',
      descrip: 'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
    ),
    const ProductItem(
      imagePath: 'Asset/Screenshot (175).png',
      title: 'Product 3',
      price: '909.000',
      descrip: 'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
    ),
  ];

  TextEditingController searchController = TextEditingController();

  void _logout(BuildContext context) async {
    await _apiService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(allProducts);
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredProducts = allProducts.where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    } else {
      setState(() {
        filteredProducts = List.from(allProducts);
      });
    }
  }

  //Searchbar
  Widget searchbar() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        left: 40,
        right: 40,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search products',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          if (searchController.text.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                children: filteredProducts.map((product) {
                  return ListTile(
                    leading: Image.asset(
                      product.imagePath,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.title),
                    subtitle: Text(product.price),
                    onTap: () {},
                  );
                }).toList(),
              ),
            ),
        ],
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

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        surfaceTintColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        title: const Text(
          'Venture',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 30,
            shadows: [
              Shadow(
                blurRadius: 0.5,
                color: Colors.grey,
                offset: Offset(1.5, 1.0),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  shadows: [
                    Shadow(
                      blurRadius: 0.5,
                      color: Colors.grey,
                      offset: Offset(1.5, 1.0),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.info,
                  shadows: [
                    Shadow(
                      blurRadius: 0.5,
                      color: Colors.grey,
                      offset: Offset(1.5, 1.0),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),

      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),

      body: currentPageIndex == 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      carousel(),
                      searchbar(),
                    ],
                  ),
                  categoryList(),
                  item(),
                ],
              ),
            )
          : currentPageIndex == 1
              ? // History page
              const Center(child: Text('Cart'))
              : currentPageIndex == 2
                  ? // Wishlist page
                  const Center(child: Text('Wishlist'))
                  : // Profile page
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('Asset/Screenshot (181).png'),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'johndoe@example.com',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    title: const Text('Edit Profile'),
                                    leading: const Icon(Icons.edit),
                                    onTap: () {
                                      // Handle edit profile action
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('Logout'),
                                    leading: const Icon(Icons.logout),
                                    tileColor: Colors.red[100],
                                    textColor: Colors.black,
                                    onTap: () {
                                      _logout(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
  final String descrip;
  final String price;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.descrip,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetail(
              imagePath: imagePath,
              title: title,
              descrip: descrip,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 100.0,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15.0),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 11.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp.$price',
                      style: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget item() {
  return const Padding(
    padding: EdgeInsets.all(15.0),
    child: Column(
      children: [
        Column(
          children: [
            Text(
              "Recomended",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text('chosen by your activity'),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (177).png',
                title: 'Product 1',
                price: '788.000',
                descrip:
                    'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (176).png',
                title: 'Product 2',
                price: '1.299.000',
                descrip:
                    'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
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
                price: '909.000',
                descrip:
                    'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: ProductItem(
                imagePath: 'Asset/Screenshot (174).png',
                title: 'Product 4',
                price: '899.000',
                descrip:
                    'andlanxcanAWHD AWODIJAWJXAWXNDAWXHDOAW AOWHDOAWXHDAOIDS',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
