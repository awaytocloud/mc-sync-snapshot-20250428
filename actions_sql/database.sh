# TEST: To be replaced by the primary entry in main.sh
DATABASE=mcsyncdb

# Creating SQL routines
mysql -D $DATABASE < "./createroutines.sql"

NUMBER_OF_TABLES=$(mysql -D $DATABASE -BNe "CALL CheckNumberOfTables('$DATABASE', @number_of_tables);")

if [ $NUMBER_OF_TABLES -eq 0 ]; then
    echo -e "[Number of tables: $NUMBER_OF_TABLES] DB is empty, creating tables..."
    mysql -D $DATABASE -e "CALL CreateTable('objects_compared');"
else
    echo -e "[Number of tables: $NUMBER_OF_TABLES] DB is ready to use"
fi


