docker network create sql
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d --network sql --name sql mcr.microsoft.com/mssql/server:2022-latest