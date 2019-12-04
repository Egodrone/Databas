/**
 * Egodrone
 *
 */

let mamba = {
    betwrun: function() {
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
            let search2;

            search = await question("Enter minimum value? ");
            search2 = await question("Enter maximum value? ");
            str = await searchTeachers(db, search, search2);
            console.info(str);

            rl.close();
            db.end();
        })();

        function teacherAsTable(res) {
            let str;

            str = "+-----------+---------------------+-----+-------+------+------------+\n";
            str += "| Akronym   | Namn                | Avd |  Lön  | Komp | Född       |\n";
            str += "|-----------|---------------------|-----|-------+------+------------+\n";
            for (const row of res) {
                str += "| ";
                str += row.akronym.padEnd(10);
                str += "| ";
                str += (row.fornamn + " " + row.efternamn).padEnd(20);
                str += "| ";
                str += row.avdelning.padEnd(4);
                str += "| ";
                str += row.lon.toString().padStart(2);
                str += " | ";
                str += row.kompetens.toString().padStart(2);
                str += "   | ";
                str += row.fodd.toString().padStart(2);
                str += " |\n";
            }
            str += "+-----------+---------------------+-----+-------+------+------------+\n";

            return str;
        }

        async function searchTeachers(db, search, search2) {
            let sql;
            let res;
            let str;
            //let like = `%${search}%`;
            //let like2 = `%${search2}%`;
            //let like3 = `%${search}%`;
            //let like4 = `%${search2}%`;

            console.info(`Searching for values between: ${search} - ${search2}`);
            //console.info(search);
            //console.info(search2);

            if (search < 7 || search2 < 7) {
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
                    WHERE (kompetens BETWEEN ? AND ?)
                `;
            } else {
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
                    WHERE (lon BETWEEN ? AND ?)
                `;
            }
            res = await db.query(sql, [search, search2]);
            str = teacherAsTable(res);
            return str;
        }
    }
};

module.exports = mamba;
