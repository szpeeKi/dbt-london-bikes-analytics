{{ config(materialized='view') }}

WITH raw_alugueis as(
    SELECT
        rental_id AS id_aluguel,
        duration AS duracao_segundos,
        bike_id AS id_bicicleta,
        start_date AS data_inicio,
        start_station_name AS estacao_origem,
        end_station_name AS estacao_destino
    FROM `bigquery-public-data.london_bicycles.cycle_hire`
)

SELECT * FROM raw_alugueis