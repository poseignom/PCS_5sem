import 'package:flutter/material.dart';
import '../models/note.dart';

class EditNotePage extends StatefulWidget {
  final Note? existing;

  const EditNotePage({super.key, this.existing});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _body;

  @override
  void initState() {
    super.initState();
    _title = widget.existing?.title ?? '';
    _body = widget.existing?.body ?? '';
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final result = widget.existing == null
          ? Note(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: _title,
              body: _body,
            )
          : widget.existing!.copyWith(title: _title, body: _body);

      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Редактировать заметку' : 'Новая заметка'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _save,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(
                  labelText: 'Заголовок',
                  border: OutlineInputBorder(),
                  hintText: 'Введите заголовок заметки',
                ),
                onSaved: (value) => _title = value!.trim(),
                maxLength: 100,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _body,
                decoration: const InputDecoration(
                  labelText: 'Текст заметки',
                  border: OutlineInputBorder(),
                  hintText: 'Введите текст заметки',
                  alignLabelWithHint: true,
                ),
                minLines: 5,
                maxLines: 10,
                onSaved: (value) => _body = value!.trim(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введите текст заметки';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Сохранить',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}