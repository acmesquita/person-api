# POC - Solid Process

Refatorando uma aplicação com solid-process

> Documentação da [gem](https://github.com/solid-process/solid-process)

### Instalação

- Ruby: `3.3.5`
- Rails: `8.0.0.rc2`

> Instalação das dependências

```
$ bundle install
```

> Setup do banco e migrações

```
$ ./bin/rails db:prepare
```
> ou

```
$ ./bin/rails db:create
$ ./bin/rails db:migrate
```

### Execução dos testes


```
$ ./bin/rails t -v
```
> output:
```
Running 7 tests in a single process (parallelization threshold is 50)
Run options: -v --seed 40258

# Running:

PeopleControllerTest::List#test_should_return_a_empty_list_when_without_persons = 0.23 s = .
PeopleControllerTest::List#test_should_list_all_persons = 0.01 s = .
PersonTest#test_must_be_invalid_if_last_name_is_not_provided = 0.00 s = .
PersonTest#test_create_with_first_and_last_name = 0.00 s = .
PeopleControllerTest::Create#test_should_not_create_if_kind_of_contact_is_invalid = 0.03 s = .
PeopleControllerTest::Create#test_should_not_create_if_lastName_don't_provided = 0.01 s = .
PeopleControllerTest::Create#test_should_create = 0.02 s = .

Finished in 0.313290s, 22.3435 runs/s, 35.1112 assertions/s.
7 runs, 11 assertions, 0 failures, 0 errors, 0 skips
```

### Executando a aplicação

> Iniciando a aplicação

```
$ ./bin/rails s
```

Deve fica acessível em http://localhost:3000

> Documentação em `docs/people.http`

#### Cadastro

```
POST http://localhost:3000/people HTTP/1.1
Content-Type: application/json

{
  "person": {
    "firstName": "Fulano",
    "lastName": "Teste",
    "contacts": [
      { "kind": "phone", "content": "(86)9999-9999" }
    ]
  }
}
```

#### Listagem

```
GET http://localhost:3000/people HTTP/1.1
Content-Type: application/json
```