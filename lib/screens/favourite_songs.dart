import 'package:flutter/material.dart';

class FavouriteSongs extends StatefulWidget {
  const FavouriteSongs({super.key});

  @override
  State<FavouriteSongs> createState() => _FavouriteSongsState();
}

class _FavouriteSongsState extends State<FavouriteSongs> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
            bottom: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 29, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Liked Song',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 70,
        width: 450,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 213, 202, 202),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            width: 84.26,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://lyricalsansar.com/wp-content/uploads/2022/12/Apna-Bana-Le-Lyrics.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apna Bana Le',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Arijit Singh',
                style: const TextStyle(
                  color: Color.fromARGB(255, 95, 92, 92),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 96),
          GestureDetector(
            onTap: toggleLike,
            child: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.white,
              size: 40,
            ),
          ),
        ]),
      ),
    );
  }
}
