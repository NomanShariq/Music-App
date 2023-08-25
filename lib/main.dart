import 'package:flutter/material.dart';
import 'package:music_player_app/model/widget_data.dart';
import 'package:music_player_app/screens/artist_songs.dart';
import 'package:music_player_app/screens/single_song.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'single-song-screen': (context) => const SingleSongScreen(),
        'artist-songs-screen': (context) => const ArtistSongs(),
      },
    );
  }
}
