# Changelog - Monorepo Ishikawa Educampo

Todas as alterações notáveis deste projeto são documentadas neste arquivo.
O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

---

## [v1.10.0] - 2026-10-08

### 🚀 Novidades (Added)
- **Integração do Microsserviço `DB_API_Ishikawa`**:
  - Inclusão do repositório `DB_API_Ishikawa` como submódulo oficial do monorepo.
  - Orquestração de inicialização via `supervisord.conf` na porta interna `8002`.
  - Instalação automatizada das dependências Python da `DB_API_Ishikawa` no `Dockerfile`.
  - Configuração das variáveis de ambiente para conexão com PostgreSQL (Supabase) e autenticação de serviço (M2M) no `.env` e `.env.example`.
- **API Ishikawa (`API_Ishikawa_Educampo` v8.5.0)**:
  - Integração da camada de persistência com `DB_API_Ishikawa` via adaptadores HTTP desacoplados (`HttpProducerRepository`, `HttpConsultantRepository`, `HttpDiagnosticResultRepository`).
  - Suporte a controle de concorrência com lock otimista (`ETag` / `If-Match` / `412 Precondition Failed`).
  - Cliente HTTP M2M resiliente com timeout defensivo e conversão RFC 7807 (`ProblemDetails`).
  - Alternância configurável entre backends de dados (`PERSISTENCE_BACKEND=http`).

### 🛠 Correções e Melhorias (Fixed)
- **Site Ishikawa (`Site_Ishikawa_Educampo` v3.4.1)**:
  - Persistência e isolamento dos estados dos sliders de simulação entre navegações via Zustand e `sessionStorage`.
  - Implementação de validação rigorosa de e-mails em formulários cadastrais e sanitização de dados de fazenda.
  - Otimização do comparador puro de simulação para evitar re-renderizações desnecessárias.

---

## [v1.9.0] - 2026-10-07
- Suporte a persistência incremental e ajustes de rotas de IA.
