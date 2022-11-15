import 'package:flutter/material.dart';
import 'package:news_flutter_app_last/globalconst/global_const.dart';

class HaberDetails extends StatelessWidget {
  const HaberDetails(
      {super.key,
      required this.title,
      required this.content,
      required this.author,
      required this.urlImage,
      required this.publishedAt,
      required this.desc,
      required this.urlToLink,
      required this.category});
  final String title,
      content,
      author,
      urlImage,
      publishedAt,
      desc,
      urlToLink,
      category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          author,
          style: TextStyle(
              color: Colors.black,
              fontSize: PageSize.font20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
      ),
      body: Container(
        height: PageSize.screenHeight,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.12),
            image: DecorationImage(
              
              opacity: 0.8,
              image: NetworkImage(urlImage),
              alignment: Alignment.topCenter,
            ),),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: PageSize.height45 * 3.5,
              ),
              FittedBox(
                child: Container(
                  padding: EdgeInsets.only(
                      left: PageSize.width10, right: PageSize.width10),
                  width: PageSize.screenWidth / 1.2,
                  height: PageSize.screenHeight / 5,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: PageSize.font20 / 1.2),
                      ),
                      Divider(),
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: PageSize.font20 / 1.3),
                      ),
                      SizedBox(
                        height: PageSize.height10,
                      ),
                      Text(
                        publishedAt
                            .replaceAll("-", "/")
                            .replaceAll("T", " ")
                            .replaceAll("Z", ""),
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.4),
                            fontSize: PageSize.font20 / 1.5,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: PageSize.height20,
              ),
              Container(
                padding: EdgeInsets.only(left: PageSize.width20),
                width: PageSize.screenWidth,
          
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            desc,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.7),
                                fontSize: PageSize.font20/1.2,
                                height: 1.9,
                                ),
                          ),
                          SizedBox(height: PageSize.height15,),
                          Text(
                            content,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontSize: PageSize.font20/1.2,
                                height: 1.7,
                                letterSpacing: 1.5
                                ),
                          ),
          
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: PageSize.width10,vertical: PageSize.width10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text("SHARE",style: TextStyle(color: Colors.white,letterSpacing: 1.5),)),
                            SizedBox(height: PageSize.height20,),
                          Icon(Icons.share,color: Colors.white,),
                           SizedBox(height: PageSize.height20,),
                          Icon(Icons.save,color: Colors.white,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
