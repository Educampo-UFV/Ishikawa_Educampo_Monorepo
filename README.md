# 🚀 Educampo Ishikawa Monorepo

**Tags:** `ai-diagnostics` | `monorepo` | `next.js` | `fastapi` | `llm-router`

> Sistema inteligente para diagnósticos e simulações focadas no agronegócio, impulsionado por um roteador de Inteligência Artificial otimizado para escalabilidade.

---

## 🎯 Overview
O projeto Educampo Ishikawa consolida em um único monorepo toda a stack necessária para entregar diagnósticos precisos e simulações avançadas aos produtores rurais. A ferramenta foi concebida para auxiliar as decisões no campo através de uma interface de usuário moderna e análise profunda de dados movida por inteligência artificial.

A arquitetura assíncrona foi projetada com alta eficiência e resiliência em mente, separando a lógica de negócios pesada da camada de roteamento de IA. Isso permite que a aplicação suporte cenários complexos de concorrência com o mínimo possível de processamento de hardware, garantindo escalabilidade econômica mesmo sob tráfego severo.

## ✨ Key Features
* **Diagnósticos com IA:** Geração de resumos e relatórios analíticos dinâmicos baseados no perfil do produtor.
* **LLM Router Integrado:** Roteamento inteligente de chamadas que balanceia modelos gratuitos e pagos da OpenRouter, otimizando os custos em larga escala.
* **Processamento Assíncrono Estável:** Filas de background (Celery) engolem rajadas de acesso simultâneo mantendo a alta velocidade do frontend e da API primária.

## 🛠️ Tech Stack
* **Language:** Python 3 & TypeScript
* **Framework:** Next.js (Frontend) e FastAPI (Backends)
* **Database:** Redis (Mensageria e Celery Broker)
* **Infrastructure/Testing:** Docker, SupervisorD, Locust

---

## 🚦 Getting Started (How to run the project)

### Prerequisites
Make sure you have installed on your machine:
* Docker
* Git

### Step-by-Step Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MarcosVeniciu/Ishikawa_Educampo_Monorepo.git
   cd Ishikawa_Educampo_Monorepo
   ```

2. **Configure Environment Variables:**
   Copie o arquivo de exemplo e insira suas chaves do OpenRouter e os limites de Rate Limit seguros.
   ```bash
   cp .env.example .env
   ```

3. **Build and Start the Application:**
   Construa a imagem Docker com todos os submódulos embutidos. Inicie o container aplicando os limites validados de hardware:
   ```bash
   docker build -t educampo-monorepo .
   
   docker run --name educampo-app -p 3000:3000 -p 8000:8000 -p 8001:8001 --cpus="0.5" -m="512m" --env-file .env educampo-monorepo
   ```

4. **Access:**
   The application will be available at:
   - Frontend (Site): `http://localhost:3000`
   - API Ishikawa: `http://localhost:8000`
   - LLM Router: `http://localhost:8001`

---

## 📂 Macro Project Structure

```text
project-root/
├── API_Ishikawa_Educampo/   # Backend principal (FastAPI, Celery, Models)
├── API_LLM_Router/          # Submódulo: Roteamento de Inteligência Artificial
├── Site_Ishikawa_Educampo/  # Aplicação Frontend web (Next.js)
├── tests/                   # Scripts automatizados de load test (Locust)
├── Dockerfile               # Receita base para o container unificado
├── supervisord.conf         # Orquestrador interno de processos
└── README.md                # You are here
```
*Note: For deep architectural details of each module, consult the internal README files in the `/docs` folder or inside each directory in `src/`.*

---

## 🤝 How to Contribute (Git Flow)
This project uses the **Antigravity IDE** standardization with Conventional Commits.
1. Create a branch from `develop` (`git checkout -b feature/my-feature`).
2. Commit your changes (`git commit -m 'feat: my new feature'`).
3. Push to the branch (`git push origin feature/my-feature`).
4. Open a Pull Request.