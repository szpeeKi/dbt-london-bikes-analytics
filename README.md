# 🚲 London Bikes Analytics | dbt & BigQuery

![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![Google BigQuery](https://img.shields.io/badge/Google%20BigQuery-669DF6?style=for-the-badge&logo=google-cloud&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=postgresql&logoColor=white)

## 📌 About the Project
This project is an **Analytics Engineering** pipeline built to process and analyze public data from the London bicycle sharing scheme (*Transport for London*). 

The pipeline transforms millions of raw ride records into business-ready tables, focusing on usage patterns per station and travel efficiency to support data-driven decision-making.

## 🏗️ Data Architecture & Modeling

The project follows dbt's best practices for modular data modeling, divided into two main layers:

1.  **Staging Layer (`stg_alugueis`)**: 
    - **Source:** `bigquery-public-data.london_bicycles.cycle_hire`.
    - **Actions:** Schema standardization, data type casting, and column renaming (English to Portuguese for local stakeholders).
    - **Materialization:** `view` (to optimize cloud storage costs and maintain flexibility).

2.  **Mart / Fact Layer (`fato_estatisticas_estacoes`)**:
    - **Logic:** Data aggregation based on the starting station.
    - **Metrics:** Total trip volume and average usage time (converted from seconds to minutes).
    - **Materialization:** `table` (physical table to ensure high query performance in BI tools).

## 🛡️ Data Quality & Governance
To ensure that business decisions are based on reliable data, automated tests were implemented via `schema.yml`:
- **Data Integrity:** `unique` and `not_null` tests applied to the rental ID.
- **Data Consistency:** `not_null` tests applied to station names.

## 🚀 How to Run the Project

> **Note:** You must have `dbt-bigquery` installed and a Google Cloud Platform (GCP) account with access to the `EU` (London) region.

1.  **Profile Configuration:**
    Ensure your `profiles.yml` file points to the correct dataset with the location set to `EU`.

2.  **Pipeline Execution:**
    ```bash
    # Install dependencies and test the connection
    dbt debug

    # Run the transformations (Builds the tables in BigQuery)
    dbt run

    # Execute data quality tests
    dbt test
    ```

3.  **Interactive Documentation:**
    dbt automatically generates a web portal containing the Lineage Graph and project data dictionary:
    ```bash
    dbt docs generate
    dbt docs serve
    ```

---
*Project developed by Rafael as part of a Data Engineering & Analytics portfolio.*