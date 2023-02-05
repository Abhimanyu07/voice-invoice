import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_invoice/pasers/parsingclass.dart';
// import 'package:voice_invoice/widgetshelp/textinputs.dart';
import 'package:async/async.dart';
import 'dart:async';
import 'dart:math';

class parsingPage extends StatefulWidget {
  const parsingPage({Key? key}) : super(key: key);

  @override
  _parsingPageState createState() => _parsingPageState();
}

class _parsingPageState extends State<parsingPage> {
  TextEditingController partyText = TextEditingController();
  TextEditingController brokerText = TextEditingController();
  TextEditingController transportText = TextEditingController();

  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState(){
    super.initState();
    _initSpeech();
    addTableToWidget();
    setState(() {

    });
  }


  addTableToWidget(){
    widgetForItem.add(
        Table(
        defaultColumnWidth: FixedColumnWidth(120),
    border: TableBorder.all(color:Colors.black,
    style: BorderStyle.solid,
    width: 2),
    children: tableRowsVar,


    )
    );

    widgetForItem.add(const SizedBox(
      height: 10,
    ));
    widgetForItem.add( SizedBox(
      width: MediaQuery.of(context).size.width/1.8,
      child: const TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,
          color: Colors.green))
        ),
      ),
    ));
  }
  ParsingClass dataTemplate = ParsingClass(
      contactInfoFilled: false,
      itemsInfoFilled: false);


  List<TableRow> tableRowsVar = [
    TableRow(children: [
      Column(children: [Text('Description of Goods')],),
      Column(children: [Text('Category')],),
      Column(children: [Text('Rate')],),
      Column(children: [Text('Quantity')],),
      Column(children: [Text('Weight')],)
  ]
    )
  ];

  List<Widget> widgetForItem = [

  ];


  ListTile createItemTile(newInfo)=>ListTile(
  title: Text(newInfo),
  );

 void AddItemWidget(String newInfo){
   widgetForItem.add(createItemTile(newInfo));

    setState(() {

    });


}



  void _initSpeech()async{
    await _speechToText.initialize(onStatus: (status){
        print("inside callback");
      if(status.toString() == 'done'){
        if(!dataTemplate.contactInfoFilled){
        updateTextFields();
        }

        else{
          print("adding ");
          AddItemWidget(_lastWords);
        }

      }


    });
    setState(() {
    });
  }

  void _startListening()async{
    await _speechToText.listen(onResult: _onSpeechResult);
    print('strting');
    setState(() {

    });
  }
  void _stopListening()async{
    await _speechToText.stop();
    print(_lastWords);
    print('stoppingggg');
    setState(() {

    });
  }

  void _onSpeechResult(SpeechRecognitionResult result){

    setState(() {
      _lastWords = result.recognizedWords;
    });
    // print(_lastWords);
    final timingVal = Timer.periodic(const Duration(seconds: 1), (timer) {
      // MAIN LOGIC
    });


    // dataTemplate.updateContactInfo(_lastWords);
  }
  void updateTextFields(){
   if(toogleValue){
     AddItemWidget(_lastWords);
   }
   else{
     dataTemplate.updateContactInfo(_lastWords);
     partyText.text = dataTemplate.contactInfo[0]['party'];
     brokerText.text = dataTemplate.contactInfo[1]['broker'];
     transportText.text = dataTemplate.contactInfo[2]['transport'];
     dataTemplate.toggleContactInfo();
   }

  }


  bool toogleValue = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Padding(padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(onPressed: (){
                Navigator.pushNamed(context, '/home');
              }, icon: const Icon(Icons.home, color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/pdf', arguments: dataTemplate);
          }, icon: const Icon(Icons.rectangle, color: Colors.white,))],),),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,60,10,0),
            child: Column(
              children: [
                Center(
                  child: Container(


                    height: 300,
                    decoration: const BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                        bottom: Radius.circular(20))
                    ),


                    child: Column(

                      children: [

                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(

                            width: MediaQuery.of(context).size.width/1.2,
                            child: TextField(
                              controller: partyText,
                              decoration: InputDecoration(
                                  hintText: 'enter text for party',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  label: Text('party'),
                                  labelStyle: const TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(color: Colors.blue)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(width: 2,color: Colors.blue)
                                  )
                              ),

                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(

                            width: MediaQuery.of(context).size.width/1.2,
                            child: TextField(
                              controller: brokerText,
                              decoration: InputDecoration(
                                  hintText: 'enter text for broker',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  label: Text('broker'),
                                  labelStyle: const TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(color: Colors.blue)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(width: 2,color: Colors.blue)
                                  )
                              ),

                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(

                            width: MediaQuery.of(context).size.width/1.2,

                            child: TextField(
                              controller: transportText,
                              decoration: InputDecoration(
                                  hintText: 'enter text for transport',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  label: Text('transport'),
                                  labelStyle: const TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(color: Colors.blue)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(width: 2,color: Colors.blue)
                                  )
                              ),

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: 3.14/2,
                  child: Switch(value: toogleValue,
                      activeColor: Colors.greenAccent,
                    onChanged: (val){
                    setState(() {
                      toogleValue = val;
                    });
                  }),
                ),
                const SizedBox(height: 20,),
                Text('ITEMS',
                  style: TextStyle(letterSpacing: 3,
                fontSize: 24, fontWeight: FontWeight.bold,
                color: Colors.white),),

                Text(_lastWords),
                const SizedBox(height: 20,),
                MaterialButton(onPressed: (){
                  updateTextFields();
                },child: Text(''
                    'Fill the Boxes'),),
                // const SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                        bottom: Radius.circular(18)
                      )
                    ),
                    // color: Colors.white,
                    child: ListView(

                      children: widgetForItem
                    ),
                  ),
                )



              ],
            ),

          ),

        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: _speechToText.isNotListening? _startListening:_stopListening,
          height: MediaQuery.of(context).size.width/5,
          shape: const CircleBorder(),
          color: Colors.grey,
          child: FaIcon(
            _speechToText.isNotListening?FontAwesomeIcons.microphoneSlash:FontAwesomeIcons.microphone,
          size: 32, color: Colors.white,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
