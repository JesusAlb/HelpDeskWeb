﻿
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
    var res = (((keyCode >= 48 && keyCode <= 57) && isShift == false) || (keyCode >= 65 && keyCode <= 90) || keyCode == 8 || (keyCode >= 96 && keyCode <= 105));
    return res;
}

function isNumeric(keyCode) {
    return ((keyCode >= 48 && keyCode <= 57 || keyCode == 8 ||
          (keyCode >= 96 && keyCode <= 105)));
}

