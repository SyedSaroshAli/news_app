import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/Pages/view_all_headlines.dart';
import 'package:news_app/Pages/view_all_trending.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/categories_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:news_app/widgets/categories_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/widgets/news_tiles.dart';
import 'package:news_app/widgets/slider_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <CategoryModel> categories = [];
  List <SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  int activeIndex = 0 ; 
  bool _loading = true;

  
  
  @override
  void initState() {
    categories = getCategories();
    getNews();
    getSlider();
    super.initState();
  }



  Future<void> getNews()async{
    News newsClass=News();
     await newsClass.getNews();
      setState(() {
        articles = newsClass.news;
        _loading = false;
    });  
   
  }

  Future<void> getSlider()async{
    Sliders newsSliders=Sliders();
     await newsSliders.getSlider();
      setState(() {
        sliders = newsSliders.slidernews;
        _loading = false;
      }); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          children: [
            Center(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
             children: [
              Text('Daily'),
              Text('Pulse',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),),
             ],
            ),
          ),
        ]
        ),
        elevation: 0,
      ),
      body: _loading? Center(child: CircularProgressIndicator()): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  for(int i=0; i<categories.length;i++)
                  CategoriesCard(image: categories[i].image.toString(),categoryName: categories[i].categoryName.toString(),)
                  
                ],
              ),
            ),  
          ),
          
          const SizedBox(height: 30,),
          
          Padding(
            padding: const EdgeInsets.only(left:10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Breaking News!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
            
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewAllHeadlines()));
                  },
                  child: Text("View All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),),
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 20,),
      
          CarouselSlider.builder(itemCount: sliders.length~/2, itemBuilder: (context,index,realIndex){
            return SliderCards(name: sliders[index].title2!, imageUrl: sliders[index].urlToImage2!, author: sliders[index].author2!, url:sliders[index].url2! , content: sliders[index].content2!, description:sliders[index].description2!,);
          }, options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index ; 
              }); 
            },
          )),
          const SizedBox(height: 20,),
          Center(child: buildIndicator()),
          
          const SizedBox(height:30,),
           Padding(
            padding: const EdgeInsets.only(left:10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending News!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
            
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewAllTrending()));
                  },
                  child: Text("View All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),),
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 10,),
      
          // for(int i=0; i<articles.length;i++)
          // NewsTiles(
          //       author: articles[i].author.toString(),
          //       title: articles[i].title.toString(), 
          //       description: articles[i].description.toString(), 
          //       url: articles[i].url.toString(), 
          //       urlToImage: articles[i].urlToImage.toString(), 
          //       content: articles[i].content.toString()),
          Expanded(
          child: ListView.builder(
            itemCount: articles.length~/2,
            itemBuilder: (context,index){
              return NewsTiles(
                author: articles[index].author.toString(),
                title: articles[index].title.toString(), 
                description: articles[index].description.toString(), 
                url: articles[index].url.toString(), 
                urlToImage: articles[index].urlToImage.toString(), 
                content: articles[index].content.toString());
            }))
      ],
      ),
    );
    

  }
  Widget buildIndicator()=> AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: sliders.length,
    effect: const ScrollingDotsEffect(dotHeight: 12,dotWidth: 12,activeDotColor: Colors.blue),);
}

