
import 'package:book_management_software/page_2.dart';
import 'package:book_management_software/page_3.dart';
import 'package:book_management_software/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


class Add_Book extends StatefulWidget {
  const Add_Book({Key? key}) : super(key: key);

  @override
  State<Add_Book> createState() => _Add_BookState();
}

class _Add_BookState extends State<Add_Book> {

    CollectionReference _reference =
      FirebaseFirestore.instance.collection('Books');
  
  TextEditingController _controller_Book_Name = TextEditingController();
  TextEditingController _controller_P_Name = TextEditingController();

  TextEditingController _controller_P_Age = TextEditingController();//drop down
  TextEditingController _controller_Page_Number = TextEditingController();
  TextEditingController _controller_Type = TextEditingController();
  TextEditingController _controller_id = TextEditingController();//check box
    Rx<TextEditingController> _P_date_Controller = TextEditingController().obs;
  String? dob;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (selected != null && selected != selectedDate) {
      _P_date_Controller.value.text =
          "${selected.day} - ${selected.month} - ${selected.year}";
    } else {}
  }
  GlobalKey<FormState> key = GlobalKey();


       String _catValue = '20';
       
   bool valuefirst = false;  
         bool valuesecond = false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Book'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  controller:_controller_Book_Name,
                  decoration:
                      InputDecoration(hintText: 'Enter Book name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Book name';
                    } return null;
                  },
                ),SizedBox(height:5),
                              TextFormField(
                  controller:_controller_P_Name,
                  decoration:
                      InputDecoration(hintText: 'Enter Publisher name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Publisher name';
                    } return null;
                  },
                ),SizedBox(height: 10,),
                   Text("Enter Age",style: TextStyle(fontSize: 20),),
                         Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    
                style: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
                value: _catValue,
                iconEnabledColor: Colors.black,
                dropdownColor: Color.fromARGB(255, 158, 194, 224),
                
                onChanged: (value) {
                  setState(() {
                    _catValue = value!;
                  });
                  
                },
                hint: const Text('Enter Age'),
              
                items: const [
                  DropdownMenuItem(
                    child: Text(
                      '20',
                    ),
                    value: '20',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      '21',
                    ),
                    value: '21',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      '22',
                    ),
                    value: '22',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      '23',
                    ),
                    value: '23',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      '24',
                    ),
                    value: '24',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      '25',
                    ),
                    value: '25',
                  ),
                   DropdownMenuItem(
                    child: Text(
                      '26',
                    ),
                    value: '26',
                  ),
                   DropdownMenuItem(
                    child: Text(
                      '27',
                    ),
                    value: '27',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '28',
                    ),
                    value: '28',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '29',
                    ),
                    value: '29',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '30',
                    ),
                    value: '30',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '31',
                    ),
                    value: '31',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '32',
                    ),
                    value: '32',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '33',
                    ),
                    value: '33',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '34',
                    ),
                    value: '34',
                  ),
                    DropdownMenuItem(
                    child: Text(
                      '35',
                    ),
                    value: '35',
                  ),
                ],
              )),
            ),
          ),
        ),
                TextFormField(
                 keyboardType: TextInputType.number,
                  controller: _controller_Page_Number,
                  decoration:
                      InputDecoration(hintText: 'Enter Page Number'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Page Number';
                    }
      
                    return null;
                  },
                ),
                
                  SizedBox(height:5), 
              Obx(
                () => TextFormField(
                  controller: _P_date_Controller.value,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "Publish Date",
                      hintStyle: TextStyle(fontSize: 15.0),
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_month_rounded),
                      )),
                ),
              ),

        // Row(    
        //         children: <Widget>[  
        //           TextWidget(text: 'Type', color: Colors.black,),
        //           SizedBox(width: 10,),  
                  
        //           CheckboxListTile(  
                      
        //             title: const Text('Sci-fi'),  
                     
        //             value: this.valuefirst,  
        //             onChanged: (value) {  
        //               setState(() {  
        //                 this.valuefirst = value!;  
        //               });  
        //             },  
        //           ),  
        //           CheckboxListTile(  
        //             controlAffinity: ListTileControlAffinity.trailing,  
                      
        //             title: const Text('Drama'),  
                      
        //             value: this.valuesecond,  
        //             onChanged: ( value) {  
        //               setState(() {  
        //                 this.valuesecond = value!;  
        //               });  
        //             },  
        //           ),  
                //           CheckboxListTile(  
        //             controlAffinity: ListTileControlAffinity.trailing,  
                      
        //             title: const Text('Novel'),  
                      
        //             value: this.valuesecond,  
        //             onChanged: ( value) {  
        //               setState(() {  
        //                 this.valuesecond = value!;  
        //               });  
        //             },  
        //           ),  
      
        //         ], ), 
       
               
                SizedBox(height: 10,),   
                ElevatedButton(
                    onPressed: ()  {
              
                      if (key.currentState!.validate()) {
                        String book_name = _controller_Book_Name.text;
                        String age = _catValue;
                        String p_name = _controller_P_Name.text;
                        String page_number = _controller_Page_Number.text;
                        String  id=DateTime.now().millisecondsSinceEpoch.toString();
      
                       
                        Map<String, String> dataToSend = {
                          'book_name': book_name,
                          'Publisher name':p_name,
                          'Publisher age': age,
                          'Page Number':page_number,
                          
                          'Publish Date':_selectDate.toString(),
                          'id':id,
                         // 'Book Type': book_type,
                          
                          
                        };
      
                       
                        _reference.add(dataToSend);
                              
                      }
                       Navigator.push(context, MaterialPageRoute(builder:((c) => ViewBookList())));
                    },
                    child: Text('Save')),

                    ElevatedButton(
                      onPressed:() {Navigator.push(context, MaterialPageRoute(builder:((c) => Report_Screen())));},
                     child: Text('Go to Report'))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
