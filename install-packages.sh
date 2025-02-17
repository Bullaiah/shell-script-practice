#!/bin/bash

LOGDIR=/tmp
DATE=$(date +%F-%H:%M)
LOGFILE=$LOGDIR/$0-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo $LOGFILE
USERID=$(id -u)

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR: Run script with root access $N"
    exit 1
fi

VALIDATE() {

    if [$1 -ne 0 ];
    then
       echo -e "$2 ... $R FAILURE $N"
       exit 1
    else
       echo -e "$2 ... $G SUCCESS $N"
    fi
}

yum install nodejs -y &>>$LOGFILE

VALIDATE $? "Installing NodeJs"


