import 'package:chat_app_1/constants/colors.dart';
import 'package:chat_app_1/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildHeader(),
          buildBottom(),
        ],
      ),
    );
  }

  Align buildBottom() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // height: 667.h,
        height: 658.h,
        decoration: BoxDecoration(
          color: isDarkMode ? chatTileBkColorD : chatTileBkColorL,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(29.r),
          ),
        ),
        child: ListView(
          children: [
            ChatTile(
                title: "Carmen Myers",
                subtitle: "great idea to traffic analysis!",
                lastMessageTime: "5:45 PM",
                newMessages: 1),
            ChatTile(
                title: "Enrique Perkins",
                subtitle: "this is going to cost battery",
                lastMessageTime: "11:12 AM",
                newMessages: 2),
            ChatTile(
              title: "Glen Ryan",
              subtitle: "plan is going to suffer 😎",
              lastMessageTime: "10:45 AM",
            ),
            ChatTile(
                title: "Christina Pearson",
                subtitle: "rate should be very high",
                lastMessageTime: "8:06 AM",
                newMessages: 1),
            ChatTile(
              title: "Judy Kuhn",
              subtitle: "I like your ideas",
              lastMessageTime: "Yesterday",
            ),
            ChatTile(
              title: "Amber Ross",
              subtitle: "I have ever heard 😍❤️",
              lastMessageTime: "Yesterday",
            ),
            ChatTile(
              title: "Samuel Parker",
              subtitle: "Depending on the user",
              lastMessageTime: "Yesterday",
            ),
            ChatTile(
              title: "Byron Kuhn",
              subtitle: "Depending on the user",
              lastMessageTime: "Yesterday",
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeader() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: isDarkMode ? null : 312.h,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(isDarkMode
                ? "assets/images/backgroundD.png"
                : "assets/images/backgroundL.png"),
            fit: isDarkMode ? BoxFit.fill : BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 56.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Message's (32)",
                  style: TextStyle(
                    fontFamily: "CircularStd",
                    fontSize: 18.sp,
                    color: Colors.white,
                    letterSpacing: 0.24.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ],
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
                    child: Text(
                      "Friends",
                      style: TextStyle(
                        color: Color(0xff6789ca),
                        fontFamily: "CircularStd",
                        letterSpacing: 0.24.w,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Teachers",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "CircularStd",
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Groups",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "CircularStd",
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Add More",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "CircularStd",
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int newMessages;
  final String lastMessageTime;

  const ChatTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.lastMessageTime,
    this.newMessages = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatScreen(),
        ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28.r,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: "CircularStd",
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontFamily: "CircularStd",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    newMessages > 0
                        ? Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff6848bf),
                            ),
                            child: Center(
                              child: Text(
                                newMessages.toString(),
                                style: TextStyle(
                                    fontFamily: "CircularStd",
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        : Container(
                            height: 18.h,
                            width: 18.h,
                          ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      lastMessageTime,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0xff828282),
                          fontFamily: "CircularStd",
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              thickness: 2.h,
              color: _isDarkMode ? Color(0xff7a7c7f) : null,
            ),
          ],
        ),
      ),
    );
  }
}
