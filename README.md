Cucumber cross testing core
================================

Este projeto foi criado com a finalidade de criar um framework que realiza testes para IOS e ANDROID utilizando somente a busca pelos elementos separadamente.

##**Tecnologias utilizadas**
 
 - **Ruby** : É uma linguagem dinâmica, open source com foco na simplicidade e na produtividade. Tem uma sintaxe elegante de leitura natural e fácil escrita. *Ver mais: [ruby](https://www.ruby-lang.org/pt/)*
 - **Cucumber**: É uma ferramenta open source criada para testar outros softwares. Ela executa testes de aceitação utilizando a escrita BDD. *Ver mais: [Cucumber](cucumber.io)*
 - **Appium**: É uma ferramenta open source utilizada para execução de testes automatizados em aplicações nativas, híbridas ou web aplicativos. *Ver mais: [Appium](http://appium.io/)*

**Requisitos para execução**:

 - Mac (Android e IOS) ou Windows (Somente Android) 
  - com a variável de ambiente $ANDROID_HOME configurada em seu SDK android
 - Java 1.8 >=
 - Android SDK
 - Ant Version 1.8 >
 - Adb
 - Ruby 2.23 >=
  - com bundler gem (gem install bundler)
 - Appium (http://appium.io/)
 - Android Device 4.1 >=

Passos para execução:

 - Conectar seu Android ou IOS previamente configurado no Appium
 - Levantar sua aplicação Appium
 - Instalar manualmente a `gem install allure-cucumber`
 -  Executar: `bundle install`
 - Para executar a suite de teste: `rake run_acceptance[platform,@tag_test]` - sendo platform = android/ios e @tag_test = as tags definidas na feature do cucumber