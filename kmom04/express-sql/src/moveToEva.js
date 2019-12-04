"use strict";

const config = require("../config/db/bank.json");
const mysql = require("promise-mysql");

const teachers = {
    moveToEva: async function (to, fromw) {
        console.info("komp");
        const db = await mysql.createConnection(config);

        let sql = `
            START TRANSACTION;
            UPDATE account 
            SET
                balance = balance + 1.5
            WHERE
                id LIKE ?;
            UPDATE account 
            SET
                balance = balance - 1.5
            WHERE
                id LIKE ?;
            COMMIT;
        `;

        await db.query(sql, [to, fromw]);

        db.end();
    }
};


module.exports = teachers;
