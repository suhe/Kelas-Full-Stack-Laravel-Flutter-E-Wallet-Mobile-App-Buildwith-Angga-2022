import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultUserItem extends StatelessWidget {
  final UserModel user;
  //final String imageUrl;
  //final String name;
  //final String username;
  //final bool isVerified;
  final bool isSelected;

  const TransferResultUserItem({
    super.key,
    required this.user,
    //required this.imageUrl,
    //required this.name,
    //required this.username,
    //this.isVerified = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    user.profilePicture == null
                        ? AssetImage("assets/img_profile.png")
                        : NetworkImage(user.profilePicture!),
              ),
            ),
            child:
                user.verified == 1
                    ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 14,
                          ),
                        ),
                      ),
                    )
                    : null,
          ),
          SizedBox(height: 13),
          Text(
            user.name.toString(),
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 2),
          Text(
            "@${user.username.toString()}",
            overflow: TextOverflow.ellipsis,
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
