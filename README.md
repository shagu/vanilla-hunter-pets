# Vanilla WoW Hunter Pets

A lua script that extracts pet data from the VMaNGOS database and turns it into a website.
Showing skills per patch, attack speeds, levels and more.

[Website](https://shagu.org/hunter)


## Development

### Archlinux

    # pacman -S mariadb mariadb-clients luarocks
    # systemctl start mariadb
    # mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    # luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql

#### Create Users And Permissions

    # mysql
    CREATE USER 'mangos'@'localhost' IDENTIFIED BY 'mangos';
    CREATE DATABASE `pfquest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES, CREATE TEMPORARY TABLES, EXECUTE, ALTER ROUTINE, CREATE ROUTINE ON `pfquest`.* TO 'mangos'@'localhost';

    CREATE DATABASE `vmangos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES, CREATE TEMPORARY TABLES, EXECUTE, ALTER ROUTINE, CREATE ROUTINE ON `vmangos`.* TO 'mangos'@'localhost';

#### Import Databases

Manually download the latest [VMaNGOS Database](https://github.com/brotalnia/database) and unzip it.

    $ mysql -u mangos -p"mangos" vmangos < world_*.sql

#### VMaNGOS Core (Updates)

Clone the VMaNGOS core to obtain all SQL updates.

    $ git clone https://github.com/vmangos/core.git
    $ cd core/sql/migrations
    $ for file in *_world.sql; do mysql -u mangos -p"mangos" vmangos < $file; done

### Build website

    $ make
