#!/bin/bash
# --------------------------------------------------------------------------
# Setup script for MySQL
# --------------------------------------------------------------------------

if test ! $(which mysql); then
  echo "MySQL isn't installed"
  exit 1;
fi

killall mysqld
rm -Rf $HOMEBREW_PREFIX/var/mysql
rm -Rf $HOMEBREW_PREFIX/etc/my.cnf.d
mkdir $HOMEBREW_PREFIX/var/mysql
mkdir $HOMEBREW_PREFIX/etc/my.cnf.d
mysqld --initialize-insecure --explicit_defaults_for_timestamp
mysql.server start
mysql_secure_installation
