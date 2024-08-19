The repository could be used as a template to start new project. Convenient local development with Docker and Makefile commands that allow you easily to start/stop the parts of your project.
Moreover, you could use the template to run the production deployments with one change in the docker-compose.yaml configuration file. You should change the port 8080 to 80 and your server will respond on income requests.

In any questions, feel free to text to me https://x.com/michaeldomansky 

# How to run local development
* `cp .env.local .env`
* `make up`
* Open http://localhost:8080

# How to stop local development
* `make down`

# How to run the app on PROD
1. Prepare server:
   1. create a user `deployer`
   2. create SSH key for the `deployer` user with the command `ssh-keygen`
   3. create a folder `/var/www/your-project-name/` and change the owner of it `chown deployer:www-data your-project-folder`
2. Prepare GitHub repository
   1. add the project name to the repository variable `PROJECT` (only letters and digits, no spaces, no special characters)
   2. add the server hostname or IP address to the repository variable `HOST`
   3. add the PRIVATE key (`cat /home/deployer/.ssh/id_ed25519`) to the repository secret `SSH_PRIVATE_KEY`
* Go to the repository actions and run the action 'Prod deploy'
* Open the project folder and copy the env file `cp .env.prod .env`

