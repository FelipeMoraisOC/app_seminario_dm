# 📚 Catálogo de Cursos  

## ✅ Funcionalidades a serem implementadas  

### Navegação Avançada  
- **Uso de `Navigator.pushNamed`**  
- **Passagem de argumentos entre telas**  
- **Transições animadas personalizadas**  

### Personalização com ThemeData  
- **Temas com cores, fontes e estilos de texto**  
- **Múltiplos temas personalizados (claro/escuro ou por seção)**  

### Layouts com GridView  
- **Grade com espaçamento e colunas customizadas**  
- **Exibição de imagens, texto, etc.**  

### Formulários com Validação  
- **Uso de `TextFormField`, `TextField` e `ElevatedButton`**  
- **Validação para texto, número, e-mail e senha**  

---

## 💡 Proposta de Tema Prático  
**"Catálogo de Cursos com Cadastro de Interesse"**  

---

## 📦 Estrutura de Pastas  

```bash  
lib/  
├── main.dart                   # Entry point  
├── app.dart                    # Configuração de tema e rotas  
├── core/  
│   ├── themes.dart             # ThemeData avançado  
│   └── routes.dart             # Rotas nomeadas + argumentos  
├── models/  
│   └── curso.dart              # Modelo de curso com imagem, descrição etc.  
├── modules/  
│   ├── splash/  
│   │   └── presentation/  
│   │       └── splash_screen.dart  
│   ├── home/  
│   │   └── presentation/  
│   │       └── home_screen.dart         # Lista em GridView  
│   ├── curso/  
│   │   ├── data/  
│   │   │   └── curso_repository.dart  
│   │   ├── domain/  
│   │   │   └── curso_service.dart  
│   │   └── presentation/  
│   │       ├── curso_card.dart  
│   │       └── curso_detail_screen.dart # Navegação com argumentos  
│   └── formulario/  
│       └── presentation/  
│           └── interesse_form.dart       # Formulário com validação  
└── widgets/  
    └── custom_bottom_nav.dart           # Reutilizável  
```  

---

## 🧠 Requisitos e Implementação  

| **Requisito do PDF**         | **Onde Implementar**                                      |  
|------------------------------|----------------------------------------------------------|  
| **Navegação avançada**       | `routes.dart`, `Navigator.pushNamed`, `curso_detail_screen.dart` com argumentos |  
| **ThemeData customizado**    | `themes.dart`, incluindo modos claro/escuro e fonte custom |  
| **GridView**                 | `home_screen.dart` com cursos listados                   |  
| **Formulários com validação**| `interesse_form.dart` com nome, e-mail, curso de interesse |  

## 🛠️ Passo a Passo para Instalação do App  

Siga as etapas abaixo para configurar e executar o aplicativo em seu ambiente local:  

1. **Clone o Repositório**  
    ```bash  
    git clone https://github.com/FelipeMoraisOC/app_seminario_dm.git  
    cd app_seminario_dm  
    ```  

2. **Instale as Dependências**  
    Certifique-se de que o Flutter está instalado e configurado corretamente. Em seguida, execute:  
    ```bash  
    flutter pub get  
    ```  

3. **Execute o App**  
    Conecte um dispositivo físico ou inicie um emulador e execute:  
    ```bash  
    flutter run  
    ``` 

4. **Problemas Comuns**  
    - Caso encontre erros, execute `flutter doctor` para verificar o ambiente.  
    - Verifique se todas as dependências estão atualizadas com `flutter pub upgrade`.  

---  
Após seguir esses passos, o aplicativo estará pronto para uso!  
