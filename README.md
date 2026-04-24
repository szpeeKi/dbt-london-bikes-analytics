# 🚲 London Bikes Analytics | dbt & BigQuery

![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![Google BigQuery](https://img.shields.io/badge/Google%20BigQuery-669DF6?style=for-the-badge&logo=google-cloud&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=postgresql&logoColor=white)

## 📌 Sobre o Projeto
Este projeto consiste em uma pipeline de **Analytics Engineering** desenvolvida para processar e analisar dados públicos do sistema de aluguel de bicicletas de Londres (*Transport for London*). 

A pipeline transforma milhões de registros de viagens brutas em tabelas de negócio prontas para análise, focando em padrões de uso por estação e eficiência de deslocamento.

## 🏗️ Arquitetura de Dados e Modelagem

O projeto segue as melhores práticas de modelagem modular do dbt, dividido em camadas:

1.  **Camada Staging (`stg_alugueis`)**: 
    - **Fonte:** `bigquery-public-data.london_bicycles.cycle_hire`.
    - **Ações:** Tradução técnica de campos (Inglês -> Português), limpeza de tipos e padronização.
    - **Materialização:** `view` (para otimização de custo e flexibilidade).

2.  **Camada Mart / Fato (`fato_estatisticas_estacoes`)**:
    - **Lógica:** Agregação de dados por estação de origem.
    - **Métricas:** Volume total de viagens e tempo médio de uso (convertido para minutos).
    - **Materialização:** `table` (tabela física para alta performance em ferramentas de BI).

## 🛡️ Qualidade e Governança
Para garantir que as decisões de negócio sejam baseadas em dados confiáveis, implementei testes automatizados via `schema.yml`:
- **Integridade:** Testes de `unique` e `not_null` no ID de aluguel.
- **Consistência:** Teste de `not_null` nos nomes das estações.

## 🚀 Como Reproduzir o Projeto

> **Nota:** É necessário ter o `dbt-bigquery` instalado e uma conta no GCP com acesso à região `EU` (Londres).

1.  **Configuração do Perfil:**
    Certifique-se de que seu arquivo `profiles.yml` aponta para o dataset correto com a localização em `EU`.

2.  **Execução da Pipeline:**
    ```bash
    # Instalar dependências e testar conexão
    dbt debug

    # Rodar as transformações (Cria as tabelas no BigQuery)
    dbt run

    # Executar os testes de qualidade
    dbt test
    ```

3.  **Documentação Interativa:**
    O dbt gera automaticamente um portal com a linhagem dos dados (Lineage Graph):
    ```bash
    dbt docs generate
    dbt docs serve
    ```

---
*Projeto desenvolvido por Rafael como parte do portfólio de Engenharia de Dados.*