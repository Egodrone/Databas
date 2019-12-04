"use strict";

const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
    res.send("Hello Word!");
});

router.get("/about", (req, res) => {
    res.send("About something");
});

module.exports = router;
