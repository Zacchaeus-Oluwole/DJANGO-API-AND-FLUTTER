import 'package:blog_app/detail.dart';
import 'package:flutter/material.dart';
import 'blog.dart';

void main() {
  runApp(const BlogApp());
}

const blackColor = Colors.black;
const whiteColor = Colors.white;

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Blog",
      home: const BlogPage(title: "Blog"),
    );
  }
}

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BlogPage> createState() => _BlogPageState();

}

class _BlogPageState extends State<BlogPage> {
  late Future<List<Post>> futurePost;
  // late Future<Post> futureDetail;

  @override
  void initState(){
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to my blog"),
        centerTitle: true,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return BlogDetail(post: snapshot.data![index]);
                      })
                      );
                    },
                    child: BlogCard(snapshot.data![index]),
                  );
                },
              );
            } else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
  Widget BlogCard(dynamic post){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Image.network(post.image),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            post.title,
            style: const TextStyle(

              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino'
            ),
          ),
        ],
        
        ),
      ),
    );
  }
}