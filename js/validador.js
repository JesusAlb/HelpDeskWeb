
var isShift = false;

function keyUP(keyCode) {
    if (keyCode == 16)
        isShift = false;
}

function isAlpha(keyCode) {
    return (((keyCode >= 65 && keyCode <= 90) || (keyCode >=8 && keyCode <=46))|| keyCode == 192)
}

function isAlphaNumeric(keyCode) {
    if (keyCode == 16)
        isShift = true;
    var res = (((keyCode >= 48 && keyCode <= 57) && isShift == false) || ((keyCode >= 65 && keyCode <= 90) || (keyCode == 8 || keyCode == 9) || keyCode == 13 || (keyCode >= 96 && keyCode <= 105)));
    return res;
}

function isNumeric(keyCode) {
    if (keyCode == 16)
        isShift = true;
    var res = (((keyCode >= 48 && keyCode <= 57) && isShift == false) || (keyCode == 8 || keyCode == 9) || keyCode == 13 || (keyCode >= 96 && keyCode <= 105));
    return res;
}

function validateDecimal(txt) {
    var ex = /^[0-9]+\.?[0-9]*$/;
    if (ex.test(txt.value) == false) {
        txt.value = txt.value.substring(0, txt.value.length - 1);
    }
}

 function isDescription(keyCode) {
        if (keyCode == 16)
            isShift = true;
        var res = (((keyCode >= 48 && keyCode <= 57) && isShift == false) ||
            (keyCode >= 65 && keyCode <= 90) || (keyCode == 8 || keyCode == 32) ||
            (keyCode == 110 || keyCode == 190) || (keyCode == 13 || keyCode == 109) ||
            (keyCode >= 96 && keyCode <= 105) || keyCode == 192);
        return res;
 }





