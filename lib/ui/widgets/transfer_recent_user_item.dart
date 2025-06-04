import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  //final String imageUrl;
  //final String name;
  //final String username;
  //final bool isVerified;

  const TransferRecentUserItem({
    super.key,
    required this.user,
    //required this.imageUrl,
    //required this.name,
    //required this.username,
    //required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    user.profilePicture == null
                        ? AssetImage("assets/img_profile.png")
                        : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '@${user.username.toString()}',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(Icons.check_circle, color: greenColor, size: 14),
                Text(
                  "Verified",
                  style: greenTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
