"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);

async function main() {
    const path = "node.txt";

    console.log("Before read");

    let data = await readFile(path, "utf-8");

    console.log("Read: ", data);
    console.log("After read");
}

main();
