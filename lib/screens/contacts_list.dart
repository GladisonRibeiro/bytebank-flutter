import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts_form.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: dependencies.contactDAO.findAll(),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return Progress(); // Center
              break;

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return ContactItem(
                    contact: contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TransactionForm(contact),
                        ),
                      );
                    },
                  );
                },
                itemCount: contacts.length,
              ); //ListView.builder
              break;
          }

          return CenteredMessage('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactsForm(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const ContactItem({Key key, this.contact, @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          this.onClick();
        },
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
