# ro-dou-jobs

Uses [Apache Airflow](https://airflow.apache.org/), [FastETL](https://github.com/gestaogovbr/fastETL) and [Ro-dou](https://github.com/gestaogovbr/ro-dou) to send Brazil government journal clipping.

* [Diário Oficial da União](https://www.in.gov.br/servicos/diario-oficial-da-uniao)
* [Querido Diário](https://queridodiario.ok.org.br/).

# Startup

To create a Ro-Dou service (with [Apache Airflow](https://airflow.apache.org/)), follow the sequence:

1. Create a [Debian Bullseye](https://www.debian.org/releases/bullseye/) VM or [GCE Instance](sh/gcloud-instance-creation.sh)
2. [VM and CI Setup](HOST_SETUP.md)

## Debug

* To check `ro-dou-startup.service` status run

```shell
sudo journalctl -u ro-dou-startup.service
```

* To check `Airflow`/`Ro-Dou` services run

```shell
docker ps
```

* To check `airflow-webserver` service run

```shell
docker logs -f airflow-webserver
```
