import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:myproject/List/sourcs.dart';
import 'package:myproject/sharedata.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Youtube extends StatefulWidget {
  const Youtube({Key key}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String videoId;
    videoId = YoutubePlayer.convertUrlToId("$youtube_url");
    print(videoId);
     _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 65),child: Align(
            alignment: Alignment.center,
            child: Container(

              child: Center(
                child: Text("Youtube",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width -50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.redAccent,
              ),
            ),
          ),),

          Padding(padding: EdgeInsets.only(top: 30)),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,




          ),
          Padding(padding: EdgeInsets.only(top: 30)),

          Bounce(child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(

                  height: 80,
                  width: (MediaQuery.of(context).size.width) - 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.white,




                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 25,
                              child: Icon(Icons.book,color: Colors.white,size: 25,),
                            ),
                            Padding(padding: EdgeInsets.only(left: 10),child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(bottom: 10,),child:  Text("$subtopicname",style: TextStyle(color: Colors.grey,fontSize: 12),),),
                                Text("PDF",style: TextStyle(color: Color(0xff00C76B),fontSize: 16,fontWeight: FontWeight.w500),),

                              ],
                            ),)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
          ),
            duration: Duration(milliseconds: 110),
            onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerCachedFromUrl(
                      url: '$pdf',
                    ),
                  ));
            },
          ),


        ],
      ),
    );
  }
}
