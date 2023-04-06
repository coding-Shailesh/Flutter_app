import 'package:flutter/material.dart';

import '../helper/data.dart';
import '../helper/news.dart';
import '../models/article.dart';
import '../models/categorymodels.dart';
class Businesspage extends StatefulWidget {
  final String categorieUrl,categorieName;
  const Businesspage({Key? key, required this.categorieUrl, required this.categorieName}) : super(key: key);

  @override
  _BusinesspageState createState() => _BusinesspageState();
}

class _BusinesspageState extends State<Businesspage> {

  List<CategorieModel> categorie=[];
  List<Article> articleBusiness=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorie=getCategories();
    fetchArticlesBusiness();
  }
  Future<void> fetchArticlesBusiness() async{
    final Business = await getArticleBusiness(widget.categorieUrl);
    setState(() {
      articleBusiness=Business;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back,color: Colors.black,)),
            SizedBox(width: 0,),
            Text(
              widget.categorieName,
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 600,
              // width: 120,
              child: ListView.builder(
                itemBuilder: (context,index){
                  return BlogTile(
                    imgeUrl: articleBusiness[index].urlToImage,
                    title: articleBusiness[index].title,
                    des: articleBusiness[index].description,
                    news_provider: articleBusiness[index].author,
                  );
                },
                itemCount: articleBusiness.length,
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgeUrl,title,des,news_provider;
  const BlogTile({Key? key, required this.imgeUrl, required this.title, required this.des, required this.news_provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 210,
            //width: 120,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imgeUrl),
                )
            ),
          ),
          Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(des),
          SizedBox(height: 5,),
          Text(news_provider,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
        ],
      ),
    );
  }
}


