import 'package:flutter/material.dart';
import 'package:tasks/HomeScreen/Container_Home/Details_Message.dart';
import 'package:tasks/HomeScreen/Container_Home/Message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Message',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.indigo,
                            child: Text(
                              '+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            'New',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const DetailsMessage(
                          image: 'assets/images/4.png', name: 'Selina'),
                      const DetailsMessage(
                          image: 'assets/images/5.png', name: 'Sara'),
                      const DetailsMessage(
                          image: 'assets/images/6.png', name: 'Sandra'),
                      const DetailsMessage(
                          image: 'assets/images/7.png', name: 'Elisa'),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                      ),
                      label: const Text(
                        'Search.....',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Message(
                isShow: true,
                isShow2: true,
                image: 'assets/images/4.png',
                name: 'Selina Gomez',
                message:
                    'Lorem ipsum dolor sit in the paypal hhhhhhhhhhhhhhhhhhhhhhh',
              ),
              const Message(
                isShow: true,
                isShow2: false,
                image: 'assets/images/5.png',
                name: 'Sara Bernabue',
                message:
                    'Lorem ipsum dolor sit in the paypal hhhhhhhhhhhhhhhhhhhhhhh',
              ),
              const Message(
                isShow: false,
                isShow2: true,
                image: 'assets/images/6.png',
                name: 'Sandra Debakirou',
                message:
                    'Lorem ipsum dolor sit in the paypal hhhhhhhhhhhhhhhhhhhhhhh',
              ),
              const Message(
                isShow: false,
                isShow2: true,
                image: 'assets/images/7.png',
                name: 'Elisa Alkohi',
                message:
                    'Lorem ipsum dolor sit in the paypal hhhhhhhhhhhhhhhhhhhhhhh',
              ),
              const Message(
                isShow: false,
                isShow2: false,
                image: 'assets/images/8.png',
                name: 'Mohamed Sal',
                message:
                    'Lorem ipsum dolor sit in the paypal hhhhhhhhhhhhhhhhhhhhhhh',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
