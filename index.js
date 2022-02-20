const express = require('express')

const app = express();

app.get('/', (req, res) => {
    res.send("Hello World!! New day has come.");
});

app.listen( 3524, () => {
    console.log('Listening on container port: 3524');
});