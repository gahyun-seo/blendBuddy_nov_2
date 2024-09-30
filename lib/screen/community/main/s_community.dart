import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/community/main/w_user_image_button.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 0,
        bottom: 0,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 214, left: 16, right: 16),
            child: Row(
              children: [
                UserImageButton(),
                UserImageButton(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
