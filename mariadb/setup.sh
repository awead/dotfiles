#!/bin/bash
# --------------------------------------------------------------------------
# Setup script for MariaDB
# --------------------------------------------------------------------------

if test ! $(which mysql); then
  echo "MariaDB isn't installed"
  exit 1;
fi

killall mysqld
rm -Rf /usr/local/var/mysql
mkdir /usr/local/var/mysql
mysql_install_db
mysql.server start
mysql -u root --skip-password < $HOME/.dotfiles/mariadb/init
