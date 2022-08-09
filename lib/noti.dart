import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class Noti extends StatefulWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Thông báo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                      ))
                ],
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildBody(index);
                  },
                  itemCount: notificationResponse.data!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(int index) {
    return Row(
      children: [
        avatar(index),
        const SizedBox(
          width: 4,
        ),
        Expanded(child: content(index)),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }

  Widget avatar(int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(28.0),
          child: Image.network(
            '${notificationResponse.data![index].image}',
            width: 56,
            height: 56,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 1.5,
          right: 1.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${notificationResponse.data![index].icon}',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget content(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text('${notificationResponse.data![index].message?.text}'),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: notificationResponse.data![index].subjectName)
            ],
          ),
        ),
        Text(
          DateFormat('dd/MM/yyyy, kk:mm').format(
            DateTime.fromMicrosecondsSinceEpoch(
                notificationResponse.data![index].createdAt! * 1000),
          ),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
