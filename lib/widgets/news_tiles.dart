// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class NewsTiles extends StatelessWidget {
//   final String  author,title,description,url,urlToImage,content;
//   const NewsTiles({super.key, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.content});

//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//               padding: const EdgeInsets.symmetric(horizontal:10),
//               child: Material(
//                 elevation: 3,
//                 borderRadius: BorderRadius.circular(10),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: CachedNetworkImage(
//                           imageUrl: urlToImage,
//                         height: 130,
//                         width: 200,
//                         fit: BoxFit.cover,),
//                       ),
                  
//                       const SizedBox(width: 7,) ,  
//                        Column(
//                          children: [
//                            Container(
//                             width: MediaQuery.of(context).size.width/2.2,
//                              child: Text(
//                                title,
//                                style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.black
//                                ),),
//                            ),
//                        const SizedBox(height: 5,),
//                        Column(
//                          children: [
//                            Container(
//                             width: MediaQuery.of(context).size.width/2.2,
//                              child: Text(
//                                description,
//                                style: TextStyle(
//                                  fontSize: 15,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.black54
//                                ),),
//                            ),
//                          ],
//                        )
//                     ],
//                   ),
//                           ]
//                           ),
//                 ),
//               ),
//         );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:news_app/Pages/article_view.dart';
import 'package:news_app/Pages/news_details.dart';
//import 'package:news_app/models/article_model.dart';

class NewsTiles extends StatelessWidget {
  final String author, title, description, url, urlToImage, content;

  const NewsTiles({
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
    return GestureDetector(
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetails(author: author, content: content, urlToImage: urlToImage, url: url, title: title, description: description)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: urlToImage,
                    height: 120,
                    width: 150,
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
                      );
                    },
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      
                        title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
