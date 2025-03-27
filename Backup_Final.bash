#!/bin/bash

# Função para executar o backup via cron
cronbackup() {
      # Lê os caminhos de origem e destino dos arquivos temporários
      origem=$(cat /tmp/backup_origem)
      destino=$(cat /tmp/backup_destino)
      
      # Executa o comando rsync para sincronizar os arquivos
      rsync -uahv "$origem" "$destino"
      
      # Registra a operação de backup em um arquivo de log
      echo "Backup de $origem salvo em $destino data: $(date)" >> registro.log
}

# Função para configurar o backup de arquivos novos
Makea() {
    while [ ! -e "$origem" ]; do
        echo -n 'Digite o arquivo de origem (Ex:/home/usuario/texto.txt):'
        read origem
        if [[ ! -e "$origem" ]]; then
            echo "$origem :Arquivo inexistente"
            echo
        fi 
    done
    echo -n 'Selecione/Crie o diretório destino(Ex:/home/usuario/NomeDoNovoDiretório):'
    read destino
    if [ ! -d "$destino" ]; then
        mkdir -p $destino
    fi
    # Salva os caminhos de origem e destino em arquivos temporários
    echo "$origem" > /tmp/backup_origem
    echo "$destino" > /tmp/backup_destino
}

# Função para atualizar o backup de arquivos existentes
Atta() {
    while [ ! -e "$origem" ]; do
        echo -n 'Digite o arquivo de origem (Ex:/home/usuario/texto.txt):'
        read origem
        if [ ! -e "$origem" ]; then
            echo "$origem :Arquivo inexistente"
            echo
        fi 
    done
    while [ ! -d "$destino" ]; do
        echo -n 'Diretório destino da atualização (Ex:/home/usuario/NomeDoDiretório):'
        read destino
        if [ ! -d "$destino" ]; then
            echo "Diretório inexistente"
            echo
        fi
    done
    echo "$origem" > /tmp/backup_origem
    echo "$destino" > /tmp/backup_destino   
}

# Função para configurar o backup de novos diretórios
Make() {
    while [ ! -d "$origem" ]; do
        echo -n 'Digite o diretório de origem (Ex:/home/usuario/Docs):'
        read origem
        if [ ! -d "$origem" ]; then
            echo "$origem :Diretório inexistente"
            echo
        fi 
    done
    echo -n 'Selecione/Crie o diretório destino(Ex:/home/usuario/NomeDoNovoDiretório):'
    read destino
    if [ ! -d "$destino" ]; then
        mkdir -p $destino
    fi
    echo "$origem" > /tmp/backup_origem
    echo "$destino" > /tmp/backup_destino   
}

# Função para atualizar o backup de diretórios existentes
Att() {
    while [ ! -d "$origem" ]; do
        echo -n 'Digite o diretório de origem (Ex:/home/usuario/Docs):'
        read origem
        if [ ! -d "$origem" ]; then
            echo "$origem :Diretório inexistente"
            echo
        fi
    done
    while [ ! -d "$destino" ]; do
        echo -n 'Diretório destino da atualização (Ex:/home/usuario/NomeDoDiretório):'
        read destino
        if [ ! -d "$destino" ]; then
            echo "Diretório inexistente"
            echo
        fi
    done
    echo "$origem" > /tmp/backup_origem
    echo "$destino" > /tmp/backup_destino   
}

# Função principal para gerenciar o script
Principal() {
    if [ "$1" == "--cron" ]; then
        cronbackup
    else
        clear
        echo "Saudações usuário..."
        echo
        echo "1. Criar backup de diretório"
        echo "2. Atualizar backup de diretório"
        echo "3. Criar backup de arquivo"
        echo "4. Atualizar backup de arquivo"
        echo -n "Escolha uma opção:"
        read opc
        case $opc in
            1) Make ;;
            2) Att ;;
            3) Makea ;;
            4) Atta ;;
            *) echo "Opção inválida" ; sleep 2 ; clear ; Principal ;;
        esac
        echo -n "Digite o intervalo do cron (Ex:'0 2 * * *' para diariamente às 2h):"
        read tempo
        script_path=$(realpath "$0")
        (crontab -l 2>/dev/null; echo "$tempo $script_path --cron") | crontab -
        echo
        echo "Registro do backup de $origem salvo em $destino, documentado em registro.log"
    fi
}

# Limpa a tela e chama a função principal
clear
Principal "$@"
