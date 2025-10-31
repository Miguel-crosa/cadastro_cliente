// ignore_for_file: avoid_print

class Cliente {
  final String nome;
  final String email;
  final String senha;

  // Construtor do Cliente //
  Cliente({
    required this.nome,
    required this.email,
    required this.senha,
  });

  @override
  String toString(){
    return 'Cliente: $nome, Email: $email';
  }
}

class GerenciadorClientes {
  // Variável estática que guarda a única copia desta classe //
  static final GerenciadorClientes _instancia = GerenciadorClientes._interno();
  // Impede a criação de novas instâncias //
  GerenciadorClientes._interno();
  // Sempre retorna a instância existente // 
  factory GerenciadorClientes() => _instancia;
  // Lista = <ul> que armazena todos os clientes cadastrados //
  final List<Cliente> _clientes = [];
  // Para acessar a lista de clientes (retorna uma cópia imutável) //
  List<Cliente> get clientes => List.unmodifiable(_clientes);
  // Tentar cadastrar um cliente novo //
  bool cadastrar(Cliente cliente){
    // Checar se já existe um e-mail cadastrado //
    if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
      print('Erro, E-mail - ${cliente.email}, já cadastrado');
      return false; // Cadastro Mal-Sucedido //
    }

    _clientes.add(cliente); // Adiciona o Cliente //
    print('Novo Cliente Cadastrado: ${cliente.nome}');
    return true; // Cadastro Bem Sucedido //
  }

  Cliente ? login(String email, String senha){
    return _clientes.firstWhere(
      (c) => c.email.toLowerCase() == email.toLowerCase() 
      && c.senha == senha,
      orElse: () => Null as Cliente, 
      // orElse: Retorna Nulo se não encontrar os dados //
    );
  }

}