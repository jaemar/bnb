This project is a Sinatra web application

Tools needed to setup and run this project
- Ruby v3.0.0
  - puma
  - activerecord
  - sinatra
  - pg
  - rake
  - json-schema
- PostgreSQL v12.6
- Postman (download [here](https://www.postman.com/downloads/))

### To setup the project

Clone the project
via SSH
```bash
$ git clone git@github.com:jaemar/bnb.git
```
via URL
```bash
$ git clone https://github.com/jaemar/bnb.git
```
via ZIP file (download [here](https://github.com/jaemar/bnb/archive/refs/heads/master.zip)), and extract the files.

Once cloned/downloaded, go inside the folder
```bash
$ cd bnb
```
Copy **config/database.yml.example** to **config/database.yml** and change postgresql _username_ and _password_ in config/database.yml to your postgresql username and password
Copy
```bash
$ cp config/database.yml.example config/database.yml
```
Change **_<your_username>_** & **_<your_password>_**
```
development:
  adapter: postgresql
  encoding: unicode
  host: localhost
  database: covid
  username: <your_username>
  password: <your_password>
```

### To run the server, copy & paste each command in a terminal
```bash
$ bundle install
$ rake db:build
$ rackup config.ru
```

### To check the endpoint, open the Postman app and import **_bnb.postman_collection.json_**

Click the **Import** button

![Step 1][step1]

Click the **Upload Files** button and locate the **_bnb.postman_collection.json_** file

![Step 2][step2]

Confirm the uploaded files and click the **Import** button

![Step 3][step3]

Select from the list **no format**, **format 1**, **format 2** and open

![Step 4][step4]

Run the endpoint by clicking the **Send** blue button

![Step 5][step5]

[step1]: https://github.com/jaemar/bnb/blob/master/readme/postman-import.png
[step2]: https://github.com/jaemar/bnb/blob/master/readme/postman-import-upload-files.png
[step3]: https://github.com/jaemar/bnb/blob/master/readme/postman-import-upload-confirmation.png
[step4]: https://github.com/jaemar/bnb/blob/master/readme/postman-run.png
[step5]: https://github.com/jaemar/bnb/blob/master/readme/postman-run-send.png
