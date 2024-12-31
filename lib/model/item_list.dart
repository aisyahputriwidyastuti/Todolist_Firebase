import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'todo.dart';

class ItemList extends StatelessWidget {
  final String transaksiDocId;
  final Todo todo;

  const ItemList({
    super.key,
    required this.todo,
    required this.transaksiDocId,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference todoCollection = _firestore.collection('Todos');

    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    return GestureDetector(
      onTap: () {
        // Show the update dialog when tapped
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Update Todo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController..text = todo.title ?? '',
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextField(
                  controller: _descriptionController..text = todo.description ?? '',
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('Batalkan'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  // Update the Todo when tapped
                  updateTodo(
                    _firestore,
                    transaksiDocId,
                    _titleController,
                    _descriptionController,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    todo.title ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    todo.description ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ChecklistButton(
              isComplete: todo.isComplete,
              onChanged: (bool value) {
                todoCollection.doc(transaksiDocId).update({'isComplete': value});
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                // Call deleteTodo function
                deleteTodo(_firestore, transaksiDocId);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to delete Todo
  Future<void> deleteTodo(FirebaseFirestore firestore, String docId) async {
    try {
      await firestore.collection('Todos').doc(docId).delete();
    } catch (e) {
      print('Error deleting Todo: $e');
    }
  }

  // Function to update Todo
  Future<void> updateTodo(
    FirebaseFirestore firestore,
    String docId,
    TextEditingController titleController,
    TextEditingController descriptionController,
  ) async {
    try {
      await firestore.collection('Todos').doc(docId).update({
        'title': titleController.text,
        'description': descriptionController.text,
        'isComplete': false, // Resetting isComplete when updating
      });
    } catch (e) {
      print('Error updating Todo: $e');
    }
  }
}

class ChecklistButton extends StatefulWidget {
  final bool isComplete;
  final ValueChanged<bool> onChanged;

  const ChecklistButton({
    super.key,
    required this.isComplete,
    required this.onChanged,
  });

  @override
  State<ChecklistButton> createState() => _ChecklistButtonState();
}

class _ChecklistButtonState extends State<ChecklistButton> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isComplete;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: isChecked ? Colors.blue : Colors.grey,
        size: 25,
      ),
      onPressed: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked); // Update Firestore with new status
      },
    );
  }
}
