FROM ghcr.io/gestaogovbr/ro-dou:latest

USER root

COPY ro-dou-jobs /opt/airflow/dags/ro_dou/dag_confs

RUN chown -R airflow /opt/airflow

USER airflow