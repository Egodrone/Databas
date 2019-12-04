"use strict";

const port = 1337;

const express = require("express");
const routeIndex = require("./route/index.js");
const routeToday = require("./route/today.js");
const routeBank = require("./route/bank.js");
const path = require("path");
const app = express();

app.set("view engine", "ejs");

app.use((req, res, next) => {
    console.info(`Got request on ${req.path} (${req.method})`);
    next();
});

app.use(express.static(path.join(__dirname, "public/redovisa")));

app.use("/", routeIndex);
app.use("/today", routeToday);
app.use("/bank", routeBank);


app.listen(port, () => {
    console.info(`Server is listening on port ${port}`);
});
