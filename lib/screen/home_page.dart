import 'dart:math';

import 'package:clone_gmail/data/message.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length, itemBuilder: (context, index){
        return  ListTile(
          onTap: (){},
          shape: const Border(
            bottom: BorderSide(color: Colors.grey, width: 0.3),
          ),
          isThreeLine: true,
          leading:  CircleAvatar(
            radius: 25,
            backgroundColor: Colors.primaries[
            Random().nextInt(Colors.primaries.length)
            ].shade200,
            foregroundColor: Colors.black,
            child: Text(messages[index]["title"]![0]),
          ),
          title: Text(messages[index]["title"]!),
          subtitle: Text(
              messages[index]["body"]!,
              overflow: TextOverflow.ellipsis,
            maxLines: 2
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  TimeOfDay.fromDateTime(
                      DateTime.parse(messages[index]!["date"].toString())
                  ).format(context)
              ),
             const Icon(Icons.star_outlined)
            ],
          ),
        );
      }),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Gmail", style: TextStyle(
                  color: Colors.red,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize
              ),),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.all_inbox),
              title:  Text("Toutes les boîtes de réception"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Principale"),
            ),
            const ListTile(
              leading: Icon(Icons.group_outlined),
              title: Text("Réseaux sociaux"),
            ),
            const ListTile(
              leading: Icon(Icons.discount_outlined),
              title: Text("Promotions"),
              trailing: Chip(
                backgroundColor: Colors.lightGreen,
                label: Text("99+ nouveaux"),
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.star_outline),
              title: Text("Favoris"),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Reportés"),
            ),
            const ListTile(
              leading: Icon(Icons.label_important_outline),
              title: Text("Important"),
              trailing: Text("3"),
            ),
            const ListTile(
              leading: Icon(Icons.send),
              title: Text("Envoyés"),
            ),
            const ListTile(
              leading: Icon(Icons.schedule_send_outlined),
              title: Text("Planifiés"),
            ),
            const ListTile(
              leading: Icon(Icons.outbox_outlined),
              title: Text("Boîte d'envoi"),
            ),
            const ListTile(
              leading: Icon(Icons.inbox),
              title: Text("Brouillons"),
              trailing: Text("99+"),
            ),
            const ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text("Tous les messages"),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Spam"),
            ),
            const ListTile(
              leading: Icon(Icons.delete_outline),
              title: Text("Corbeille"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){},
        child: const Icon(Icons.edit)),
    );
  }
}
