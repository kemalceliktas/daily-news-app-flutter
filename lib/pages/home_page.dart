import 'dart:math';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app_last/globalconst/global_const.dart';
import 'package:news_flutter_app_last/pages/haber_detail.dart';

import '../components/categories_slider.dart';
import '../globalconst/app_style.dart';
import '../model/article_model.dart';
import '../services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  final List category = [
    "General",
    "Business",
    "Sports",
    "Entertainment",
    "Health",
    "Science",
    "Technology",
  ];

  final List<Color> categoryColors = [
    Color.fromARGB(255, 254, 205, 107),
    Color.fromARGB(255, 78, 142, 146),
    Color.fromARGB(255, 5, 76, 133),
    Color(0xFFEB6440),
    Color(0xFF277BC0),
    Color(0xFFFFCB42),
    Color(0xFFFFF4CF),
  ];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(7);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.category,
          color: Colors.black,
          size: PageSize.font20 * 1.5,
        ),
        title: Text("Daily News",style: TextStyle(color: Colors.black,fontSize: PageSize.font20,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: PageSize.width20),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: PageSize.font20 * 1.5,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: PageSize.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: PageSize.height45 / 3,
              ),
              SizedBox(
                height: PageSize.height15 * 2.5,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(right: 10),
                        height: PageSize.height15 * 2,
                        decoration: BoxDecoration(
                          color: current == index ? Colors.black : kWhite,
                          border: current == index
                              ? null
                              : Border.all(
                                  color: kLightGrey,
                                  width: 1,
                                ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              category[index],
                              style: kEncodeSansMedium.copyWith(
                                color: current == index
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7),
                                fontSize: PageSize.font20 / 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                height: PageSize.height20 * 2,
              ),
              SizedBox(
                height: PageSize.screenHeight / 3,
                child: FutureBuilder(
                  future: client.getArticle(category[current]),
                  builder:
                      (context, AsyncSnapshot<List<ArticleModel>> snapshot) {
                    if (snapshot.hasData) {
                      List<ArticleModel> articles = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HaberDetails(
                                    category: category[current],
                                    title: articles[index].title.toString(),
                                    content: articles[index].content.toString(),
                                    author: articles[index].author.toString(),
                                    urlImage:
                                        articles[index].urlToImage.toString(),
                                    publishedAt:
                                        articles[index].publishedAt.toString(),
                                    desc:
                                        articles[index].description.toString(),
                                    urlToLink: articles[index].url.toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: PageSize.screenWidth / 1.5,
                              height: PageSize.screenHeight / 1.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    articles[index].urlToImage.toString()),
                                fit: BoxFit.cover,
                              )),
                              margin: EdgeInsets.only(
                                right: PageSize.width20,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: PageSize.width20 * 3,
                                        height: PageSize.width20 * 3,
                                        decoration:
                                            BoxDecoration(color: Colors.black),
                                        child: Column(
                                          children: [
                                            Text(
                                              articles[index]
                                                  .publishedAt!
                                                  .substring(8, 10)
                                                  .replaceAll("-", "/"),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: PageSize.font26,
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "/" +
                                                  articles[index]
                                                      .publishedAt!
                                                      .substring(5, 7)
                                                      .replaceAll("-", "/"),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      PageSize.font20 / 1.2,
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  FittedBox(
                                    child: Container(
                                      padding: EdgeInsets.only(top: PageSize.height15,left: PageSize.width10),
                                      width: PageSize.screenWidth,
                                      height: PageSize.height45 * 2,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                      ),
                                      child: Text(
                                        articles[index]
                                            .title!
                                            .substring(0, articles[index]
                                            .title!.length<50 ?  articles[index]
                                            .title!.length:50 )
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: PageSize.font20 * 1.2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: PageSize.height20,
              ),
              Text(
                "Technology",
                style: kEncodeSansBold.copyWith(
                  color: Colors.black,
                  fontSize: PageSize.font20,
                ),
              ),
              SizedBox(
                height: PageSize.height10 * 2,
              ),
              SizedBox(
                height: PageSize.screenHeight/4,
                child: FutureBuilder(
                  future: client.getArticle(category[6]),
                  builder:
                      (context, AsyncSnapshot<List<ArticleModel>> snapshot) {
                    if (snapshot.hasData) {
                      List<ArticleModel> articles = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HaberDetails(
                                    category: category[6],
                                    title: articles[index].title.toString(),
                                    content: articles[index].content.toString(),
                                    author: articles[index].author.toString(),
                                    urlImage:
                                        articles[index].urlToImage.toString(),
                                    publishedAt:
                                        articles[index].publishedAt.toString(),
                                    desc:
                                        articles[index].description.toString(),
                                    urlToLink: articles[index].url.toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: PageSize.screenWidth /2,
                              height: PageSize.screenHeight,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    articles[index].urlToImage.toString()),
                                fit: BoxFit.cover,
                              )),
                              margin: EdgeInsets.only(
                                right: PageSize.width20,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.end,
                                children: [
                                 
                                  FittedBox(
                                    child: Container(
                                      padding: EdgeInsets.only(top: PageSize.height15,left: PageSize.width10),
                                      width: PageSize.screenWidth,
                                      height: PageSize.height45*2 ,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                      ),
                                      child: Text(
                                        articles[index]
                                            .title!
                                            .substring(0, articles[index].title!.length<50 ? articles[index].title!.length:50)
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: PageSize.font20 * 1.2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
