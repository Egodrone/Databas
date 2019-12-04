"use strict";

const readline = require("readline");
const teachers = require("./src/moveToEva.js");
let fromid1 = "1111";
let toid1 = "2222";

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
            case "move":
                console.info("(Move 1.5 money from 1111 to 2222)\n");
                await teachers.moveToEva(toid1, fromid1);
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
        "You can choose the following commands:\n" +
        "exit, quit, ctrl-d - to exit the program.\n" +
        "help, menu - to show this menu.\n" +
        "move      - move 1.5 peng to Eva. \n\n"
    );
}
