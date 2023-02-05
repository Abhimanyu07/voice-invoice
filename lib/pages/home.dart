import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_globalKey,
      backgroundColor: Colors.pink,
      drawer: Drawer(
        child:
        Column(
          children:
          const [
            DrawerHeader( child:Center(child: Text('Voice Invoice'))),

            ListTile(leading: FaIcon(FontAwesomeIcons.user),title:
              Text('Profile'),),

            ListTile(leading: FaIcon(FontAwesomeIcons.gears),title:
              Text('Settings'),)
          ],
        ),
      ),

      body:
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(onPressed: (){
              _globalKey.currentState!.openDrawer();
              },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/parse');
                  },
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    minWidth: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.width/2,
                    elevation: 20,
                    shape: const CircleBorder(),
                    child:
                    const Text(
                        'GENERATE',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('INVOICES',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 5
                  ),)
                ],
              ),),),
        ],
      ),

      floatingActionButton: IconButton(
        tooltip: 'History',
        icon:const FaIcon(FontAwesomeIcons.fileInvoice ,color: Colors.white, size: 32,),
      onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
