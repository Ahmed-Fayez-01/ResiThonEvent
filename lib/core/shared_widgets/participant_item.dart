import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class ParticipantItem extends StatelessWidget {
  const ParticipantItem({super.key, required this.participantName,required this.imagePath});

  final String participantName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .17,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .06,
            width: MediaQuery.of(context).size.height * .06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * .06,
              ),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * .06,
              ),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .06,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: AppConstants.height5(context),
          ),
          Text(
            participantName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
