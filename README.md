# How to run local development
* `cp .env.local .env`
* `make up`
* Open http://localhost:8080

# How to stop local development
* `make down`

# How to run the app on PROD
1. Prepare server:
   1. create user `deployer`
   2. create SSH key for the `deployer` user with the command `ssh-keygen`
   3. create a folder `/var/www/your-project-name/` and change the owner of it `chown deployer:www-data your-project-folder`
2. Prepare GitHub repository
   1. add the project name to the repository variables `PROJECT` (only letters and digits)
   2. add the server IP address or hostname to the repository variables `HOST`
   3. add the PRIVATE key (`cat /home/deployer/.ssh/id_ed25519`) to the repository secrets `SSH_PRIVATE_KEY`
* Go to the repository actions and run the action 'Prod deploy'
* Open the project folder and copy the env file `cp .env.prod .env`

