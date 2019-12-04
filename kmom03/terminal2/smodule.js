/**
 *
 * Egodrone
 *
 */

const mysql = require("promise-mysql");
const config = require("./config.json");

let smodule = {
    dosearch: async function(searchString) {
        const db = await mysql.createConnection(config);
        let str;
        let search = searchString;

        str = await searchTeachers(db, search);
        console.info(str);

        db.end();


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
                    fornamn LIKE ?
                ORDER BY akronym;
            `;
            res = await db.query(sql, [like, search]);
            str = teacherAsTable(res);
            return str;
        }
    }
};

module.exports = smodule;
