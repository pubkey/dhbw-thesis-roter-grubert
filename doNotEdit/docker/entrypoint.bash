#!/usr/bin/env bash

echo "### starting entrypoint.bash ###"


##npm install
echo "## npm install ##"
cd /app
npm install



#atom.io
if [ ! -d /root/.atom/packages/file-icons ]
then
    apm install --packages-file /app/atom.io.packages.txt
fi


chmod -R 777 /root/.atom
chmod -R 777 /edit
chmod -R 777 /app

#/bin/bash

/usr/bin/atom

#run grunt
cd /app
grunt --force
