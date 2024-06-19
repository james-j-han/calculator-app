import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: const Display(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
  ));
}

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  double minButtonWidth = 80;
  double minButtonHeight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 197, 200),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      // height: 140.0,
                      // padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: const EdgeInsets.all(10.0),
                      color: const Color.fromARGB(255, 157, 163, 164),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: const Align(
                          alignment: Alignment.bottomRight,
                          child: Text('Error', style: myDisplayTextStyle)
                        )
                      )
                    )
                  )
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: myBigButtonStyle,
                    child: const Text('C', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: myButtonStyle,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 157, 163, 164), BlendMode.srcIn),
                        child: Image.asset('lib/icons/delete.png'),
                      )
                    )
                  ),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: myButtonStyle,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 157, 163, 164), BlendMode.srcIn),
                        child: Image.asset('lib/icons/division.png')
                      )
                    )
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('7', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('8', style: myButtonTextStyle,)),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('9', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: myButtonStyle,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 157, 163, 164), BlendMode.srcIn),
                        child: Image.asset('lib/icons/multiplication.png')
                      )
                    )
                  ),
                ],
              ),
            ),
        
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('4', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('5', style: myButtonTextStyle,)),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('6', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: myButtonStyle,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 157, 163, 164), BlendMode.srcIn),
                        child: Image.asset('lib/icons/addition.png')
                      )
                    )
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('1', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('2', style: myButtonTextStyle,)),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('3', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: myButtonStyle,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 157, 163, 164), BlendMode.srcIn),
                        child: Image.asset('lib/icons/subtraction.png')
                      )
                    )
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: myBigButtonStyle,
                    child: const Text('0', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () {},
                    style: myButtonStyle,
                    child: const Text('.', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: myButtonStyle,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 157, 163, 164), BlendMode.srcIn),
                        child: Image.asset('lib/icons/equals.png')
                      )
                    )
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

final myButtonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(80.0, 80.0),
  elevation: 0,
  backgroundColor: const Color.fromARGB(255, 96, 77, 83),
  foregroundColor: const Color.fromARGB(255, 157, 163, 164),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0)
  ),
);

final myBigButtonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(174.0, 80.0),
  elevation: 0,
  backgroundColor: const Color.fromARGB(255, 96, 77, 83),
  foregroundColor: const Color.fromARGB(255, 157, 163, 164),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0)
  ),
);

const myButtonTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  // color: Colors.orange,
);

const myDisplayTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 96, 77, 83),
);