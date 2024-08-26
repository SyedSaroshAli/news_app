import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:news_app/Pages/article_view.dart';
import 'package:news_app/Pages/news_details.dart';
//import 'package:news_app/models/article_model.dart';

class CategoryNewsTiles extends StatelessWidget {
  final String author, title, description, url, urlToImage, content;

  const CategoryNewsTiles({
    Key? key,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14,left: 8,right: 8),
      child: GestureDetector(
        onTap:(){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetails(author: author, content: content, urlToImage: urlToImage, url: url, title: title, description: description)));
        } ,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: urlToImage,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                 placeholder: (context, url) => Container(
                     height: 120,
                     width: 150,
                     color: Colors.grey[300],
                     child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) {
                      print('Failed to load image: $url');
                      print('Error: $error');
                      return Container(
                        height: 120,
                        width: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      );}),
                  
              ),
              
              const SizedBox(height: 5,),
              Text(title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:Colors.black
              ),),
              const SizedBox(height: 5,),
              Text(description)
            ],
          )
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: (){
    //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetails(author: author, content: content, urlToImage: urlToImage, url: url, title: title, description: description)));
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
    //     child: Material(
    //       elevation: 3,
    //       borderRadius: BorderRadius.circular(10),
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    //         child: Row(
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(10),
    //               child: CachedNetworkImage(
    //                 imageUrl: urlToImage,
    //                 height: 120,
    //                 width: 150,
                    // fit: BoxFit.cover,
                    // placeholder: (context, url) => Container(
                    //   height: 120,
                    //   width: 150,
                    //   color: Colors.grey[300],
                    //   child: Center(child: CircularProgressIndicator()),
                    // ),
                    // errorWidget: (context, url, error) {
                    //   print('Failed to load image: $url');
                    //   print('Error: $error');
                    //   return Container(
                    //     height: 120,
                    //     width: 150,
                    //     color: Colors.grey[300],
                    //     child: Center(
                    //       child: Icon(Icons.error, color: Colors.red),
                    //     ),
                    //   );
                  //  },
    //               ),
    //             ),
    //             const SizedBox(width: 7),
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
                      
    //                     title,
    //                     maxLines: 2,
    //                     style: const TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 5),
    //                   Text(
    //                     description,
    //                     maxLines: 3,
    //                     style: const TextStyle(
    //                       fontSize: 15,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.black54,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
