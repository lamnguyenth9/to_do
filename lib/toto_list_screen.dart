import 'package:flutter/material.dart';
import 'package:to_do_list/task.dart';

class TotoListScreen extends StatefulWidget {
  const TotoListScreen({super.key});

  @override
  State<TotoListScreen> createState() => _TotoListScreenState();
}

class _TotoListScreenState extends State<TotoListScreen> {
  final List<Task> _task=[];
  final TextEditingController _controller=TextEditingController();
   bool isComplete=false;
   
  void_addTask(){
    final String task=_controller.text;
    if(task.isNotEmpty){
      setState(() {
        _task.add(Task(name: task));
      });
      _controller.clear();
    }
  }
  void _deleteTask(int index){
    setState(() {
      _task.removeAt(index);
    });
  }
  void toggle(int index){
    setState(() {
       _task[index].isCompleted=!_task[index].isCompleted;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do-List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder()
              ),
            ),),
            ElevatedButton(onPressed: void_addTask, child: Text("Add Task")),
          
            Expanded(child: ListView.builder(
              itemCount: _task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: GestureDetector(

                    onTap:()=> toggle(index),
                    child: Text(_task[index].name)),
                  subtitle: Text(
                    _task[index].isCompleted?"Complete":"incomplete",style: TextStyle(
                      color: _task[index].isCompleted?Colors.green:Colors.red
                    ),
                  ),
                  trailing: IconButton(
                    onPressed:()=> _deleteTask(index),
                    icon:Icon(Icons.delete)
                  ),
                );
              },))
        ],
      ),
    );
  }
}