# sql-server

Setup northwind database with MS SQL Server & docker 🐳.

## Requirements

* docker 18.06.1-ce

## Usage

Start SQL Server in a container and connect to container shell:

```bash
./sql-server.sh
```

Login to SQL Server shell:

```bash
sqlcmd -S localhost -U sa -P SQLServer2017
```
