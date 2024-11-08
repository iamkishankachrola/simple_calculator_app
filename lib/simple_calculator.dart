import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  final TextEditingController _firstNumber = TextEditingController();
  final TextEditingController _secondNumber = TextEditingController();
  dynamic _result="";int _count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:const Text("Simple Calculator",style: TextStyle(color: Colors.white,fontSize: 26),),
        backgroundColor:const Color(0xff16697a) ,
        centerTitle: true,
      ),
      body: Container(
        width:double.infinity,
        height:double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color(0xffede7e3),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            TextField(
              controller: _firstNumber,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Color(0xff16697a),fontSize: 18),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff82c0cc),
                  width: 2
                ),
              ),
                    focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(0xff16697a),
                    width: 2
                ),

            ),
                    hintText: "Please Enter First Number", 
                    hintStyle:const TextStyle(color: Color(0xff16697a),fontSize: 16)
                )
            ),
            const SizedBox(height: 50,),
            TextField(
              controller: _secondNumber,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Color(0xff16697a),fontSize: 18),
                decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color(0xff82c0cc),
                          width: 2
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color(0xff16697a),
                          width: 2
                      ),
                    ),
                    hintText: "Please Enter Second Number",
                    hintStyle:const TextStyle(color: Color(0xff16697a),fontSize: 16)
                )
            ),
            const SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  _count=1;
                },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0xff16697a),
                      foregroundColor: const Color(0xff82c0cc)
                    ),
                    child: const Text("+",style: TextStyle(fontSize: 26,color:Colors.white),)),
                ElevatedButton(onPressed: (){
                  _count=2;

                },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xff16697a),
                        foregroundColor: const Color(0xff82c0cc),
                    ),
                    child: const Text("-",style: TextStyle(fontSize: 26,color:Colors.white),)),
                ElevatedButton(onPressed: (){
                  _count=3;
                },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xff16697a),
                        foregroundColor: const Color(0xff82c0cc),
                    ),
                    child: const Text("*",style: TextStyle(fontSize: 26,color:Colors.white),)),
                ElevatedButton(onPressed: (){
                  _count=4;
                },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xff16697a),
                        foregroundColor: const Color(0xff82c0cc)
                    ),
                    child: const Text("/",style: TextStyle(fontSize: 26,color:Colors.white),)),
              ],
            ),
            const SizedBox(height: 80,),
            ElevatedButton(onPressed: (){
              num number1 = num.parse(_firstNumber.text);
              num number2 = num.parse(_secondNumber.text);
              setState(() {
                switch(_count){
                  case 1:
                    _result = number1+number2;
                    break;
                  case 2:
                    _result = number1 - number2;
                    break;
                  case 3:
                    _result = number1 * number2;
                    break;
                  case 4:
                   if(number2==0){
                     _result = "Error: Divide by 0.";
                   }else{
                     _result = number1 / number2;
                   }
                    break;
                }
              });
            },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xffffa62b),
                    elevation: 10,
                    shadowColor: const Color(0xffffa62b)
                ),
                child: const Text("Result",style: TextStyle(fontSize: 26,color:Colors.white),)),
            const SizedBox(height: 70,),
            Text("$_result",style: const TextStyle(color: Color(0xff16697a),fontSize:40,fontWeight: FontWeight.bold))

          ],
        ),

      ),

    );
  }


}