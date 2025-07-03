Comecei o projeto no windows mesmo, ao baixar a IDE e instalar consegui rodar omnepp no terminal, acho que você não está atualizado o suficiente sobre o assunto...
Eu consegui instalar seguindo esses passos que registrei no meu README.md:

## Instalações no Windows

OBS: Lembrar de instalar num workspace (a IDE é como o Eclipse) em uma pasta diferente do projeto no git para não pesar

OMNET++ - deve ser extraído em uma pasta com o path/caminho SEM espaços
https://omnetpp.org/download/ 

Após o download e extração do zip, no arquivo INSTALL.md diz para executarmos (cliquar) no mingwenv.cmd e depois rodar alguns comandos:
"...
For Windows
-----------

Begin by executing the `mingwenv.cmd` command. In the terminal
window that opens, run the following commands:

    $ ./configure
    $ make -j16

[!NOTE] The `mingwenv.cmd` command automatically installs all
required dependencies and then executes the `source setenv` command.
You can adjust the `-j16` parameter to match the number of cores on your
machine for optimized performance.
..."

usar omnetpp para abrir a IDE - normalmente baixa o INET automaticamente quando entra pela primeira vez 


## Stack

OMNET (OMNeT++ 6.1.0 - 2024-10-09): simulador/engine de redes

INET framework (4.5.4 - 2024-10-29): Biblioteca básica, o INET suporta o Wi-Fi, Zigbee, Jamming

Flora: Adiciona o Lora