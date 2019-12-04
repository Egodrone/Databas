"use strict";

const config = require("./config.json");
const mysql = require("promise-mysql");

const teachers = {
    larare: async function () {
        const db = await mysql.createConnection(config);

        let sql = `
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
            ORDER BY akronym;
        `;

        let res = await db.query(sql);

        teacherAsTable(res);
        console.info(teacherAsTable(res));
        db.end();
    },

    sok: async function (searchString) {
        console.info(searchString);
    },

    nylon: async function (searchString) {
        console.info(searchString + "nylon <akronym> <lon>");
    },

    kompetens: async function () {
        console.info("komp");
        const db = await mysql.createConnection(config);

        let sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                prekomp,
                nukomp,
                diffkomp
            FROM v_lonerevision
            ORDER BY
            CASE diffkomp > 0
            WHEN diffkomp > 0 THEN diffkomp
            ELSE akronym END
            DESC;
        `;

        let res = await db.query(sql);

        kompdiff(res);
        console.info(kompdiff(res));

        db.end();
    },

    lon: async function () {
        const db = await mysql.createConnection(config);

        let sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                pre,
                nu,
                diff,
                proc,
                mini
            FROM v_lonerevision
            ORDER BY proc DESC;
        `;

        let res = await db.query(sql);

        londiff(res);
        console.info(londiff(res));
        db.end();
    }
};

function kompdiff(res) {
    let str;

    str = "+-----------+---------------------+---------+---------+----------+\n";
    str += "| Akronym   | Namn                | Prekomp |  Nukomp | Diffkomp |\n";
    str += "|-----------|---------------------|---------|---------+----------+\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "|    ";
        str += row.prekomp;
        str += "    |  ";
        str += row.nukomp.toString().padStart(3).padEnd(6);
        str += " | ";
        str += row.diffkomp.toString().padStart(4).padEnd(8);
        str += " |\n";
    }
    str += "+-----------+---------------------+---------+---------+----------+\n";
    return str;
}

function londiff(res) {
    let str;

    str = "+-----------+---------------------+-------+-------+-------+------+------+\n";
    str += "| Akronym   | Namn                | Pre   |  Nu   | Diff  | Proc | Mini |\n";
    str += "|-----------|---------------------|-------|-------+-------+------+------+\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.pre;
        str += " | ";
        str += row.nu.toString().padStart(2);
        str += " | ";
        str += row.diff.toString().padEnd(5).padStart(0);
        str += "  | ";
        str += row.proc.toString().padEnd(5).padStart(0);
        str += " | ";
        str += row.mini.toString().padEnd(3).padStart(2);
        str += " |\n";
    }
    str += "+-----------+---------------------+-------+-------+-------+------+------+\n";
    return str;
}

function teacherAsTable(res) {
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

module.exports = teachers;
