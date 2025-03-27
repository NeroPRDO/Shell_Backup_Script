# Script de Backup Automático

## Descrição

       Este script bash é utilizado para criar e automatizar backups de arquivos e diretórios. Ele permite ao usuário selecionar a origem e o destino dos backups e configura uma tarefa cron para automatizar o processo.

## Funcionalidades

- *Criar backup de diretório*: Permite selecionar um diretório de origem e um diretório de destino para criar um backup.
- *Atualizar backup de diretório*: Permite atualizar o backup de um diretório existente.
- *Criar backup de arquivo*: Permite selecionar um arquivo de origem e um diretório de destino para criar um backup.
- *Atualizar backup de arquivo*: Permite atualizar o backup de um arquivo existente.
- *Automatização com cron*: Configura uma tarefa cron para automatizar o backup.

## Como Usar

1. Execute o script:
(
    bash
)    ./backup_script.sh
    
2. Escolha uma opção do menu:

    - 1 Para criar backup de diretório.
    - 2 Para atualizar backup de diretório.
    - 3 Para criar backup de arquivo.
    - 4 Para atualizar backup de arquivo.
    
3. Siga as instruções para fornecer os caminhos de origem e destino.
4. Digite o intervalo do cron (Ex: 0 2 * * * para diariamente às 2h).
5. O script configurará a tarefa cron e registrará os detalhes do backup no arquivo registro.log.

## Configuração

- Certifique-se de que o script tem permissão de execução:

(
    bash
    chmod +x backup_script.sh
)  
  
- O script usa rsync para realizar backups, portanto, certifique-se de que rsync está instalado:

(
    bash
    sudo apt-get install rsync
)    

## Testando o Script

1. Execute o script e escolha uma das opções para criar ou atualizar um backup.
2. Verifique se os arquivos/diretórios de destino contêm os dados copiados.
3. Verifique o arquivo registro.log para garantir que o backup foi registrado corretamente.
4. Para testar a configuração do cron, você pode listar as tarefas cron:

(
    bash
    crontab -l
)    

## Autores

Este script foi criado para auxiliar na automação de backups em sistemas Unix, que tenham suporte para a execução do mesmo.
Muito Obrigado pela atenção e tempo cedido, agradecemos por testar nosso código.
Ass- Dyego Dasko GRR - 20242244
     Pedro Eduardo Dall Agnol GRR - 20240844
