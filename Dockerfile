# Usa uma imagem oficial leve do Python
FROM python:3.11-slim

# Evita que o Python escreva arquivos .pyc e força o log para o stdout
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Instala dependências do sistema: Redis, Supervisor, curl para o Node.js e dependências de build
RUN apt-get update && apt-get install -y \
    redis-server \
    supervisor \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Instala Node.js (v20)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia todos os projetos para o container
COPY . .

# Instala as dependências da API_Ishikawa_Educampo
WORKDIR /app/API_Ishikawa_Educampo
RUN pip install --no-cache-dir -r requirements.txt

# Instala as dependências da API_LLM_Router
WORKDIR /app/API_LLM_Router
RUN pip install --no-cache-dir -r requirements.txt

# Instala as dependências e faz o build do Site_Ishikawa_Educampo (Next.js)
WORKDIR /app/Site_Ishikawa_Educampo
RUN npm install
# Define variáveis de ambiente dummy necessárias para o build do Next.js não quebrar
# E variáveis NEXT_PUBLIC que precisam estar no momento do build (injetadas no bundle)
ENV ENCRYPTION_SECRET_KEY="dummy_key_for_build_only_32_chars_long_"
ENV ADMIN_USERNAME="admin"
ENV ADMIN_PASSWORD="password"
ENV NEXT_PUBLIC_ENABLE_TEST_FARMS="true"

RUN npm run build

# Volta para o diretório raiz
WORKDIR /app

# Expor portas necessárias se rodar isoladamente (o Render expõe dinamicamente pelo $PORT)
EXPOSE 3000

# Copia a configuração do supervisor para o local correto
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Comando para iniciar o Supervisor, que vai orquestrar todos os processos
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
