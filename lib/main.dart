import 'package:flutter/material.dart';
import 'package:music_player_app/screens/artist_songs.dart';
import 'package:music_player_app/screens/favourite_songs.dart';
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
      title: 'Music Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      initialRoute: 'favourite-songs-screen',
      routes: {
        'home': (context) => const HomeScreen(),
        'single-song-screen': (context) => const SingleSongScreen(),
        'artist-songs-screen': (context) => const ArtistSongs(),
        'favourite-songs-screen': (context) => const FavouriteSongs(),
      },
    );
  }
}
