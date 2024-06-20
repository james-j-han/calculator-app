import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  List<Item> items = [];

  final scrollController = ScrollController();

  String currentNumber = "";
  String previousNumber = "";
  String currentOperation = "";

  void scrollToBottom() {
    // delay between data updating and listview rebuilding
    // therefore following method ensures scroll is delayed a frame
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  void onClearPressed() {
    setState(() {
      currentNumber = "";
      previousNumber = "";
      currentOperation = "";
    });
  }

  void onNumberPressed(String number) {
    setState(() {
      currentNumber += number;
    });
  }

  void onDecimalPressed() {
    setState(() {
      if (!currentNumber.contains('.')) {
        currentNumber += '.';
      }
    });
  }

  void onOperationPressed(String operation) {
    setState(() {
      previousNumber = currentNumber;
      currentOperation = operation;
      currentNumber = "";
    });
  }

  void onBackPressed() {
    setState(() {
      currentNumber = currentNumber.substring(0, currentNumber.length - 1);
    });
  }

  void onEqualsPressed() {
    if (currentOperation.isNotEmpty && previousNumber.isNotEmpty) {
      double num1 = double.parse(previousNumber);
      double num2 = double.parse(currentNumber);
      double result;

      switch (currentOperation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case "*":
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            result = double.nan;
          } else {
            result = num1 / num2;
          }
          break;
        default:
          result = 0.0;
      }

      setState(() {
        currentNumber = result.toString();
        previousNumber = "";
        currentOperation = "";
        items.add(Item(currentNumber));
        scrollToBottom();
      });
    }
  }

  bool isValid(String number) {
    return number != "NaN" ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 197, 200),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(10.0),
                color: const Color.fromARGB(255, 157, 163, 164),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return buildListItem(item, index);
                        }
                      )
                    ),
                    
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(currentNumber, style: myDisplayTextStyle)
                      )
                    ),
                  ],
                )
              )
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => onClearPressed(),
                    style: myBigButtonStyle,
                    child: const Text('C', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () => onBackPressed(),
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
                      onPressed: () => onOperationPressed('/'),
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
                    onPressed: () => onNumberPressed('7'),
                    style: myButtonStyle,
                    child: const Text('7', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('8'),
                    style: myButtonStyle,
                    child: const Text('8', style: myButtonTextStyle,)),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('9'),
                    style: myButtonStyle,
                    child: const Text('9', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () => onOperationPressed('*'),
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
                    onPressed: () => onNumberPressed('4'),
                    style: myButtonStyle,
                    child: const Text('4', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('5'),
                    style: myButtonStyle,
                    child: const Text('5', style: myButtonTextStyle,)),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('6'),
                    style: myButtonStyle,
                    child: const Text('6', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () => onOperationPressed('+'),
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
                    onPressed: () => onNumberPressed('1'),
                    style: myButtonStyle,
                    child: const Text('1', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('2'),
                    style: myButtonStyle,
                    child: const Text('2', style: myButtonTextStyle,)),
                  ElevatedButton(
                    onPressed: () => onNumberPressed('3'),
                    style: myButtonStyle,
                    child: const Text('3', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () => onOperationPressed('-'),
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
                    onPressed: () => onNumberPressed('0'),
                    style: myBigButtonStyle,
                    child: const Text('0', style: myButtonTextStyle,),),
                  ElevatedButton(
                    onPressed: () => onDecimalPressed(),
                    style: myButtonStyle,
                    child: const Text('.', style: myButtonTextStyle,)),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () => onEqualsPressed(),
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

  Widget buildListItem(Item item, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(item.text, style: myHistoryTextStyle,)
      )
    );
  }
}

class Item {
  String text = "";

  Item(this.text);
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

const myHistoryTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 96, 77, 83),
);