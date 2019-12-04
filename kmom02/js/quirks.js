function main(b, c=8) {
    let a = 100;

    console.log(a - "2");
    console.log("2" + 1 + c);
}

main();

let a = 1;

console.log(a - "2");
console.log("2" + 1);

//to keep global scope clean
(function() {
    console.log("AA f");
}());
