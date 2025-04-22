# 📦 Flutter: SQLite, Hive (NoSQL) e Integração com BLoC

---

## 🔄 SQLite (Relacional)

### 📌 O que é:
SQLite é um banco de dados relacional embutido que funciona como um arquivo local no dispositivo, ideal para dados estruturados e relacionamentos.

### 📁 Estrutura de Arquivo:
- Armazena um arquivo `.db` na pasta privada do app
- Android: `/data/data/seu.package/databases/...`
- iOS: sandbox do app

### 🚀 Vantagens:
- Relacional (bom para dados com relacionamento)
- Offline
- Suporte SQL completo

### 📂 Exemplo: `database_helper.dart`

```dart
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'meubanco.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        email TEXT
      )
    ''');
  }

  Future<int> inserirUsuario(Map<String, dynamic> usuario) async {
    final db = await database;
    return await db.insert('usuarios', usuario);
  }

  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await database;
    return await db.query('usuarios');
  }
}
```

### 🧪 Operações:
```dart
await db.inserirUsuario({'nome': 'Carlos', 'email': 'carlos@email.com'});
final lista = await db.listarUsuarios();
```

---

## 🐝 Hive (NoSQL)

### 📌 O que é:
Hive é um banco de dados local NoSQL, baseado em chaves (key-value), ultra rápido e ideal para persistência leve em apps Flutter.

### 🚀 Vantagens:
- Extremamente rápido
- Fácil de usar
- Não requer SQL
- Pode ser criptografado

### 📂 Exemplo de Model:
```dart
@HiveType(typeId: 0)
class Usuario extends HiveObject {
  @HiveField(0)
  String nome;

  @HiveField(1)
  String email;

  Usuario({required this.nome, required this.email});
}
```

### 🧪 Uso no App:
```dart
await Hive.initFlutter();
Hive.registerAdapter(UsuarioAdapter());
await Hive.openBox<Usuario>('usuarios');

final box = Hive.box<Usuario>('usuarios');

// Inserir
await box.add(Usuario(nome: 'Ana', email: 'ana@email.com'));

// Atualizar
usuario.nome = 'Ana Clara';
await usuario.save();

// Deletar
await usuario.delete();

// Listar
for (var usuario in box.values) {
  print(usuario.nome);
}
```

---

## 🔄 Integração com BLoC (SQLite)

### 📦 Pacotes Necessários:
```yaml
dependencies:
  flutter_bloc: ^8.0.1
  sqflite: ^2.0.0+4
  path_provider: ^2.0.11
```

### 📁 Model `usuario.dart`
```dart
class Usuario {
  final int? id;
  final String nome;
  final String email;

  Usuario({this.id, required this.nome, required this.email});

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
      );
}
```

### 🧱 Bloco de Lógica `usuario_bloc.dart`
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'database_helper.dart';
import 'usuario.dart';

// Eventos
abstract class UsuarioEvent {}
class CarregarUsuariosEvent extends UsuarioEvent {}
class AdicionarUsuarioEvent extends UsuarioEvent {
  final Usuario usuario;
  AdicionarUsuarioEvent(this.usuario);
}

// Estados
abstract class UsuarioState {}
class UsuarioLoading extends UsuarioState {}
class UsuarioLoaded extends UsuarioState {
  final List<Usuario> usuarios;
  UsuarioLoaded(this.usuarios);
}

// BLoC
class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final DatabaseHelper db = DatabaseHelper();

  UsuarioBloc() : super(UsuarioLoading()) {
    on<CarregarUsuariosEvent>((event, emit) async {
      final data = await db.listarUsuarios();
      final usuarios = data.map((e) => Usuario.fromMap(e)).toList();
      emit(UsuarioLoaded(usuarios));
    });

    on<AdicionarUsuarioEvent>((event, emit) async {
      await db.inserirUsuario({
        'nome': event.usuario.nome,
        'email': event.usuario.email,
      });
      add(CarregarUsuariosEvent());
    });
  }
}
```

### 🎯 Uso no Widget
```dart
class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsuarioBloc()..add(CarregarUsuariosEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Usuários')),
        body: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (context, state) {
            if (state is UsuarioLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UsuarioLoaded) {
              return ListView.builder(
                itemCount: state.usuarios.length,
                itemBuilder: (context, index) {
                  final u = state.usuarios[index];
                  return ListTile(title: Text(u.nome));
                },
              );
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final novoUsuario = Usuario(nome: 'Teste', email: 'teste@email.com');
            context.read<UsuarioBloc>().add(AdicionarUsuarioEvent(novoUsuario));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```

---

## 🔍 Comparativo Rápido

| Característica         | SQLite                    | Hive (NoSQL)             |
|------------------------|---------------------------|--------------------------|
| Tipo                   | Relacional (SQL)          | NoSQL (key-value)        |
| Estrutura              | Tabelas e colunas         | Box (tipo Map)           |
| Performance            | Boa                       | Altíssima                |
| Reque