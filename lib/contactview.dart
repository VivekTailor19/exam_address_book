import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contactmodal.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  String? photo;

  TextEditingController txtemail = TextEditingController();
  TextEditingController txtwebsite = TextEditingController();


  List<ContactModal> contacts = [
    ContactModal(name: "Hello",
        phone: "98989898",
        email: "hello@gmail.com",
        website: "helloworld.com",

    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xffF6F6F6),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            addcontact();
          },
          child: Icon(Icons.add, size: 30, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .miniCenterFloat,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 100, color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    Icon(Icons.arrow_back_rounded, size: 35,
                      color: Colors.black45,),
                    Icon(
                      Icons.more_vert_rounded, size: 35, color: Colors.black45,)
                  ],
                ),
              ),),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text("MY CONTACT",
                style: TextStyle(fontSize: 25, color: Colors.black45),),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black45,
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ]),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Type name or number",
                      style: TextStyle(fontSize: 15, color: Colors.black26),),
                    Icon(Icons.search_rounded, size: 30, color: Colors.black38,)
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Item(contacts[index], index);
              },
                itemCount: contacts.length,
                scrollDirection: Axis.vertical,
                //physics: BouncingScrollPhysics(),

              ),
            )


          ],
        ),


      ),
    );
  }

  Widget Item(ContactModal c, int? index) {
    return Column(children: [
      Divider(color: Colors.black38, thickness: 2,),
      ExpansionTile(

        leading: c.photo == null ?
        Container(
          height: 60, width: 60,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
              image: AssetImage(
                  "assets/images/hello.jpg")
          )),
      ) :
        Container(
          height: 60, width: 60,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
              image: FileImage(
                  File("${c.photo}"))
          )),
      ),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${c.name}", style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    wordSpacing: 3),),
                Text("${c.phone}",
                  style: TextStyle(fontSize: 20, color: Colors.black38),),

              ],),
            Icon(Icons.call, size: 25, color: Colors.blue,),
          ],
        ),
        trailing: Icon(Icons.message_rounded, size: 25, color: Colors.green,),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              IconButton(onPressed: () async {
                Uri call = Uri(
                  scheme: 'tel',
                  path:'${c.phone}',
                );
                await launchUrl(call);
              },icon:Icon(Icons.call),iconSize: 25,color: Colors.blue,),
                IconButton(onPressed: () async {
                  Uri mess = Uri(
                    scheme:'sms',
                    path:'${c.phone}',
                    queryParameters: <String, String>{
                      'body':'જો બકા તકલીફ તો રેહવાની '
                    },
                  );
                  await launchUrl(mess);
                   },
                  icon:Icon(Icons.message_rounded),iconSize: 25,color: Colors.green,),
                IconButton(onPressed: () async {
                  Uri email = Uri(
                    scheme: 'mailto',
                    path: '${c.email}',
                  );
                  await launchUrl(email);
                   },icon:Icon(Icons.mail_outline),iconSize: 25,color: Colors.red,),
                IconButton(onPressed: () {


                   },icon:Icon(Icons.language_rounded),iconSize: 25,color: Colors.lightBlueAccent.shade400,),



            ],),
          )
        ],
      ),
    ],);
  }

  void addcontact() {

    showDialog(context: context, builder: (context) {
      return AlertDialog(backgroundColor: Colors.white,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              photo == null ?
              CircleAvatar(radius: 85,
                backgroundImage: AssetImage(
                    "assets/images/hello.jpg"),) :
              CircleAvatar(radius: 85,
                backgroundImage: FileImage(File(
                    "$photo")),),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () async {

                    ImagePicker img = ImagePicker();
                    XFile? xfile = await img.pickImage(source: ImageSource.camera);
                    setState(() {
                      photo = xfile!.path;
                    });
                  },
                      child: Text("Capture")
                  ),
                  TextButton(onPressed: () async {
                    ImagePicker img = ImagePicker();
                    XFile? xfile = await img.pickImage(source: ImageSource.gallery);
                    setState(() {
                      photo = xfile!.path;
                    });
                  },
                      child: Text("Gallery")
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: TextField(

                  keyboardType: TextInputType.name,
                  controller: txtname,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      hintText: "Enter name...."
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: TextField(

                  keyboardType: TextInputType.name,
                  controller: txtphone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      hintText: "Enter Contact Number...."
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: TextField(

                  keyboardType: TextInputType.name,
                  controller: txtemail,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      hintText: "Enter Email Id...."
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: TextField(

                  keyboardType: TextInputType.name,
                  controller: txtwebsite,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      hintText: "Enter Website...."
                  ),
                ),
              ),

              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
                  onPressed: () {

                List temp = [
                  txtname.text,
                  txtphone.text,
                  txtemail.text,
                  txtwebsite.text,
                  photo];
                  ContactModal data = ContactModal(
                      name: temp[0],
                      phone: temp[1],
                      email: temp[2],
                      website: temp[3],
                      photo: temp[4]
                  );
                    //ContactModal(
                      // name: txtname.text,
                      // phone: txtphone.text,
                      // email: txtemail.text,
                      // website: txtwebsite.text,
                      // photo: photo);


                    setState(() {
                      contacts.add(data);
                      temp = [];
                    });
                    Navigator.pop(context);



                  }, child: Text("Create",style: TextStyle(fontSize: 25),)),

            ],
          ),
        ),);
    },);
  }

}
