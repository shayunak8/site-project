function checkpassword() {
    //asks for password to get in the user
    var password = document.getElementById("password").value;
    var errpass = document.getElementById("errpassword");
    errpass.innerHTML = "";
    if (password.length < 8 || password.length > 16) {
        errpass.innerHTML = "password must be between 8 to 16 letters";
        return false;
    }
    return true;
}

function checkUsername() {
    //asks for username for user
    var username = document.getElementById("username").value;
    var err = document.getElementById("errusername");
    err.innerHTML = "";
    if (username.length < 6 || username.length > 14) {
        err.innerHTML = "username must be between 6 to 14 letters";
        return false;
    }
    else if (isNaN(username.charAt(0)) == false) {
        err.innerHTML = "username must start with a non numeric charcter";
        return false;
    }
    return true;
}

function checkSave(id) {
    //checkes if user want to save username
    var ischecked = document.getElementById(id);
    var config = document.getElementById('rememberCheckecd');
    config.style.fontSize = "19px";
    config.style.color = "red";
    config.innerHTML = "";
    if (ischecked.checked == true) {
        config.innerHTML = "your username will be saved!";
        return true;
    }
    config.innerHTML = "";
    return false; 
}

function checkphone(id) {
    var phone = document.getElementById(id).value;
    //asks for user phone
    var errphone = document.getElementById("errphone");
    errphone.innerHTML = "";
    for (var i = 0; i < phone.Length; i++) {
        if (isNaN(phone.charAt(i)) == true) {
            errphone.innerHTML = "invaild phone number";
            return false;
        }
        else if (phone.length < 9 || phone.length > 10) {
            errphone.innerHTML = "invaild phone number";
            return false;
        }
    }
    return true;
}

function CheckAllV2() {
    //checks if user entered all things he need
    var calc2 = 0;
    calc2 = 0;
    if (checkUsername('username') == true)
        calc2++;
    if (checkpassword('password') == true)
        calc2++;
    if (checkphone('phone'))
        calc++;
    if (checkCaptha('captcha'))
        calc++
    if (calc2 == 4) {
        return true;
    }
    else {
        return false; 
    }
}

function checkCaptha() {
    //checkes if user is a robot
    var response = grecaptcha.getResponse();
    var res = fetch("https://www.google.com/recaptcha/api/siteverify", {
        method: "POST",
        body: JSON.stringify({
            secret: "6LcAv5sUAAAAAL1rO76TwfTpFXvP6jOlM8wP_0LT",
            response
        }),
        headers: { 'Content-Type': 'application/json' }
    });
    console.log(res);
}

function checkTime(i) {
    //checks the time seen as it should be
    if (i < 10) { i = "0" + i };
    return i;
}

function startTime() {
    //write time 
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    h = checkTime(h);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}

function date() {
    //show the date
    var d = new Date();
    document.getElementById("date").innerHTML = d;
}

function DateAndTime() {
    //function to show time and date
    startTime();
    date();
}