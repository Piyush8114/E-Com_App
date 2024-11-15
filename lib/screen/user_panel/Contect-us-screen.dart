import 'package:e_com/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContectUS extends StatefulWidget {
  const ContectUS({super.key});

  @override
  State<ContectUS> createState() => _ContectUSState();
}

class _ContectUSState extends State<ContectUS> {

  Uri dialnumber = Uri(scheme: 'tel', path: '8051370133');

  Uri dialemail = Uri(scheme: 'mailto', path: 'khatarnakgyan362@gmail.com');

  Uri dialmessage = Uri(scheme: 'sms', path: '8051370133');

  callnumber() async{
    await launchUrl(dialnumber);
  }

  EmailId() async{
    await launchUrl(dialemail);
  }

  Messages() async{
    await launchUrl(dialmessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's get in touch!"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                  height: Get.height / 2,
                  child: Image.asset('assets/images/contect.png')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Card(
            child: Container(
              width: Get.width/4,
              height: Get.width/4,
              child: Column(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.call,size: 35,color: Colors.blueAccent,),
                    onPressed: () {
                      callnumber();
                    },
                  ),
                  Text("Call US",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                ],
              ),
            )
              ),

                Card(
                    child: Container(
                      width: Get.width/4,
                      height: Get.width/4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.email_outlined,size: 35,color: Colors.greenAccent,),
                            onPressed: () {
                              EmailId();
                            },
                          ),
                          Text("Email Us",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.greenAccent),),
                        ],
                      ),
                    )
                ),

                Card(
                    child: Container(
                      width: Get.width/4,
                      height: Get.width/4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.chat,size: 35,color: Colors.pinkAccent,),
                            onPressed: () {
                              Messages();
                            },
                          ),
                          Text("Chat",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pinkAccent),),

                        ],
                      ),
                    )
                )
          ],
        ),

            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Our social media",textAlign:TextAlign.start,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold,color: Colors.black),)),
            ),

            ListTile(
              leading: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Image.asset(
                  'assets/images/instagram.png',
                ),
              ),
              title: Text("Instagram"),

              onTap: (){
                _openInstagram();
              },
            ),

            ListTile(
              leading: Icon(Icons.facebook_sharp,color: Colors.blue,size: 40,),
              title: Text("Facebook"),

              onTap: (){
                _openFacebook();
              },
            ),

            ListTile(
              leading: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Image.asset(
                  'assets/images/youtube.png',
                ),
              ),
              title: Text("Youtube"),

              onTap: (){
                _openYoutube();
              },
            ),
              ]
        ),
      )
    );
  }

  void _openInstagram() async {
    const String username = 'piyush_bhumihar_';
    final Uri instagramAppUri = Uri(scheme: 'instagram', host: 'user', queryParameters: {'username': username});
    final Uri instagramWebUri = Uri.https('www.instagram.com', '/$username/');

    if (await canLaunchUrl(instagramAppUri)) {
      await launchUrl(instagramAppUri);
    } else if (await canLaunchUrl(instagramWebUri)) {
      await launchUrl(instagramWebUri);
    } else {
      throw 'Could not launch Instagram';
    }
  }

  void _openFacebook() async {
    const String profileUrl = 'https://www.facebook.com/piyushkumar.roy.372';

    if (await canLaunchUrl(Uri.parse(profileUrl))) {
      await launchUrl(Uri.parse(profileUrl));
    } else {
      throw 'Could not launch Facebook';
    }
  }


  void _openYoutube() async {
    const String channelUrl = 'https://www.youtube.com/@khatarnakgyan9883?si=WdmRqllCzT02OGJv';

    // Check if the URL can be launched
    if (await canLaunchUrl(Uri.parse(channelUrl))) {
      // Launch the URL
      await launchUrl(Uri.parse(channelUrl));
    } else {
      // Throw an error if the URL cannot be launched
      throw 'Could not launch YouTube';
    }
  }


}
