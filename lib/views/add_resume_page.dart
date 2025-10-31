import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../viewmodels/user_viewmodel.dart';
import 'package:go_router/go_router.dart';

class AddResumePage extends StatefulWidget {
  final UserModel? baseUser;
  const AddResumePage({super.key, this.baseUser});

  @override
  State<AddResumePage> createState() => _AddResumePageState();
}

class _AddResumePageState extends State<AddResumePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController professionController;
  late TextEditingController aboutController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController linkedInController;

  @override
  void initState() {
    super.initState();
    final base = widget.baseUser;
    nameController = TextEditingController(text: base?.name ?? '');
    professionController = TextEditingController(text: base?.profession ?? '');
    aboutController = TextEditingController(text: base?.about ?? '');
    emailController = TextEditingController(text: base?.email ?? '');
    phoneController = TextEditingController(text: base?.phone ?? '');
    linkedInController = TextEditingController(text: base?.linkedIn ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final userVm = context.read<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.baseUser == null
            ? 'Нове резюме'
            : 'Дублювання резюме'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildField('Ім’я', nameController),
              _buildField('Професія', professionController),
              _buildField('Про себе', aboutController, maxLines: 3),
              _buildField('Email', emailController,
                  validator: (v) => v!.contains('@') ? null : 'Некоректний email'),
              _buildField('Телефон', phoneController),
              _buildField('LinkedIn', linkedInController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newUser = UserModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: nameController.text,
                      profession: professionController.text,
                      about: aboutController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      linkedIn: linkedInController.text,
                    );
                    userVm.addUser(newUser);
                    context.go('/');
                  }
                },
                child: const Text('Зберегти'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller,
      {int maxLines = 1, String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator ??
                (v) => v == null || v.isEmpty ? 'Поле не може бути порожнім' : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
