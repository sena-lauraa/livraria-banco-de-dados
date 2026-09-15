Banco de Dados - Biblioteca
Projeto de banco de dados relacional desenvolvido em MySQL, com o objetivo de simular o gerenciamento de uma biblioteca.
O projeto foi desenvolvido para praticar conceitos de banco de dados, modelagem relacional e consultas SQL.

Sobre o projeto
O banco de dados permite organizar informações relacionadas aos livros, autores, categorias, exemplares, leitores e empréstimos.
A estrutura foi criada pensando em um cenário de biblioteca, permitindo controlar os livros disponíveis, seus exemplares, os leitores cadastrados e os empréstimos realizados.

Estrutura do banco
O banco de dados possui as seguintes tabelas:

- autor – armazena os dados dos autores.
- categoria – organiza os livros por categorias.
- livro – armazena as informações dos livros.
- livro_autor – relaciona livros e autores.
- exemplar – representa cada exemplar físico de um livro.
- leitor – armazena os dados dos leitores.
- emprestimo – registra os empréstimos realizados.

Tecnologias utilizadas
- MySQL
- SQL
- MySQL Workbench

Arquivos

`biblioteca.sql`
Arquivo responsável pela criação do banco de dados, tabelas e inserção dos dados utilizados no projeto.

`consultas.sql`
Arquivo contendo consultas SQL realizadas sobre o banco de dados, incluindo filtros, relacionamentos, agrupamentos e funções de agregação.

Como executar o projeto
1. Instale o MySQL e o MySQL Workbench.
2. Abra o arquivo `biblioteca.sql` no MySQL Workbench.
3. Execute o script para criar o banco de dados e suas tabelas.
4. Após a criação do banco, abra o arquivo `consultas.sql`.
5. Execute as consultas para visualizar e analisar os dados.

Objetivo
O objetivo deste projeto é colocar em prática conhecimentos de **SQL e banco de dados relacionais**, além de desenvolver um projeto para compor meu portfólio acadêmico e profissional.


Desenvolvido por Laura Beatriz.
