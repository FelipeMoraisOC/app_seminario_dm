class Curso {
  final String nome;
  final String descricao;
  final int quantidadeAlunos;
  final DateTime dataInicio;
  final String senha;
  final String email;
  final String imagem;
  Curso({
    this.imagem = 'assets/images/curso.png',
    required this.nome,
    required this.descricao,
    this.quantidadeAlunos = 0,
    required this.dataInicio,
    required this.senha,
    required this.email,
  });
}
