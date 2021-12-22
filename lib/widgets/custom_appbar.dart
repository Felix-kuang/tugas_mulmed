import 'package:flutter/material.dart';
import 'package:tugas_mulmed/config/pallete.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Pallete.primaryColor,
      elevation: 1.0,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          "Covid-19",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
