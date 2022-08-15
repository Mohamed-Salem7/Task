import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message(
      {Key? key,
      required this.isShow,
      required this.image,
      required this.name,
      required this.message,
      required this.isShow2})
      : super(key: key);

  final bool isShow;
  final bool isShow2;
  final String image;
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){},
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                      radius: 30,
                    ),
                  ),
                  if (isShow2)
                    const Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 7,
                      ),
                    ),
                  if (isShow2)
                    const Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 6.5,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      message,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '10:25',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  if (isShow)
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.indigo,
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
