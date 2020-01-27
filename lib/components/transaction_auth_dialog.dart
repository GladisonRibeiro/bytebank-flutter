import 'package:flutter/material.dart';

const Key transactionAuthDialogTextFieldPasswordKey =
    Key('transactionAuthDialogTextFieldPassword');

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const TransactionAuthDialog({Key key, @required this.onConfirm})
      : super(key: key);

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        key: transactionAuthDialogTextFieldPasswordKey,
        controller: _passwordController,
        obscureText: true,
        keyboardType: TextInputType.number,
        maxLength: 4,
        decoration: InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 64.0, letterSpacing: 24.0),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Confirm'),
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
