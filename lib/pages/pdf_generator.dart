import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:voice_invoice/apicalls/pdf_api.dart';
import 'package:voice_invoice/apicalls/pdf_design_widgets.dart';
import 'package:voice_invoice/model/customer.dart';
import 'package:voice_invoice/model/invoice.dart';
import 'package:voice_invoice/model/supplier.dart';
import 'package:voice_invoice/pasers/parsingclass.dart';


class PdfGeneratorWidget extends StatefulWidget {
  const PdfGeneratorWidget({Key? key}) : super(key: key);

  @override
  _PdfGeneratorWidgetState createState() => _PdfGeneratorWidgetState();
}

class _PdfGeneratorWidgetState extends State<PdfGeneratorWidget> {


  ParsingClass prevData = ParsingClass(contactInfoFilled: false, itemsInfoFilled: false);
  @override
  void initState(){
    super.initState();
  }
  String partyName = '';




  @override
  Widget build(BuildContext context) {
    prevData = ModalRoute.of(context)!.settings.arguments as ParsingClass;
    partyName = (prevData.contactInfo[0]['party']);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32,),
              MaterialButton(onPressed: ()async{
                final date = DateTime.now();
                final dueDate = date.add(Duration(days: 7));

                final invoice = Invoice(
                  supplier: Supplier(
                    name: '8BitNomads',
                    address: 'Kotdwar, UTTARAKHAND',
                    paymentInfo: 'https://gpay.me/harshitjadli44@okhdfcbank',
                  ),
                  customer: Customer(
                    name: partyName,
                    address: 'Pune',
                  ),
                  info: InvoiceInfo(
                    date: date,
                    dueDate: dueDate,
                    description: 'My description...',
                    number: '${DateTime.now().year}-9999',
                  ),
                  items: [
                    InvoiceItem(
                      description: 'Coffee',
                      date: DateTime.now(),
                      quantity: 3,
                      gst: 0.18,
                      unitPrice: 5.99,
                    ),
                    InvoiceItem(
                      description: 'Water',
                      date: DateTime.now(),
                      quantity: 8,
                      gst: 0.18,
                      unitPrice: 0.99,
                    ),
                    InvoiceItem(
                      description: 'Orange',
                      date: DateTime.now(),
                      quantity: 3,
                      gst: 0.18,
                      unitPrice: 2.99,
                    ),
                    InvoiceItem(
                      description: 'Apple',
                      date: DateTime.now(),
                      quantity: 8,
                      gst: 0.18,
                      unitPrice: 3.99,
                    ),
                    InvoiceItem(
                      description: 'Mango',
                      date: DateTime.now(),
                      quantity: 1,
                      gst: 0.18,
                      unitPrice: 1.59,
                    ),
                    InvoiceItem(
                      description: 'Blue Berries',
                      date: DateTime.now(),
                      quantity: 5,
                      gst: 0.18,
                      unitPrice: 0.99,
                    ),
                    InvoiceItem(
                      description: 'Lemon',
                      date: DateTime.now(),
                      quantity: 4,
                      gst: 0.18,
                      unitPrice: 1.29,
                    ),
                  ],
                );
                final pdfFile = await PdfHelper.generate(invoice);
                PdfApi.openFile(pdfFile);
              },
                child: Text('PDF'),)
            ],
          ),
        ),
      ),
    );
  }
}
