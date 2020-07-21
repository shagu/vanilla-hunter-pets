# Vanilla WoW Hunter Pets

A lua script that extracts pet data from the VMaNGOS database and turns it into a website.
Showing skills per patch, attack speeds, levels and more.

[Website](https://shagu.org/hunter)


## Development

### Archlinux

    # pacman -S lua-sql-mysql mariadb mariadb-clients
    # systemctl start mariadb
    # mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

Manually download the latest [VMaNGOS Database](https://github.com/brotalnia/database) and unzip it.

#### Create Users And Permissions

    # mysql
    CREATE USER 'mangos'@'localhost' IDENTIFIED BY 'mangos';
    CREATE DATABASE `pfquest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES, CREATE TEMPORARY TABLES, EXECUTE, ALTER ROUTINE, CREATE ROUTINE ON `pfquest`.* TO 'mangos'@'localhost';

    CREATE DATABASE `vmangos-vanilla` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES, CREATE TEMPORARY TABLES, EXECUTE, ALTER ROUTINE, CREATE ROUTINE ON `vmangos-vanilla`.* TO 'mangos'@'localhost';

#### Import Databases
    $ mysql -u mangos -p"mangos" vmangos-vanilla < world_*.sql

### Build website

    $ make
