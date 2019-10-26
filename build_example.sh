curl https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash -
source ~/.nvm/nvm.sh
nvm list
nvm install v12.9.1
npm install

export PATH=/usr/bin/:$PATH
if [[ $(python --version 2>&1) =~ 2\.7 ]]
    then
        echo "You have python 2.7 will proceed with build"
    else
        echo "Error: You require python 2.7, usually in /usr/bin/"
        exit 1;
fi

npm run build:types
npm run build:node
npm run build:ts
npm run build:electron
cd example
npm install
npm run compile
