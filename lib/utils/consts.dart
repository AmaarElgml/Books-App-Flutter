import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final double defSpacing = 16.0;
String userDefaultAvatar =
    'https://media.gettyimages.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?k=20&m=1300845620&s=612x612&w=0&h=f4XTZDAv7NPuZbG0habSpU0sNgECM0X7nbKzTUta3n8=';

void navigateTo(context, destination) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => destination));
}

final List<int> booksTabsNotify = [3, 8, 20, 16];

Future<void> textInputDialog(
    {required String title,
      required String inputHint,
      required Function addPressed,
      required BuildContext context,
      required TextEditingController controller}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(title),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    addPressed();
                  },
                  child: Text('Add')),
            ],
            content: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: inputHint,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(color: Colors.blue.shade200)))));
      });
}

showAlertDialog(
    {required BuildContext context, required btnText, required btnPressed}) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            title: Text('Book store'),
            actionsPadding: EdgeInsets.all(8),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    btnPressed();
                  },
                  child: Text(btnText)),
            ]);
      });
}

showLoaderDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Row(children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: defSpacing),
              child: Text("Loading..."))
        ]));
      });
}

void showSnackBar(
    {required context, required text, required ToastStates state}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: chooseToastColor(state),
  ));
}

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
