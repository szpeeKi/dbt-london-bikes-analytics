{{ config(materialized='table') }}

WITH stations as(
    SELECT
        estacao_origem,
        COUNT(id_aluguel) AS total_viagens,
        AVG(duracao_segundos) / 60 AS tempo_medio_minutos
    FROM {{ ref('stg_alugueis')}}
    GROUP BY estacao_origem
)

SELECT * FROM stations