# 📘 Roteiro de Revisão Técnica Flutter

## 🔹 Perguntas e Respostas Técnicas

**1. O que é um StatefulWidget?**  
> É um widget que mantém estado interno. Ex: um contador que muda ao clicar.

**2. Como funciona o setState?**  
> setState notifica o Flutter que o estado interno mudou e deve ser redesenhado.

**3. Quando usar StatelessWidget?**  
> Quando o widget não depende de nenhum estado interno. Ex: botão estático.

**4. Para que serve o Provider?**  
> Gerencia estado de forma global com ChangeNotifier, ideal para apps maiores.

**5. Como funciona o Navigator.push?**  
> Adiciona uma nova rota (tela) à pilha de navegação.

**6. O que faz o FutureBuilder?**  
> Renderiza widgets com base em uma operação assíncrona (Future).

**7. Como validar formulários?**  
> Use GlobalKey<FormState> e TextFormField com validator.

**8. Qual a diferença entre Expanded e Flexible?**  
> Expanded força ocupar o espaço restante, Flexible permite ajuste proporcional.

**9. Para que serve o StreamController?**  
> Permite controlar e emitir dados em tempo real, útil para arquitetura BLoC.

**10. Como escrever testes com testWidgets?**  
> Simula widgets e interações para testar comportamentos.

---

## 🚀 Gatilhos de Criação Rápida

**ListView.builder**  
> Use para listas dinâmicas com muitos itens.

**TextEditingController**  
> Captura entrada de texto em TextField.

**GestureDetector**  
> Detecta toques e gestos personalizados.

**AnimatedContainer**  
> Cria animações com mudanças de propriedades.

**ChangeNotifier**  
> Notifica widgets sobre mudanças de estado.

**AppBar + Drawer**  
> Estrutura padrão de navegação lateral.

**SnackBar**  
> Exibe mensagens temporárias na tela.

**MediaQuery**  
> Adapta layout baseado no tamanho da tela.

**Future.delayed**  
> Simula loading para testes e demonstrações.

**showDialog**  
> Exibe alertas ou confirmações modais.
