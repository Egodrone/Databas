/**
 *
 * Egodrone
 *
 */

let smodule = {
    dosearch: function() {
        const readline = require('readline');
        const rl = readline.createInterface({
            input: process.stdin,
            output: process.stdout
        });

        const util = require("util");

        rl.question[util.promisify.custom] = (arg) => {
            return new Promise((resolve) => {
                rl.question(arg, resolve);
            });
        };
        const question = util.promisify(rl.question);


        const mysql = require("promise-mysql");
        const config = require("./config.json");


        (async function() {
            const db = await mysql.createConnection(config);
            let str;
            let search;

            search = await question("What to search for? ");
            str = await searchTeachers(db, search);
            console.info(str);

            rl.close();
            db.end();
        })();

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

        async function searchTeachers(db, search) {
            let sql;
            let res;
            let str;
            let like = `%${search}%`;

            console.info(`Searching for: ${search}`);

            sql = `
                SELECT
                    akronym,
                    fornamn,
                    efternamn,
                    avdelning,
                    lon,
                    kompetens,
                    DATE_FORMAT(fodd, '%Y-%m-%d') AS fodd
                FROM larare
                WHERE
                    akronym LIKE ?
                    OR fornamn LIKE ?
                    OR efternamn LIKE ?
                    OR avdelning LIKE ?
                    OR lon = ?
                    OR kompetens Like ?
                    OR fodd Like ?
                ORDER BY akronym;
            `;
            res = await db.query(sql, [like, like, like, like, like, like, search]);
            str = teacherAsTable(res);
            return str;
        }
    }
};

module.exports = smodule;
