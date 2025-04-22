# 📦 Introdução ao SQLite e Conceitos de Banco de Dados

## O que é SQLite?

SQLite é um banco de dados relacional leve e embutido, que fica armazenado diretamente no dispositivo móvel como um arquivo `.db`.  
Ele **não precisa de servidor** para funcionar, ideal para apps Flutter que funcionam offline ou armazenam dados localmente.

No Flutter, usamos pacotes como `sqflite` para interagir com o SQLite.

---

## Onde o banco fica armazenado?

O banco de dados é salvo em uma pasta privada do aplicativo no dispositivo:

- **Android**: `/data/data/seu.app.package/databases/seubanco.db`
- **iOS**: dentro do sandbox do app

O usuário comum **não acessa** esse banco diretamente.

---

## 🧠 Conceitos Fundamentais de Banco de Dados

| Conceito           | Descrição                                                                 |
|--------------------|--------------------------------------------------------------------------|
| **Tabela**         | Conjunto de dados organizados em colunas e linhas                        |
| **Linha (registro)** | Uma entrada na tabela (Ex: um usuário)                                   |
| **Coluna (campo)** | Um tipo de dado da tabela (Ex: nome, idade)                              |
| **Chave Primária** | Campo único identificador (Ex: `id INTEGER PRIMARY KEY`)                 |
| **SELECT**         | Buscar dados                                                             |
| **INSERT**         | Inserir dados                                                            |
| **UPDATE**         | Atualizar dados                                                          |
| **DELETE**         | Remover dados                                                            |
| **WHERE**          | Filtro para ações (Ex: `WHERE idade > 18`)                               |
| **JOIN**           | Junta dados de tabelas diferentes usando relacionamentos                 |
| **Índice**         | Acelera buscas em colunas específicas                                    |

---

## 🧪 Exemplo Prático no Flutter

### Criando uma tabela e inserindo dados:

```dart
final db = await openDatabase('meubanco.db');

await db.execute('''
CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY,
  nome TEXT,
  email TEXT
);
''');

await db.insert('usuarios', {'nome': 'Ana', 'email': 'ana@email.com'});
