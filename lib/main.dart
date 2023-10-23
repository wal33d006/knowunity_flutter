import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:knowunity_flutter/data/repositories/rest_api_todos_repository.dart';
import 'package:knowunity_flutter/domain/fetch_todos_use_case.dart';
import 'package:knowunity_flutter/domain/repositories/todos_repository.dart';
import 'package:knowunity_flutter/domain/stores/todo_list_in_memory_store.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_initial_params.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_navigator.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_page.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_presentation_model.dart';
import 'package:knowunity_flutter/features/create_todo/create_todo_presenter.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_initial_params.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_navigator.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_page.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presentation_model.dart';
import 'package:knowunity_flutter/features/todo_list/todo_list_presenter.dart';
import 'package:knowunity_flutter/navigation/app_navigator.dart';

final getIt = GetIt.instance;

void main() {
  _registerDependencies();
  runApp(const MyApp());
}

void _registerDependencies() {
  getIt
    ..registerLazySingleton(
      () => TodoListInMemoryStore(),
    )
    ..registerFactory<AppNavigator>(
      () => AppNavigator(),
    )
    ..registerFactory<TodosRepository>(
      () => RestApiTodosRepository(),
    )
    ..registerFactory<FetchTodosUseCase>(
      () => FetchTodosUseCase(
        getIt(),
        getIt(),
      ),
    )
    ..registerFactory<TodoListNavigator>(
      () => TodoListNavigator(getIt()),
    )
    ..registerFactoryParam<TodoListPresentationModel, TodoListInitialParams, dynamic>(
      (params, _) => TodoListPresentationModel.initial(params),
    )
    ..registerFactoryParam<TodoListPresenter, TodoListInitialParams, dynamic>(
      (initialParams, _) => TodoListPresenter(
        getIt(param1: initialParams),
        getIt(),
        getIt(),
      )..onInit(),
    )
    ..registerFactoryParam<TodoListPage, TodoListInitialParams, dynamic>(
      (initialParams, _) => TodoListPage(
        presenter: getIt(param1: initialParams),
      ),
    )
    ..registerFactory<CreateTodoNavigator>(
      () => CreateTodoNavigator(getIt()),
    )
    ..registerFactoryParam<CreateTodoPresentationModel, CreateTodoInitialParams, dynamic>(
      (params, _) => CreateTodoPresentationModel.initial(params),
    )
    ..registerFactoryParam<CreateTodoPresenter, CreateTodoInitialParams, dynamic>(
      (initialParams, _) => CreateTodoPresenter(
        getIt(param1: initialParams),
        getIt(),
        getIt(),
      ),
    )
    ..registerFactoryParam<CreateTodoPage, CreateTodoInitialParams, dynamic>(
      (initialParams, _) => CreateTodoPage(
        presenter: getIt(param1: initialParams),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: AppNavigator.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getIt<TodoListPage>(param1: const TodoListInitialParams()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
