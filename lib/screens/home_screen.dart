import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/widget_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  late PageController _pageController;
  int activePage = 1;
  int _selectedTab = 0;

  // _changeTab(int index) {
  //   setState(() {
  //     _selectedTab = index;
  //   });
  // }

  void _changeTab(int index) {
  if (index == 2) {
    // Navigating to the Favourite Songs page
    Navigator.of(context).pushNamed('favourite-songs-screen');
  } else {
    setState(() {
      _selectedTab = index;
    });
  }
}
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: activePage);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators(imagesLength, currentIndex) {
      return List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.black : Colors.black26,
              shape: BoxShape.circle),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 29, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: const Text('Music-era'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mode_night,
                size: 29,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.network(images[pagePosition]),
                    );
                  }),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, activePage)),
            const SizedBox(
              height: 20,
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 181,
                height: 40,
                child: const Text(
                  'Most Listening',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: 418,
              height: 170,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widgetDataList.map((widgetData) {
                    return Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: 132,
                      height: 168,
                      child: Stack(
                        children: [
                          Positioned(
      left: 0,
      top: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'single-song-screen');
        },
        child: Container(
          width: 129,
          height: 131,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(widgetData['imageURL']),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    ),
                          Positioned(
      left: 1,
      top: 131,
      child: SizedBox(
        width: 129,
        child: Text(
          widgetData['title'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
    Positioned(
      left: 3,
      top: 153,
      child: SizedBox(
        width: 129,
        child: Text(
          widgetData['subtitle'],
          style: const TextStyle(
            color: Color(0xFF4F4F4F),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 181,
                height: 40,
                child: const Text(
                  'Trending Songs',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: 418,
              height: 170,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: trendingsSongslist.map((widgetData) {
                    return Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: 132,
                      height: 168,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 129,
                              height: 131,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widgetData['imageURL']),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1,
                            top: 131,
                            child: SizedBox(
                              width: 129,
                              child: Text(
                                widgetData['title'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 3,
                            top: 153,
                            child: SizedBox(
                              width: 129,
                              child: Text(
                                widgetData['subtitle'],
                                style: const TextStyle(
                                  color: Color(0xFF4F4F4F),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 201,
                height: 40,
                child: const Text(
                  'Suggested Artists',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: 418,
              height: 170,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: artistList.map((widgetData) {
                    return Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: 132,
                      height: 168,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,'artist-songs-screen');
                              },
                              child: Container(
                                width: 129,
                                height: 131,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(widgetData['imageURL']),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(97),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1,
                            top: 131,
                            child: SizedBox(
                              width: 129,
                              child: Text(
                                widgetData['title'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search",),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart), label: "Favourite Songs",),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.contact_mail), label: "Contact",),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.settings), label: "Settings",),
        ],
      ),
    
    );
  }
}
