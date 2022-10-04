import 'package:flutter/material.dart';
import 'package:kuis/game_store.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final GameStore tourism;

  const DetailPage({Key? key, required this.tourism}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.blue : Colors.black87,
      appBar: AppBar(
        title: Text("${widget.tourism.name}"),
        actions : [
          IconButton(onPressed: (){
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: (isFavorite)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [

          Container(
            padding: EdgeInsets.all(12),
            height: (MediaQuery
                .of(context)
                .size
                .height) / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Image.network(widget.tourism.imageUrls[index]),
                );
              },
              itemCount: widget.tourism.imageUrls.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textBesar(widget.tourism.name),
                SizedBox(height: 10,),
                textSedang(widget.tourism.about),
                SizedBox(height: 10,),
                textSedang("Review Average : " + widget.tourism.reviewAverage),
                SizedBox(height: 10,),
                textSedang("Review Count : " + widget.tourism.reviewCount),
                SizedBox(height: 10,),
                textSedang("Release Date : " + widget.tourism.releaseDate),
                SizedBox(height: 10,),
                textSedang("Harga Game : " + widget.tourism.price),
                SizedBox(height: 10,),
                textSedang("Genre"),
                SizedBox(
                  height: (MediaQuery.of(context).size.height)/10,
                  width: (MediaQuery.of(context).size.width),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.tourism.tags.length,
                    ),
                    itemBuilder: (context,index){
                      return Column(
                        children: [

                          textSedang(widget.tourism.tags[index])
                        ],
                      );
                    },
                    itemCount: widget.tourism.tags.length,
                  ),
                ),
                Container(
                  child: ElevatedButton(

                    onPressed: () {
                      _launchURL(widget.tourism.linkStore);
                    },
                    child: Text("Buy Now"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textBesar(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

}