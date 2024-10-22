import 'package:database_sqllite/models/articleModels.dart';
import 'package:flutter/material.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    if (articleModel.image != null &&
        articleModel.subTitle != null &&
        articleModel.title != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: articleModel.image != null
                  ? Image.network(
                      articleModel.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset("assets/images/numbers/number_one.png")),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title ?? "NO DATA",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.subTitle ?? 'No data Found',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      );
    } else {
      return SizedBox(width: 0);
    }
  }
}
