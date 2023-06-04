const arr = [3, 8, 9, 7, 6]

function rotateArray(array, times) {
    let temp;
    layout = ''
    for (let i = 0; i < times; i++){
        let row = '';
        row += '[' + array + ']' + ' => ';
        temp = array.pop();
        array.unshift(temp);
        row += '[' + array + ']';
        layout += row + '\n';
    }
    return layout;
}

console.log(rotateArray(arr,3)); // putar 3x
// Result :
/**
[3, 8, 9, 7, 6] => [6, 3, 8, 9, 7]
[6, 3, 8, 9, 7] => [7, 6, 3, 8, 9]
[7, 6, 3, 8, 9] => [9, 7, 6, 3, 8]
*/
