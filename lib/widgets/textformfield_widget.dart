// ignore_for_file: must_be_immutable

import 'package:absensi_online/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  bool usingTittle;
  bool readOnly;
  bool usingHideText;
  String? tittle;
  String? formNama;
  String? hint;
  String? comment;
  VoidCallback? onTap;
  TextInputType? keyboardType;
  FormFieldValidator<String>? validasi;
  TextEditingController? controller;

  CustomTextFormField(
      {super.key,
      this.usingHideText = false,
      this.controller,
      this.usingTittle = false,
      this.tittle,
      this.formNama,
      this.comment,
      this.keyboardType,
      this.hint,
      this.validasi,
      this.readOnly = false,
      this.onTap});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.usingTittle == false ? SizedBox() : (Text(widget.tittle!)),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 35,
          child: TextFormField(
            autofocus: false,
            validator: widget.validasi,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            controller: widget.controller,
            obscureText: widget.usingHideText == false ? false : !_hidePassword,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              filled: true,
              hintText: widget.hint,
              labelStyle: const TextStyle(color: Colors.black87),
              labelText: widget.formNama,
              helperText: widget.comment,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // border: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 5),
              isDense: true,
              suffixIcon: widget.usingHideText == false
                  ? SizedBox()
                  : IconButton(
                      icon: Icon(
                        _hidePassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
