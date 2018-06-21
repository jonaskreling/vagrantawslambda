# vagrantawslambda
Projeto para construir uma máquina usando Vagrant para trabalhar com AWS Lambda

# Pré-Requisitos

1 - Vagrant 

2 - Oracle VirtualBox

# Instruções de uso

1 - Clone o projeto em uma pasta

2 - Abra o CMD do windows

3 - Entre na pasta que clonou esse projeto

4 - Execute o comando 'vagrant up'

	- Será criada uma máquina virtual usando ubuntu 18.04
	
	- Será instalado diversos programas básicos para trabalhar com AWS - Lambda
	
5 - Para destruir a máquina use o comando 'vagrant destroy'

6 - Para suspender a máquina use o comando 'vagrant suspend'

7 - Após suspender/destruir e quiser recriar ou ligar a máquina virtual use o comando 'vagrant up'

# Observações

Todos os recursos configurados podem ser editados. Por exemplo:

 - Quantidade de memória usada
 
 - Sistema operacional base
 
 - Mapeamento de pastas no windows
 
 - Programas que são instalados
 
# O que é instalado?
 - python-pip
 
 - nodejs
 
 - npm
  
 - awscli
 
 - docker
 
 - aws-sam-cli
