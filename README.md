# launch-sql-server.sh

ce script lance dans docker un sql server. Il ne faut lancer ce script qu'une seule fois

# migrate-db.sh

ce script supprime la base de donnée, la recrée, et tente de tourner tous les scripts provenant de https://github.com/Thorngar/CollaborativeCatalogue/tree/main/Data/Database/dbo
il tourne tous les scripts 10 fois. Ne sachant pas dans quelle ordre les fichiers doivent être executées, nous les faisons tourner 10 fois en espérant que chacun tournent une fois au moins avec succès.