import 'package:books_store_app/models/admin.dart';
import 'package:flutter/material.dart';

class AdminAccountViewModel {
  final String pageTitle = 'Account';

  Admin currentAdmin = Admin(
      name: 'ElGml',
      email: 'elgml@gmail.com',
      password: '1111',
      image:
          'https://media.gettyimages.com/photos/handsome-young-adult-businessman-with-stubble-picture-id1250238624?k=20&m=1250238624&s=612x612&w=0&h=35Sf2RXBiMDoaabub7XpBV--FM_wuEf8R1lbgO_GquM=',
      role: AdminRoles.Admin,
      phoneNumber: '01020304050',
      online: true);

  final List<String> settings = [
    'Switch to users side',
    'Request to change password',
    'Language',
    'Contact support',
    'Logout'
  ];
  final List<IconData> settingsIcon = [
    Icons.home,
    Icons.vpn_key,
    Icons.language,
    Icons.call,
    Icons.logout
  ];
}
