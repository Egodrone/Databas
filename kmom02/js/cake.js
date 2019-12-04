class Cake {
    constructor(name) {
        this.name = name;
    }
    serve() {
        console.log("I'm serving " +
            this.name + "!");
    }
}

module.exports = Cake;
