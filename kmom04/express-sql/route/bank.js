/**
 * Route for the bank.
 */
"use strict";
let fromid = 2222;
let toid = 1111;

const express = require("express");
const router  = express.Router();
const bank    = require("../src/bank.js");

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("bank/index", data);
});

router.get("/balance", async (req, res) => {
    let data = {
        title: "Account balance | The Bank"
    };

    data.res = await bank.showBalance();

    res.render("bank/balance", data);
});

router.get("/move-to-adam", async (req, res) => {
    let data = {
        title: "Move to Adam | The Bank"
    };

    //function to move bitcoins to Adam
    //Function to show the balance
    data.res = await bank.moveToAdam(toid, fromid);

    res.render("bank/move-to-adam", data);
});

module.exports = router;
