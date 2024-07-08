#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=users -t --csv -c"

RAN_NUM=$RANDOM%1001

echo "Enter your username:"