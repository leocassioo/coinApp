# CoinApp

## Visão Geral

O CoinApp foi desenvolvido com **SwiftUI** e arquitetura **MVVM-C**, projetado para fornecer informações de exchanges de maneira rápida, segura e escalável. [coinapi.io](https://www.coinapi.io/)

A estrutura do projeto foi desenhada para:

- **Promover extensibilidade e testabilidade**, com separação clara de camadas (Models, Views, ViewModels, Repositories, Coordinators).
- **Aderir às boas práticas de Clean Architecture**, desacoplando a lógica de negócio da apresentação e da navegação.
- **Garantir consistência visual** seguindo as diretrizes da Apple (**Human Interface Guidelines**).
- **Assegurar qualidade contínua** por meio de testes de unidade e testes de snapshot automatizados.
- **Adotar padrões de projeto consolidados** como **Coordinator Pattern** e **Constructor Pattern**, alinhados com a manutenção e a evolução do sistema.

O foco principal é entregar um aplicativo tecnicamente sólido, de fácil manutenção, com alta cobertura de testes e excelente experiência de usuário.

---

## Arquitetura

### MVVM-C
- **Model:** representação imutável de dados oriundos da API.
- **ViewModel:** transformação de dados, gerenciamento de estado com `@Published`, comunicação com a camada de rede.
- **View:** componentes declarativos reativos às mudanças de estado, respeitando boas práticas de layout adaptativo.
- **Coordinator:** gerencia a navegação de telas utilizando `NavigationStack` e `NavigationPath`, mantendo a View independente de regras de fluxo.

### Dependency Injection
- Injeção de repositórios e serviços por protocolos, garantindo baixo acoplamento e alta testabilidade.

### Constructor Pattern
- Definição centralizada de todos os requests de API através de enums (`NetworkConstructor`), incluindo configuração de path, HTTP method, headers, encoding e parâmetros.

---

## Padrões de Projeto Utilizados

- **Coordinator Pattern:** isolamento de navegação fora das Views.
- **Constructor Pattern:** criação segura e padronizada de requests de rede.
- **Dependency Injection:** ViewModels e Repositories injetam dependências por protocolo.
- **Publisher/Subscriber Pattern:** reatividade entre ViewModel e View via `@Published`.

---

## Tecnologias

- **Swift 5+**
- **SwiftUI**
- **Combine** (utilizado via `@Published` e `ObservableObject`)
- **Charts Framework** (gráficos de volumes)
- **XCTest** (testes unitários)
- **SnapshotTesting** (testes de view para SwiftUI)

---

## Testes

### Testes Unitários
- ViewModels testados com fake repositories para validar mudanças de estado.
- Repositories testados para garantir chamadas corretas de constructors e tratamento de resultados.
- Constructors testados para confirmar a configuração correta de endpoints.

### Testes de Snapshot
- Views testadas visualmente usando **SnapshotTesting**, capturando imagens em diferentes estados:
  - Loading
  - Error
  - Success (tanto lista quanto detalhes)
<p align="center">
  <img src="https://github.com/user-attachments/assets/007420f0-d017-405c-966d-32abebadbf50" alt="Loading State" width="250"/>
  <img src="https://github.com/user-attachments/assets/8f739896-ea95-41b0-a515-2a49a20346f5" alt="Error State" width="250"/>
  <img src="https://github.com/user-attachments/assets/01a38768-08a9-443b-9c12-a1ef2402a594" alt="Success State" width="250"/>
</p>


### Cobertura
- Testes focados em lógicas críticas e cobertura de estados visuais, com espaço aberto para expansão futura.

---

## Organização do Projeto

```
├── Models               // Entidades de dados da aplicação
├── Network              // Serviços de rede, constructors de endpoints e repositórios
│   ├── Constructors     // Configurações de endpoints (path, method, encoding, parameters)
│   ├── Repositories     // Implementações para buscar dados da API
├── ViewModels           // Lógica de apresentação e manipulação de estados
├── Views                // Telas e componentes visuais SwiftUI
└── Coordinators         // Controle de fluxo de navegação (MVVM-C)
```

---

## Design e Interface

- **Layout adaptativo:** suporte para diferentes tamanhos de tela.
- **Tipografia e cores:** seguindo rigorosamente as Apple Human Interface Guidelines.
- **Feedbacks visuais claros:** estados de carregamento, sucesso e erro bem diferenciados.
- **Gráficos:** uso do Charts para visualização intuitiva dos volumes de transação.

---

## Como Executar

### Requisitos
- Xcode 14.0 ou superior
- iOS 16.0 ou superior

### Passos
1. Clone o repositório
2. Abra `CoinApp.xcodeproj` no Xcode
3. Verifique se a dependência **SnapshotTesting** está instalada:
   - Vá em **File → Packages → Reset Package Caches**
   - Depois clique em **File → Packages → Resolve Package Versions** para garantir que o SnapshotTesting esteja atualizado corretamente.
4. Selecione o esquema **CoinApp**
5. Rode o aplicativo no simulador
6. Execute todos os testes

---

### Observação Importante
- **SnapshotTesting** está integrado via **Swift Package Manager (SPM)** no projeto.  
- Caso o Xcode não resolva automaticamente, execute `Reset Package Caches` e `Resolve Package Versions` para limpar e atualizar corretamente as dependências.  

---

### Capturas de Tela

<p align="center">
  <img src="https://github.com/user-attachments/assets/ace4ea6f-8a0c-4f6a-be2b-4da8d24ed9d8" width="250"/>
  <img src="https://github.com/user-attachments/assets/0bace475-a42f-429d-8910-74bb3169663d" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/8a977d23-aa39-480a-919b-02e2d4094381" width="250"/>
  <img src="https://github.com/user-attachments/assets/470bb96e-477e-4920-8994-071b3955f2b0" width="250"/>
</p>


### Relatório de Cobertura de Testes
![image](https://github.com/user-attachments/assets/c797cc50-8c43-40ed-a650-b53e73ba25fa)


---

### Contato

- **Telefone**: (31) 98355-8266
- **Email**: [leocassio.af@gmail.com](mailto:leocassio.af@gmail.com)
- **LinkedIn**: [Perfil no LinkedIn](https://www.linkedin.com/in/leocassioo) - https://www.linkedin.com/in/leocassioo

