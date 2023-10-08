import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            "Deal of the day",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://plus.unsplash.com/premium_photo-1684175656278-3759b542bb21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQ5fE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Yasser Darwish',
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1672929280546-af55a5554fd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1672929280546-af55a5554fd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1672929280546-af55a5554fd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1672929280546-af55a5554fd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUxfE04alZiTGJUUndzfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          child: Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
