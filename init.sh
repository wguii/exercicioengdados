#Script para facilitar as ações no Dockerfile, utilizando-o como um entrypoint pro container do SQL Server

#!/bin/bash
# Sobe o SQL Server em segundo plano
/opt/mssql/bin/sqlservr &

# Espera o SQL Server ficar pronto
sleep 20

# Executa o script SQL (aqui rodamos as instruções do "create_ddl_dml.sql", criando as tabelas, populando, etc.)
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i /scripts/create_ddl_dml.sql

# Mantém o container rodando
wait
