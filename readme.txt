
To run the website you need:
    1. Nodejs
    2. MySql workbench


Open mysql workbench acoonect to your local server =>
    go to file and select open script
    navagate to the file in this repository labled "recipes.sql"
    run this script (press the lightning button in the top right of script window)


To run the website create a file called .env
Fill the file with the following lines:

    DB_HOST=localhost
    DB_USER=root
    DB_PASSWORD= YOUR-PASSWORD \\this should be your password for the local mysql server
    DB_NAME=  recipes


To run program use command npm.start in the the repository directory

Then use your browser aand navigate to "localhost:4000"
