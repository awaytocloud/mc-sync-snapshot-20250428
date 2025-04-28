--
--
--
--
--
--
--
--
--
--
DROP PROCEDURE IF EXISTS CheckNumberOfTables;

DELIMITER $$

CREATE PROCEDURE CheckNumberOfTables (IN database_name CHAR(20), OUT number_of_tables INT)

    COMMENT 'Checks the number of existing tables in the specified database'
    READS SQL DATA

BEGIN
    
    SELECT COUNT(*) FROM information_schema.tables WHERE TABLE_SCHEMA = database_name AND TABLE_TYPE = 'BASE TABLE';

END$$

DELIMITER ;
--
--
--
--
--
--
--
--
--
--
DROP PROCEDURE IF EXISTS CreateTable;

DELIMITER $$

CREATE PROCEDURE CreateTable (IN table_name CHAR(20))

    COMMENT 'Creates the requested table. The table name must match one of the preconfigured cases. An existing table can not be overwritten'
    MODIFIES SQL DATA

BEGIN

    CASE table_name
        WHEN 'objects_compared' THEN
            CREATE TABLE objects_compared (
                id INT AUTO_INCREMENT PRIMARY KEY,
                action_due_symbol CHAR(1),
                action_due_name CHAR(10),
                object_name CHAR(100),
                object_path CHAR(255)
            );
    END CASE;

END$$

DELIMITER ;
--
--
--
--
--
--
--
--
--
--
DROP PROCEDURE IF EXISTS DropAllTables;

DELIMITER $$

CREATE PROCEDURE DropAllTables (IN database_name CHAR(20))

    COMMENT 'Drops all existing tables in the specified database'
    MODIFIES SQL DATA

BEGIN

    SELECT CONCAT('DROP TABLE ', GROUP_CONCAT(TABLE_NAME), ';') INTO @drop_string FROM information_schema.tables WHERE TABLE_SCHEMA = database_name;
    PREPARE drop_statement FROM @drop_string;
    EXECUTE drop_statement;
    DEALLOCATE PREPARE drop_statement;

END$$

DELIMITER ;
--
--
--
--
--
--
--
--
--
--
DROP PROCEDURE IF EXISTS DropTable;

DELIMITER $$

CREATE PROCEDURE DropTable (IN table_name CHAR(20))

    COMMENT 'Drops the requested table. The table name must match one of the preconfigured cases. An absent table can not be removed'
    MODIFIES SQL DATA

BEGIN

    SELECT CONCAT('DROP TABLE ', table_name, ';') INTO @drop_string;
    PREPARE drop_statement FROM @drop_string;
    EXECUTE drop_statement;
    DEALLOCATE PREPARE drop_statement;

END$$

DELIMITER ;
--
--
--
--
--
--
--
--
--
--




