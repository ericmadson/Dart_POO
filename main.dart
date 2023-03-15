void main() {
  Produto Tenis = new Produto(1200.00, "Tênis Air Jordan", DateTime.now());
  Produto Suplemento = new Produto(100.00, "Suplemento", DateTime.now());

  Item lote_tenis = new Item(3, Tenis);
  Item lote_suplemento = new Item(5, Suplemento);

  Venda venda = new Venda(DateTime.now());
  venda.addItem(lote_suplemento);
  venda.addItem(lote_tenis);
  print(venda);
}

class Venda {
  final DateTime data;

  List<Item> itens = [];

  double total() {
    return itens.fold(0, (soma, elemento) => soma + elemento.total());
  }

  Venda(this.data);

  void setItem(double quantidade, Produto produto) {
    Item item = Item(quantidade, produto);
    itens.add(item);
  }

  void addItem(Item item) {
    itens.add(item);
  }

  @override
  String toString() =>
      " \n Lista de estoque: \n${this.itens}\n \n Valor de estoque: RS${this.total()} reais";
}

class Item {
  final double quantidade;
  Produto prod;

  double total() {
    return quantidade * prod.valor;
  }

  Item(this.quantidade, this.prod);

  @override
  String toString() =>
      "${this.prod} \n Quantidade: ${this.quantidade}  \n Preço total: RS${this.total()} reais \n ";
}

class Produto {
  final double valor;
  final String descricao;
  final DateTime data;

  Produto(this.valor, this.descricao, this.data);

  @override
  String toString() =>
      "\n Produto: ${this.descricao} \n valor: RS${this.valor} reais \n Data: ${this.data.day}/${this.data.month}";
}
