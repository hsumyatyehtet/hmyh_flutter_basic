import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: TextFieldExample()));
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<StatefulWidget> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String name = 'Hsu Myat Ye Htet';
  String email = 'hmyh@gmail.com';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameController.text = name;
    _emailController.text = email;

    //Listen to changes
    _nameController.addListener(_onNameTextChange);
    _emailController.addListener(_onEmailTextChange);
  }

  @override
  void dispose() {
    // Important: Dispose controllers to prevent memory leaks
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _emailController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Email is required';
                    }
                    if(!value.contains('@')){
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 16,),
                Text('Name: ${_nameController.text}'),
                Text('Email: ${_emailController.text}'),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: _clearFields,
                        child: const Text('Clear')
                    ),
                    ElevatedButton(
                        onPressed: _setInitialValues,
                        child: const Text('Set Values')
                    ),
                    ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Submit')
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  void _clearFields(){
    _nameController.clear();
    _emailController.clear();
  }
  
  void _setInitialValues(){
    _nameController.text = "hmyh";
    _emailController.text = "hmyh@gmail.com";
  }

  void _submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context,)
          .showSnackBar(const SnackBar(content: Text('Form is valid')));
    }
  }

  void _onNameTextChange() {
    setState(() {
      name = _nameController.text;
    });
  }

  void _onEmailTextChange() {
    setState(() {
      email = _emailController.text;
    });
  }
}
