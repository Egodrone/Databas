"use strict";

const readline = require("readline");
const teachers = require("./teachers.js");
const smodule = require("./smodule.js");
const mnylon = require("./mnylon.js");

//main function, self inv. iffe
(function () {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    showMenu();
    rl.setPrompt("Choose from menu: ");
    rl.prompt();

    rl.on("close", process.exit);
    rl.on("line", async (line) => {
        line = line.trim();
        let lineArray = line.split(" ");

        switch (lineArray[0]) {
            case "quit":
            case "exit":
                process.exit();
                break;
            case "menu":
            case "help":
                showMenu();
                break;
            case "larare":
                await teachers.larare();
                break;
            case "kompetens":
                await teachers.kompetens();
                break;
            case "lon":
                await teachers.lon();
                break;
            case "sok":
                await smodule.dosearch(lineArray[1]);
                break;
            case "nylon":
                await mnylon.doupgrade(lineArray[1], lineArray[2]);
                break;
            default:
                console.log("No match");
                break;
        }

        rl.prompt();
    });
})();

function showMenu() {
    console.info(
        "You can choose this commands:\n" +
        "exit, quit: Exist the program.\n" +
        "help, menu: Shows this menu.\n" +
        "larare: Shows ifo about teachers.\n" +
        "kompetens: Shows ifo about kompetens.\n" +
        "sok <searchstring>: Search function.\n" +
        "nylon <acronym> <value>: Change salary for a specific teacher.\n\n"
    );
}
