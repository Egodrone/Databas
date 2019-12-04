"use strict";

const config = require("./config.json");
const mysql = require("promise-mysql");

const nylon = {
    doupgrade: async function (acro, nycash) {
        const db = await mysql.createConnection(config);

        console.info(acro, nycash);
        let like = `${acro}`;

        //Do insert with new cash value
        let sql = `
            UPDATE larare SET
                lon = ?
            WHERE akronym = ?;
        `;
        let res = await db.query(sql, [nycash, like]);

        //Display the result
        sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                avdelning,
                kon,
                lon,
                kompetens,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS fodd
            FROM larare
            WHERE akronym LIKE ?
            ORDER BY akronym;
        `;

        res = await db.query(sql, [like, acro]);

        //Display table with new cash
        viewTable(res);
        console.info(viewTable(res));

        db.end();
    }
};

function viewTable(res) {
    let str;

    str = "+-----------+---------------------+------+-------+------+------------+\n";
    str += "| Akronym   | Namn                | Avd  |  Lön  | Komp | Född       |\n";
    str += "|-----------|---------------------|------|-------+------+------------+\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(4);
        str += " | ";
        str += row.lon.toString().padStart(2);
        str += " | ";
        str += row.kompetens.toString().padStart(2);
        str += "   | ";
        str += row.fodd.toString().padStart(2);
        str += " |\n";
    }
    str += "+-----------+---------------------+------+-------+------+------------+\n";
    return str;
}

module.exports = nylon;
