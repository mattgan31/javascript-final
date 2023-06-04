const array1 = ["Mangga", "Apel", "Melon", "Pisang", "Sirsak", "Tomat", "Nanas", "Nangka", "Timun", "Mangga"];
const array2 = ["Bayam", "Wortel", "Kangkung", "Mangga", "Tomat", "Kembang Kol", "Nangka", "Timun"];

function compareArray(array1, array2) {
    const set1 = new Set(array1);
    const set2 = new Set(array2);
    let samevalue = [];
    let differentValue = [];
    for (const value of set1) {
        if (set2.has(value)) {
            samevalue.push(value);
        } else {
            differentValue.push(value);
        }
    }
    for (const value of set2) {
        if (set1.has(value)) {
            continue;
        } else {
            differentValue.push(value);
        }
    }
    console.log("Same = ", samevalue);
    console.log('Different = ', differentValue);
}

compareArray(array1, array2);
// Result :
//Same = ["Mangga","Tomat","Nangka","Timun"]
//Different = ["Apel","Melon","Pisang","Sirsak","Nanas","Bayam","Wortel","Kangkung","Kembang Kol"]
