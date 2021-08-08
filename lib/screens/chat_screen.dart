import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildHeader(),
          buildBottom(),
          buildSendMessageField(),
        ],
      ),
    );
  }

  Align buildSendMessageField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50.h,
        color: Color(0xffeaeeef),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "CircularStd",
                    color: Color(0xff262626),
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "CircularStd",
                      color: Color(0xff262626),
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.attach_file,
                    size: 24.sp,
                    color: Color(0xffb8b8b8),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.mic,
                    size: 24.sp,
                    color: Color(0xffb8b8b8),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/images/send.svg",
                    width: 24.sp,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Align buildBottom() {
    var _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 708.h,
        decoration: BoxDecoration(
          color: _isDarkMode ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(29.r),
          ),
        ),
        child: ListView(
          children: [
            MessageTile(
              messgae: "Hi",
              sentAt: "9:12 PM",
              sentByMe: true,
            ),
            MessageTile(
              messgae: "How are you",
              sentAt: "9:15 PM",
              sentByMe: false,
            ),
            MessageTile(
              messgae: "Fine!\nWhat's your email?",
              sentAt: "9:16 PM",
              sentByMe: true,
            ),
            MessageTile(
              messgae: "christinapearson@gmail.com",
              sentAt: "9:21 PM",
              sentByMe: false,
            ),
            MessageTile(
              messgae: "Good Night",
              sentAt: "11:18 PM",
              sentByMe: true,
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
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      CircleAvatar(
                        radius: 18.r,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Debra Nguyen",
                            style: TextStyle(
                              fontFamily: "CircularStd",
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                              fontFamily: "CircularStd",
                              color: Colors.white54,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                      SizedBox(
                        width: 28.w,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 24.sp,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String messgae;
  final String sentAt;
  final bool sentByMe;

  const MessageTile({
    Key? key,
    required this.messgae,
    required this.sentAt,
    required this.sentByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 30.h),
        child: Column(
          crossAxisAlignment:
              sentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: sentByMe ? Color(0xffe0d5ff) : Color(0xffebebeb),
                borderRadius: BorderRadius.only(
                  topLeft: sentByMe ? Radius.circular(20.r) : Radius.zero,
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                  topRight: sentByMe ? Radius.zero : Radius.circular(20.r),
                ),
              ),
              child: Text(
                messgae,
                style: TextStyle(
                  fontFamily: "CircularStd",
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              sentAt,
              style: TextStyle(
                fontSize: 11.sp,
                fontFamily: "CiruclarStd",
                color: Color(0xff979797),
              ),
            )
          ],
        ),
      ),
    );
  }
}
