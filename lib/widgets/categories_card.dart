//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/category_news.dart';

class CategoriesCard extends StatelessWidget {
  final String image, categoryName;
  const CategoriesCard({super.key,
  required this.image,
  required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : (){
        print (categoryName);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CategoryNews(categoryName: categoryName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15,),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
               image,
              height: 70,
              width: 120,
              fit: BoxFit.cover,),
            ),
      
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Center(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),)),
            )
          ],
        ),
      ),
    );
  }
}