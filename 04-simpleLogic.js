
let startNumber = 1;

for (let i = 0; i < 7; i++) {
  let pattern = "";

  for (let j = 0; j <= i; j++) {
    pattern += startNumber + " ";
    startNumber++;
  }
  console.log(pattern);
  startNumber = startNumber - i;
}

console.log('\n\n');

let startNumber2 = 5;

for (let i = 0; i < 7; i++) {
  let pattern = "";

  for (let j = 0; j <= i; j++) {
    pattern += startNumber2 + " ";
    startNumber2++;
  }
  console.log(pattern);
  startNumber2 = startNumber2 - i;
}
