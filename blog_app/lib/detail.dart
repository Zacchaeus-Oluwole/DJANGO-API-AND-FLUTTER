import 'package:flutter/material.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/blog.dart';


class BlogDetail extends StatefulWidget {
  final Post post;
  const BlogDetail({Key? key, required this.post}) : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("blog"),
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(widget.post.image),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              widget.post.title,
              style: TextStyle(
                color: blackColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino'
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Text(widget.post.body),
            )
          ],
        ),
      ),
    );
  }
}