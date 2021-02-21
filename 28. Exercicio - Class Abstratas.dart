
import 'dart:io';

class paiSerHumano {}


  // Métodos - comportamentos
  abstract class ComportamentodoHomem {


    fuma() {
      print("Homem fuma");
    }


    bebe() {
      print("Homem bebe");
    }
  }


  abstract class ComportamentoaMulher {

    cozinha() {
      print("Mulher cozinha");
    }

    trabalha() {
      print("Mulher trabalha");
    }

    temfilho() {
      print("Mulher tem filho");
    }
  }



  abstract class PedirNome {


    String nome;

    pedirNome() {
      stdout.write("\nInforme seu nome: ");
      nome = stdin.readLineSync();
    }
  }


  abstract class PedirSexo {

    String recebesexo;

    void pedirsexo() {
      stdout.write("Informe seu sexo (h / m): ");
      recebesexo = stdin.readLineSync();
    }

    validarsexo() {
      if (recebesexo == "h") {
        stdout.write("você é Homem.");
      } else if (recebesexo == "m") {
        stdout.write('você é Mulher.');
      } else {
        stdout.write("você não informou o sexo.");
      }
    }

  }



abstract class AdicionarAlista {

  List<String> lista = [];
  String nome;
  String recebesexo;


  void adicionarLista() {
    if (recebesexo == "m") {
      print("\n\n=== Seu nome Não foi adicionado a lista VIP! ===");
    } else if(recebesexo == "h") {
      print("\n\n=== Meus parabéns! Seu nome foi adicionado a lista ===\n");
      lista.add(nome);
      for (var i = 0; i < lista.length; i++) {
        print("Nome $i - ${lista[i]}");
      }
    }else {
      print("\n=== Seu nome não foi adicionado a lista ===");
      }
    }
  }


  class Homem extends paiSerHumano with ComportamentodoHomem, PedirNome, PedirSexo, AdicionarAlista {


  }



  class Mulher extends paiSerHumano with ComportamentoaMulher, ComportamentodoHomem, AdicionarAlista {

  }

  main() {
    Homem h = Homem();
    Mulher m = Mulher();

    while (true) {
      h.pedirNome();
      h.pedirsexo();
      stdout.write("\nOlá, ${h.nome} ");
      "${h.validarsexo()}";
      h.adicionarLista();

      if(h.recebesexo == "m") {
        print("");
        m.cozinha();
        m.trabalha();
        print("\nQue nem homem!");
        print("Além de: \n");
        m.temfilho();
        m.fuma();
        m.bebe();
      } else if(h.recebesexo == "h"){
        print("");
        m.bebe();
        m.fuma();
        print("Só isso!");
      }
    }
  }