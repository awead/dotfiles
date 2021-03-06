#!/bin/bash
# --------------------------------------------------------------------------
# Setup script for MySQL
# --------------------------------------------------------------------------

if test ! $(which mysql); then
  echo "MySQL isn't installed"
  exit 1;
fi

killall mysqld
rm -Rf /usr/local/var/mysql
rm -Rf /usr/local/etc/my.cnf.d
mkdir /usr/local/var/mysql
mkdir /usr/local/etc/my.cnf.d
mysqld --initialize-insecure --explicit_defaults_for_timestamp
mysql.server start
mysql_secure_installation
