/**
 *
 * Egodrone
 */

let larare = {
    rundone: function() {
        const mysql = require("promise-mysql");
        const config = require("./config.json");

        (async function() {
            const db = await mysql.createConnection(config);
            let str;

            str = await viewTeachers(db);
            console.info(str);

            db.end();
        })();

        async function viewTeachers(db) {
            let sql;
            let res;
            let str;

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
                ORDER BY akronym;
            `;
            res = await db.query(sql);
            str = teacherAsTable(res);
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
    }
};

module.exports = larare;

