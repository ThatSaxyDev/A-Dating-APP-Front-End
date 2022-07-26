import 'package:flutter/material.dart';

class GlobalVariables {
  static const mainColor = Color.fromRGBO(233, 64, 87, 1);
  static const lightMainColor = Color.fromRGBO(233, 64, 87, 0.1);
  static const verylightMainColor = Color.fromRGBO(233, 64, 87, 0.03);
  static const starColor = Color.fromRGBO(138, 35, 135, 1);

  //! onboarding images
  static const List<Map<String, String>> onboardingImages = [
    {
      'title': 'Algorithm',
      'description':
          ' Users going through a vetting process to ensure you never match with bots.',
      'image': 'assets/images/girl2.png',
    },
    {
      'title': 'Matches',
      'description':
          'We match you with people that have a large array of similar interests.',
      'image': 'assets/images/girl1.png',
    },
    {
      'title': 'Premium',
      'description':
          'Sign up today and enjoy the first month of premium benefits on us.',
      'image': 'assets/images/girl3.png',
    },
  ];

  //! home screen card items
  static const List<Map<String, dynamic>> cardItems = [
    {
      'name': 'Jessica Parker',
      'age': 23,
      'image': 'assets/images/girl4.png',
      'job': 'Professional Model'
    },
    {
      'name': 'Camila Snow',
      'age': 26,
      'image': 'assets/images/girl1.png',
      'job': 'Marketer'
    },
    {
      'name': 'Jennifer Greg',
      'age': 23,
      'image': 'assets/images/girl2.png',
      'job': 'Professional Model'
    },
    {
      'name': 'Jessica Parker',
      'age': 24,
      'image': 'assets/images/girl3.png',
      'job': 'Professional Model'
    },
  ];

  //! match screen card items
  static const List<Map<String, dynamic>> matchCardItems = [
    {
      'name': 'Jessica Parker',
      'age': 23,
      'image': 'assets/images/girl4.png',
      'job': 'Professional Model'
    },
    {
      'name': 'Camila Snow',
      'age': 26,
      'image': 'assets/images/girl1.png',
      'job': 'Marketer'
    },
    {
      'name': 'Jennifer Greg',
      'age': 23,
      'image': 'assets/images/girl2.png',
      'job': 'Professional Model'
    },
    {
      'name': 'Jessica Parker',
      'age': 24,
      'image': 'assets/images/girl3.png',
      'job': 'Professional Model'
    },
    {
      'name': 'Jessica Parker',
      'age': 23,
      'image': 'assets/images/girl4.png',
      'job': 'Professional Model'
    },
    {
      'name': 'Camila Snow',
      'age': 26,
      'image': 'assets/images/girl1.png',
      'job': 'Marketer'
    },
  ];
  //! messages-story
  static const List<Map<String, dynamic>> storiesMessages = [
    {
      'name': 'Jessica',
      'image': 'assets/images/girl4.png',
      'text': 'Ok, see you then',
      'time': '2:04 PM',
      'unread': 2,
    },
    {
      'name': 'Camila',
      'image': 'assets/images/girl1.png',
      'text': 'Wyd',
      'time': '2:10 PM',
      'unread': 1,
    },
    {
      'name': 'Jennifer',
      'image': 'assets/images/girl2.png',
      'text': 'Typing...',
      'time': '2:14 PM',
      'unread': 1,
    },
    {
      'name': 'Parker',
      'image': 'assets/images/girl3.png',
      'text': 'Hey! What\'s up',
      'time': '2:20 PM',
      'unread': 1,
    },
    {
      'name': 'Snow',
      'image': 'assets/images/girl4.png',
      'text': 'When are we meeting?',
      'time': '2:25 PM',
      'unread': 1,
    },
    {
      'name': 'Ava',
      'image': 'assets/images/girl1.png',
      'text': 'Hey! What\'s up',
      'time': '2:20 PM',
      'unread': 1,
    },
    {
      'name': 'Jessica',
      'image': 'assets/images/girl4.png',
      'text': 'Ok, see you then',
      'time': '2:04 PM',
      'unread': 2,
    },
    {
      'name': 'Camila',
      'image': 'assets/images/girl1.png',
      'text': 'Wyd',
      'time': '2:10 PM',
      'unread': 1,
    },
    {
      'name': 'Jennifer',
      'image': 'assets/images/girl2.png',
      'text': 'Typing...',
      'time': '2:14 PM',
      'unread': 1,
    },
    {
      'name': 'Parker',
      'image': 'assets/images/girl3.png',
      'text': 'Hey! What\'s up',
      'time': '2:20 PM',
      'unread': 1,
    },
    {
      'name': 'Snow',
      'image': 'assets/images/girl4.png',
      'text': 'When are we meeting?',
      'time': '2:25 PM',
      'unread': 1,
    },
    {
      'name': 'Ava',
      'image': 'assets/images/girl1.png',
      'text': 'Hey! What\'s up',
      'time': '2:20 PM',
      'unread': 1,
    },
  ];

  //! interests texts and icons
  static const List<Map<String, String>> interests = [
    {
      'interest': 'Photography',
      'icon': 'assets/icons/camera.png',
    },
    {
      'interest': 'Shopping',
      'icon': 'assets/icons/shopping.png',
    },
    {
      'interest': 'Karaoke',
      'icon': 'assets/icons/karaoke.png',
    },
    {
      'interest': 'Yoga',
      'icon': 'assets/icons/yoga.png',
    },
    {
      'interest': 'Cooking',
      'icon': 'assets/icons/cooking.png',
    },
    {
      'interest': 'Tennis',
      'icon': 'assets/icons/tennis.png',
    },
    {
      'interest': 'Running',
      'icon': 'assets/icons/run.png',
    },
    {
      'interest': 'Swimming',
      'icon': 'assets/icons/swimming.png',
    },
    {
      'interest': 'Art',
      'icon': 'assets/icons/art.png',
    },
    {
      'interest': 'Traveling',
      'icon': 'assets/icons/travel.png',
    },
    {
      'interest': 'Extreme',
      'icon': 'assets/icons/extreme.png',
    },
    {
      'interest': 'Music',
      'icon': 'assets/icons/music.png',
    },
    {
      'interest': 'Drink',
      'icon': 'assets/icons/drink.png',
    },
    {
      'interest': 'Video games',
      'icon': 'assets/icons/videogames.png',
    },
  ];
}
