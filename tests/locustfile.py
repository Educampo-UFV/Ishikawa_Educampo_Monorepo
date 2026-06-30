from locust import HttpUser, task, between

class EducampoApiUser(HttpUser):
    # Pausa de 2 segundos simulando preenchimento com dados pre-definidos
    wait_time = between(1.5, 2.5)

    @task
    def submit_diagnostico(self):
        # Payload extraído dos testes do sistema
        payload = {
            "sistema_producao": "compost_barn",
            "regiao_sebrae": "triangulo",
            "total_vacas": 150,
            "percentual_lactacao": 80.0,
            "total_rebanho": 200,
            "area_atividade": 50.5,
            "numero_trabalhadores": 4,
            "producao_vaca": 32.5,
            "preco_recebido": 2.80,
            "preco_referencia": 2.70,
            "ccs": 250
        }
        
        # O host no comando locust precisa apontar para a porta 8000 da API agora
        # A chave da API conforme configurado no .env é 42
        self.client.post("/api/diagnostico", json=payload, headers={"X-API-KEY": "42"})
