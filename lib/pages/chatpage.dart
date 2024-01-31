import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF553370),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined,
                      color: Color(0xffc199cd)),
                  SizedBox(
                    width: 100.0,
                  ),
                  Text(
                    'Georgina',
                    style: TextStyle(
                        color: Color(0xffc199cd),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 50.0, bottom: 20.0),
              height: MediaQuery.of(context).size.height / 1.146,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 234, 236, 240),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: const Text(
                      'Hello, How was the day?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 3),
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 211, 228, 243),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: const Text(
                      'The day was really good',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a Message',
                                hintStyle: TextStyle(color: Colors.black45),
                              ),
                            ),
                          )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color(0xFFf3f3f3),
                                borderRadius: BorderRadius.circular(60)),
                            child: const Center(
                              child:  Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 164, 154, 152),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
