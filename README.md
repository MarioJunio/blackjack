# Black Jack Game

![alt text](https://github.com/MarioJunio/blackjack/shot1.png)

![alt text](https://github.com/MarioJunio/blackjack/shot2.png)

### Objetivo do jogo

O objetivo do Blackjack é vencer o dealer (a casa) obtendo uma mão cujo valor seja mais próximo de 21 do que a mão do dealer, sem ultrapassar esse valor.

### Cartas e valores

* As cartas numéricas de 2 a 10 têm o valor de face.
* As cartas de valete (J), rainha (Q) e rei (K) valem 10 pontos cada.
* O Ás (A) pode valer 1 ponto ou 11 pontos, dependendo do que for mais benéfico para a mão do jogador.

## Rodando a aplicação

### Pré requisitos:
```text
* Flutter
* Navegador Web
```

Para iniciar a aplicação você pode utilizar o comando abaixo na raiz do projeto e selecionar a opção \[browser\] para iniciar o jogo no seu navegador.

```bat
flutter run
```
## Arquitetura

Para melhorar o entedimento, manuntenabilidade e para seguirmos os príncipios do SOLID eu escolhi utilizar a arquitura clean code que já é consolidada em projetos frontend que podem ser segregados em vários microapps, segue abaixo um esboço dessa arquitetura:

![alt text](https://github.com/MarioJunio/blackjack/clean_arc_flutter.png)

### Gerenciamento de estado
O gerenciamento de estado da aplicação está feito com MobX, eu decidi utilizá-lo porque com ele conseguimos segregar a regra de negócio da view e coloca-lá em um controller e sempre que precisarmos fazer alguma atualização de estado na tela podemos fazer isso invidualmente em cada Widget sem precisar reconstruir a árvore de widgets novamente para atualizar somente uma parte específica. O MobX conta com vários recursos como efeitos e também possui uma curva de aprendizado bem rápida. 

![alt text](https://github.com/MarioJunio/blackjack/mobx_example.png)

Para gerar os arquivos necessários a partir dos controllers definidos é preciso rodar o comando abaixo:
```bat
flutter pub run build_runner build --delete-conflicting-outputs
```

### Módulos e injeção de dependências
Para modularizar a aplicação foi utilizado o flutter modular que auxilia na separação de responsabilidades ou seja é possível subdividir em módulos com diferentes propósitos e fazer a comunicação entre eles por rotas de navegação. A injeção de dependências também pode ser feita utilizando o flutter modular pois ele permite que você faça os binds dos seus datasources, usecases e controllers para serem usados nas camadas mais superiores. 

### Testes
Para realizar os testes de integração e unitários eu utilizei a biblioteca mockito que oferece suporte para criação de mocks e stubs de uma maneira rápida e eficiente, para rodar os teste basta executar os seguintes comandos abaixo na raiz do projeto:

```bat
flutter test --platform chrome test/get_cards_player_usecase_test.dart
flutter test --platform chrome test/stage_controller_test.dart
```