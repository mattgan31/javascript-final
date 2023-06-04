// x = posisi awal, y=target posisi, k= jarak temputh satu kali lompatan
function totalLompat(x, y, k) {
    let totalLompatan = 0;
    while (x <= y) {
        totalLompatan += 1;
        x += k;
    }
    return `Output : ${totalLompatan}`;
}
console.log(totalLompat(10,85,30));
// Output : 3
