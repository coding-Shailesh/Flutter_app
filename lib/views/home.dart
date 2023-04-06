import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/views/article_view.dart';
import 'package:newsapp/views/sidenavbar.dart';

import '../models/categorymodels.dart';
import 'businesspage.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategorieModel> categorie=[];
  List<Article> article=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorie=getCategories();
    fetchArticles();
  }

Future<void> fetchArticles() async{
  final articles = await getArticle();
  //final Business = await getArticle();
  setState(() {
    article = articles;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
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
              height: 90,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // controller: PageController(viewportFraction: 0.8),

                itemBuilder: (context,index){
                  return CategoryTile(
                    imageUrl: categorie[index].imageAssetUrl,
                    categoryName: categorie[index].categorieName,
                    categoryUrl: categorie[index].categorieUrl,
                  );
                },
                itemCount: categorie.length,
              ),
            ),
            Container(
              height: 600,
             // width: 120,
              child: ListView.builder(
                itemBuilder: (context,index){
                  return BlogTile(
                    imgeUrl: article[index].urlToImage,
                    title: article[index].title,
                    des: article[index].description,
                    news_provider: article[index].author,
                    url: article[index].articleUrl,
                  );
                },
                itemCount: article.length,
              ),
            ),


          ],
        ) ,
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl,categoryName,categoryUrl;
  const CategoryTile({Key? key, this.imageUrl, this.categoryName, this.categoryUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Businesspage(categorieUrl: categoryUrl,categorieName: categoryName,) ));
      },
      child: Container(
        height: 90,
        width: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            )
        ),
        child: Center(child: Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
    );

  }
}
class BlogTile extends StatelessWidget {
  final String imgeUrl,title,des,news_provider,url;
  const BlogTile({Key? key, required this.imgeUrl, required this.title, required this.des, required this.news_provider, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(BlogUrl: url)));
      },
      child: Container(
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
      ),
    );
  }
}


