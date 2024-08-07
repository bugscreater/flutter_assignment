class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDo(id: '03', todoText: 'Check Emails', isDone: false),
      ToDo(id: '04', todoText: 'Team meeting', isDone: false),
      ToDo(id: '05', todoText: 'Dinner with jenny', isDone: false),
      ToDo(id: '06', todoText: 'Go to the gym', isDone: false),
      ToDo(id: '07', todoText: 'Go to the club', isDone: false),
      ToDo(id: '08', todoText: 'Do some code', isDone: false),
      ToDo(id: '09', todoText: 'Dinner', isDone: false),
    ];
  }
}
