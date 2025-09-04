# Exercício AUTOMAÇÃO NA CONSTRUÇÃO DE IMAGENS

# Imagem base do SQL Server 2022
FROM mcr.microsoft.com/mssql/server:2022-latest

# Define variáveis de ambiente do SQL Server
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=senha123

# Cria uma pasta para armazenar os scripts
WORKDIR /scripts

# Copia o arquivo SQL para dentro da imagem
COPY create_ddl_dml.sql /scripts/
# "/" no final para o Docker Engine saber que precisa criar o diretório caso não exista!

# Copia um script de inicialização para rodar o SQL
COPY init.sh /scripts/

# Dá permissão de execução ao script
RUN chmod +x /scripts/init.sh

# Define o ponto de entrada como o script de inicialização
CMD ["/bin/bash", "/scripts/init.sh"]
