
import 'package:flutter/material.dart';

class TestPAckageScreen extends StatefulWidget {
  const TestPAckageScreen({super.key});

  @override
  State<TestPAckageScreen> createState() => _TestPAckageScreenState();
}

class _TestPAckageScreenState extends State<TestPAckageScreen> {
  @override
  List<String> names = ['Shoes','Trousers','Jeans','Jacket','Belt','Others'];
  int selectedindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.white,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var item = names[index];
                      names.removeAt(index);
                      names.insert(1, item);
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        decoration: BoxDecoration(
                            color: selectedindex==index?Colors.blue:Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text(names[index])),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 10,),
          Center(child: Text('Selected Category :  '+names[selectedindex]),)
        ],
      ),
    );
  }

  void swapitems(int index)
  {
    String temp;
    temp=names[index];
    names[index]=names[0];
    names[0]=temp;
  }

}
