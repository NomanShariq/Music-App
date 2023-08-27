import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleSongScreen extends StatefulWidget {
  const SingleSongScreen({super.key});

  @override
  State<SingleSongScreen> createState() => _SingleSongScreenState();
}

class _SingleSongScreenState extends State<SingleSongScreen> {
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
          'Playing Song',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                width: 283,
                height: 256,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.ilyricshub.com/wp-content/uploads/2023/07/lo-aayi-barsaat-darshan-raval.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 184,
                    height: 39,
                    margin: const EdgeInsets.only(left: 40),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Jo Aai Barsaat',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: toggleLike,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 135,
              height: 25,
              child: Text(
                'Darshan Raval',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.volumeHigh),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.shuffle),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.repeat),
              ),
            ]),
            const SizedBox(
              height: 90,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    "00:50",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "04:00",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 4,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 4,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    iconSize: 40,
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.backward)),
                IconButton(
                    iconSize: 40,
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.pause)),
                IconButton(
                    iconSize: 40,
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.forward)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
