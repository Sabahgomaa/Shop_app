import 'package:flutter/material.dart';
import 'package:shop/views/HomeLayout/views/setting/Components/setting_items.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/View.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/view.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ItemSetting(
            'Edit Profile',
          ),
          ItemSetting('About Us'),
          ItemSetting('Contacts', widget: ContactView()),
          ItemSetting('Order'),
          ItemSetting('Check Out'),
          ItemSetting('FAQS', widget: FAQsView()),
        ],
      ),
    );
  }
}
