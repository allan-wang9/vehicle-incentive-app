Vehicle Incetive Tracker

1. Data → incentive.db, initialize_db.sql
2. Public → /js/province.js, style.css
3. Views → /partials/header.pug, home.pug, learn.pug, model.pug, models.pug
4. server.js
5. package.json

The database is located in data/incentive.db and the SQL script is included (not a requirement, but there if needed).

Assuming Node is installed on your local machine run <npm install> to install the dependencies (Express, Pug, SQLite). Then run <npm start>, to launch the application to localhost 3000. 

For Apple Silicon users, use a Rosetta Terminal. SQLite does not have native M1 support (as of May 3, 2022).

Link to Youtube demonstration: 
https://youtu.be/j6RKxEIAvPs
