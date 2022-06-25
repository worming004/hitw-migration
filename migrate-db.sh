#!/bin/zsh
# supprime les scripts précédemments clonés
rm -rf CollaborativeCatalogue
# clone le repo du backend pour récupérer les scripts de création de table
git clone https://github.com/Thorngar/CollaborativeCatalogue

# supprime la précédente execution sql
docker stop sql
docker rm sql
# lance un nouveau server sql
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d --network sql --name sql mcr.microsoft.com/mssql/server:2022-latest
# attendre 15 secondes, le serveur prend du temps à se mettre en route
sleep 15
# créer la table par défaut
sqlcmd -S localhost -U sa -P "yourStrong(!)Password" -Q "create database CollaborativeCatalogue"

# lire le README.md
for i in {1..10}
do 
    for FILE in ./CollaborativeCatalogue/Data/Database/dbo/*;
    do
        echo $FILE
        sqlcmd -i ./$FILE -S localhost -U sa -P "yourStrong(!)Password" -d "CollaborativeCatalogue"
    done
done