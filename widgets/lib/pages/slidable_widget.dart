import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:widgets/models/user.dart';

enum Actions { share, delete, archive }

class SlidableWidget extends StatefulWidget {
  const SlidableWidget({super.key});

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  List<User> users = allUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slidable widget'),
          centerTitle: true,
        ),
        // backgroundColor: Colors.grey[300],
        body: SlidableAutoCloseBehavior(
          // open only one slidable at atime
          closeWhenOpened: true,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Slidable(
                key: Key(user.name),
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  dismissible: DismissiblePane(
                      onDismissed: () => _onDismissed(index, Actions.share)),
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.green,
                      icon: Icons.share,
                      label: 'Share',
                      onPressed: (context) =>
                          _onDismissed(index, Actions.share),
                    ),
                    SlidableAction(
                      backgroundColor: Colors.blue,
                      icon: Icons.archive,
                      label: 'archive',
                      onPressed: (context) =>
                          _onDismissed(index, Actions.archive),
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  dismissible: DismissiblePane(
                      onDismissed: () => _onDismissed(index, Actions.delete)),
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      label: 'Delete',
                      onPressed: (context) =>
                          _onDismissed(index, Actions.delete),
                    ),
                  ],
                ),
                child: buildUserListTile(user),
              );
            },
          ),
        )

        // SafeArea(
        //   child: Center(
        //     child: Slidable(
        //       startActionPane: ActionPane(
        //         motion: StretchMotion(),
        //         children: [
        //           SlidableAction(
        //             onPressed: ((context) {
        //               print("button clicked");
        //             }),
        //             backgroundColor: Colors.green,
        //             icon: Icons.phone,
        //           ),
        //           SlidableAction(
        //             onPressed: ((context) {
        //               print("button clicked");
        //             }),
        //             backgroundColor: Colors.blue,
        //             icon: Icons.chat,
        //           )
        //         ],
        //       ),
        //       endActionPane: ActionPane(
        //         motion: StretchMotion(),
        //         children: [
        //           SlidableAction(
        //             onPressed: ((context) {
        //               print("delete clicked");
        //             }),
        //             backgroundColor: Colors.red,
        //             foregroundColor: Colors.white,
        //             icon: Icons.delete,
        //             label: "Delete",
        //           ),
        //         ],
        //       ),
        //       child: Container(
        //         color: Colors.grey[300],
        //         child: const ListTile(
        //           title: Text("Mahmoud"),
        //           subtitle: Text("01110671449"),
        //           leading: Icon(
        //             Icons.person,
        //             size: 40,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }

  void _onDismissed(int index, Actions action) {
    final user = users[index];
    setState(() => users.removeAt(index));

    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${user.name} is deleted!', Colors.red);
      case Actions.archive:
        _showSnackBar(context, '${user.name} is archived!', Colors.blue);
      case Actions.share:
        _showSnackBar(context, '${user.name} is shared!', Colors.green);
        break;
      default:
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildUserListTile(User user) => Builder(
        builder: (context) => ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.image),
          ),

          // open slidable on tap
          onTap: () {
            final slidable = Slidable.of(context)!;
            final isClosed =
                slidable.actionPaneType.value == ActionPaneType.none;
            if (isClosed) {
              slidable.openStartActionPane();
            } else {
              slidable.close();
            }
          },
        ),
      );
}
