class Todo {
  final String uid;
  final String title;
  final String description;
  final bool isComplete;

  Todo({
    required this.uid,
    required this.title,
    required this.description,
    required this.isComplete,
  });
}

List<Todo> listdata = [
  Todo(
    uid: '1',
    title: 'Studi Kasus 1',
    description: 'Membuat Program Dasar Java',
    isComplete: true,
  ),
  Todo(
    uid: '2',
    title: 'Studi Kasus 2',
    description: 'Membuat Studi Kasus List Makanan',
    isComplete: false,
  ),
  Todo(
    uid: '3',
    title: 'Studi Kasus 3',
    description: 'Membuat Aplikasi To Do List',
    isComplete: false,
  ),
];
