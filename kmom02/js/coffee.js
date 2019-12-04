let coffee = {
    roast: "Dark roast",
    pour: function () {
        console.log("I'm poring a " +
            this.roast + " cup of coffee.");
    }
};

module.exports = coffee;
