import 'package:flutter/material.dart';
import 'package:flutter_task_3_2/json_module/post.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
    required this.serverData,
    required this.index,
  }) : super(key: key);

  final List<Post> serverData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.mail_outline,
              size: 34.0,
            ),
            title: Text('Post № ${serverData[index].id}'),
            subtitle: Text(
              serverData[index].title,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              serverData[index].body,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6), fontSize: 16.0),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_alt_outlined,
                    color: Colors.green),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_down_alt_outlined,
                    color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
