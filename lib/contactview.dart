import 'package:flutter/material.dart';

import 'contactmodal.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {


  List<ContactModal> contacts = [
    ContactModal(name: "Hello",phone: "98989898",email: "hello@gmail.com",website: "helloworld.com",photo: "https://th.bing.com/th/id/OIP.bZRua-GTzw4hvW1AOdRcnQHaE8?pid=ImgDet&rs=1")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.greenAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {

          },
          child: Icon(Icons.add,size:30,color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 100,color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  Icon(Icons.arrow_back_rounded,size: 35,color: Colors.black45,),
                  Icon(Icons.more_vert_rounded,size: 35,color: Colors.black45,)
                ],
              ),
            ),),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text("MY CONTACT",style: TextStyle(fontSize: 25,color: Colors.black45),),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius:BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black45,offset: Offset(0, 5),blurRadius: 10)]),
              
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Type name or number",style: TextStyle(fontSize: 15,color: Colors.black26),),
                    Icon(Icons.search_rounded,size: 30,color: Colors.black38,)
                  ],
                ),
              ),
            ),

            ListView.builder(itemBuilder: (context, index) {

            },
              itemCount: contacts.length,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),

            )








          ],
        ),
        
        

      ),
    );
  }

  Widget Item(String?photo,String?name,String?no)
  {
    return Column(children: [
      Divider(color: Colors.black38,thickness: 2,),

    ],);
  }

}
