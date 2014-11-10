


function isAlpha(keyCode) {
    return ((keyCode >= 65 && keyCode <= 90) || (keyCode >=8 && keyCode <=46))
}

function isAlphaNumeric(keyCode) {
    return (((keyCode >= 48 && keyCode <= 57)) ||
           (keyCode >= 65 && keyCode <= 90) || keyCode == 8 || 
           (keyCode >= 96 && keyCode <= 105))
}

function isNumeric(keyCode) {
    return ((keyCode >= 48 && keyCode <= 57 || keyCode == 8 ||
          (keyCode >= 96 && keyCode <= 105)));
}

