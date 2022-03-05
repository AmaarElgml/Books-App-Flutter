import 'package:books_store_app/style/app_theme.dart';
import 'package:books_store_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

Widget customDivider = Container(
  width: double.infinity,
  height: .5,
  color: Colors.white,
);

class TitleText extends StatelessWidget {
  TitleText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: defSpacing, bottom: defSpacing / 4),
        child: Row(children: [
          Text("$title", style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w900))
        ]));
  }
}

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    required this.controller,
    required this.hint,
    required this.onTap,
    required this.icon,
    required this.list,
  });

  final TextEditingController controller;
  final List<String> list;
  final String hint;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SearchField(
        controller: controller,
        suggestions: list.map((e) {
          return SearchFieldListItem(e, child: Text(e));
        }).toList(),
        hint: hint,
        searchInputDecoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: kSignInputBorder,
            disabledBorder: kSignInputBorder,
            focusedBorder: kSignInputBorder,
            border: kSignInputBorder),
        // suggestionState: SuggestionState.onTap,
        maxSuggestionsInViewPort: 6,
        itemHeight: 50,
        onTap: (item) {
          onTap(item);
        },
        suggestionAction: SuggestionAction.next);
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hint, required this.iconData, required this.onSaved, this.controller, this.borders});

  final String hint;
  final IconData iconData;
  final Function onSaved;
  final TextEditingController? controller;
  final InputBorder? borders;

  String _getErrorMessage() {
    switch (hint) {
      case 'Email':
        return 'Email is empty!';
      case 'Password':
        return 'Password is empty!';
    }
    return 'Value is empty';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller != null ? controller : null,
        validator: (value) {
          return _getErrorMessage();
        },
        onSaved: (value) {
          onSaved(value);
        },
        obscureText: hint == 'Enter your password' ? true : false,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(iconData),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: borders ?? kSignInputBorder,
            disabledBorder: borders ?? kSignInputBorder,
            focusedBorder: borders ?? kSignInputBorder,
            border: borders ?? kSignInputBorder));
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({required this.title, required this.onPressed, this.titleColor, this.backColor});

  final String title;
  final Color? titleColor;
  final Color? backColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0, color: titleColor ?? Colors.white),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(defSpacing * .75)),
          shape:
              MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(defSpacing * .75))),
          backgroundColor: MaterialStateProperty.all(backColor ?? primaryColor),
        ));
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon, color: primaryColor),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          onPressed();
        });
  }
}

class CustomCircularProgress extends StatelessWidget {
  CustomCircularProgress(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
