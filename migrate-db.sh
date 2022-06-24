rm -rf CollaborativeCatalogue
git clone https://github.com/Thorngar/CollaborativeCatalogue

sqlcmd -S localhost -u sa -p "yourStrong(!)Password" -q "drop database CollaborativeCatalogue"
sqlcmd -S localhost -u sa -p "yourStrong(!)Password" -q "create database CollaborativeCatalogue"

$path = "./CollaborativeCatalogue/Data/Database/dbo/"
for file in $(ls $path)
do
    sqlcmd -i "${path}${file}" -S localhost -u sa -p "yourStrong(!)Password"
done