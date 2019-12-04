const mysql = require("promise-mysql");
const config = require("../config/db/bank.json");
let db;

(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

async function showBalance() {
    return findAllInTable("account");
}

async function findAllInTable(table) {
    let sql = `SELECT * FROM ??;`;
    let res;

    res = await db.query(sql, [table]);

    return res;
}

async function moveToAdam(to, from) {
    let res;
    let sql = `START TRANSACTION;
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
    SELECT * FROM account;`;

    res = await db.query(sql, [to, from]);
    return res;
}


module.exports = {
    showBalance: showBalance,
    moveToAdam: moveToAdam
};
