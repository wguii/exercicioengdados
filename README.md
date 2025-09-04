# Atividade de VISÃO GERAL DE CONTAINERIZAÇÃO

### **Imagem**
Uma **imagem Docker** é um arquivo que funciona como um template imutável para criarmos um container Docker. Ela contém tudo o que uma aplicação precisa para rodar: o código fonte, bibliotecas, dependências e configurações de ambiente necessárias.

**Exemplo:**
```bash
# Baixa a imagem do Ubuntu
docker pull ubuntu:20.04

# Lista imagens baixadas
docker images
```

### **Container**

Um **container Docker** é uma instância em execução de uma imagem, podemos criá-lo a partir de uma imagem já existente com "docker pull" ou diretamente com "docker run" (após checar se o arquivo já não existe localmente, o **Docker Hub** será a fonte padrão que a CLI/daemon vai procurar a imagem.)

- Ele é isolado do sistema host, mas compartilha o kernel do sistema operacional, ganhando performance comparado à uma VM.
- É possível rodar múltiplos containers a partir da mesma imagem, cada um com seu estado próprio.

```bash
# Cria um container baseado na imagem do Ubuntu
docker run -it ubuntu:20.04

# Lista os containers em execução
docker ps

# Lista todos os containers (inclusive os que não estão rodando)
docker ps -a
```

### **Dockerfile**

Um Dockerfile é basicamente um arquivo de texto que contém uma série de instruções para construir uma imagem Docker da maneira desejada.

- Ele automatiza a criação de imagens, especificando qual base usar, quais pacotes instalar, quais arquivos copiar e quais comandos rodar.

```bash
#imagem base do node
FROM node:18 
#seleciona o diretório em que os comandos de CLI devem ser digitados (parecido com "cd")
WORKDIR /usr/src/app
#copia os arquivos desejados para o container
COPY package*.json ./
#roda um comando CLI para instalar as dependências
RUN npm install
COPY . .
#expondo a porta
EXPOSE 3000
#comando final que roda a aplicação
CMD ["node", "app.js"]
```

### **Docker Compose**

O Docker Compose é uma ferramenta que permite definir e gerenciar múltiplos containers como um único serviço, usando um arquivo docker-compose.yml.

- Dentro deste arquivo .yml é possível definir imagens, volumes, portas e redes.

- Facilita subir ambientes complexos com apenas um comando.

```bash
version: "3.9"       

# lista de containers
services:            

  app:                # container da aplicação
    build: .          # constrói a imagem a partir do Dockerfile no diretório atual
    ports:
      - "3000:3000"   # expõe a porta 3000 do container na porta 3000 do host
    depends_on:
      - db            # só inicia depois do container "db"

  db:                 # container do banco de dados
    image: postgres:15 # usa a imagem oficial do PostgreSQL versão 15
    environment:       # variáveis de configuração do banco
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin
      POSTGRES_DB: mydb
    ports:
      - "5432:5432"   # expõe a porta 5432 do container na porta 5432 do host
```



