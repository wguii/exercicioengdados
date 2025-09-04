#!/bin/bash
# Sobe o SQL Server em segundo plano
/opt/mssql/bin/sqlservr &

# Espera o SQL Server ficar pronto
sleep 20

# Executa o script SQL
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i /scripts/create_ddl_dml.sql

# Mantém o container rodando
wait
