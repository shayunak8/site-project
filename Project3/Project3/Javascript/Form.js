function checkname(id) {
    var name = document.getElementById(id).value;
    //asks for the user name
    var errname = document.getElementById("errname");
    errname.innerHTML = "";   

    for (var i = 0; i < name.Length; i++) {
        if (!isNaN(name.charAt(i))) {
            errname.innerHTML = "first name must contain a non numeric charcter";
            return false;
        }
    }
          

     if (name.length <= 3 || name.length > 16)
     {
        errname.innerHTML = "name must be between 2 to 16 letters";
        return false;
     }
     else 
         errname.innerHTML = " ";

    return true;  
}

function checlkname(id) {
    var lname = document.getElementById(id).value;
    //asks for the user last name
    var errlname = document.getElementById("errlname");
    errlname.innerHTML = "";
    if (lname.length <= 2 || lname.length > 16) {
        errname.innerHTML = "last name must be between 2 to 16 letters";
        return false;
    }
    for (var i = 0; i < lname.Length; i++)
    {
        if (isNaN(lname.charAt(i)) === false) {
            errlname.innerHTML = "last name must contain a non numeric charcter";
            return false;
        }
    }
    return true;
}

function checkUsername(id) {
    var username = document.getElementById(id).value;
    //asks for username for user
    var err = document.getElementById("errusername");
    err.innerHTML = ""; 
    if (isNaN(username.charAt(0)) === false) {
        err.innerHTML = "username must start with a non numeric charcter";
        return false;
    }
    else  if (username.length < 6 || username.length > 14)
    {
        err.innerHTML = "username must be between 6 to 14 letters";
        return false;
    }
    return true;
}

function checkpassword(id) {
    var password = document.getElementById(id).value;
    //asks for password to get in the user
    var errpass = document.getElementById("errpassword");
    errpass.innerHTML = "";
        if (password.length < 8 || password.length > 16) {
            errpass.innerHTML = "password must be between 8 to 16 letters";
            return false;
        }
        return true;
}

function checkpassword2(id) {
    var password2 = document.getElementById(id).value;
    //asks for password confirmation
    var password = document.getElementById('password').value;
    var errpass = document.getElementById("errpassword2");
    errpass.innerHTML = "";
    if (password2.length < 8 || password2.length > 16)
    {
        errpass.innerHTML = "password must be between 8 to 16 letters";
        return false;
    }
    else if (password2 != password)
    {
        errpass.innerHTML = "password confirmation must match to the original password";
        return false;
    }
    return true;
}


function checkgender() {
    //asks for user gender
    document.getElementById("errgender").innerHTML = "";  
    return true;    
}

function checkemail(id) {
    var email = document.getElementById(id).value;
    //asks for user email
    String(email);
    var erremail = document.getElementById("erremail");
    erremail.innerHTML = "";
    if (isNaN(email.charAt(0)) == false) {
        erremail.innerHTML = "email must start with a non numeric charcter";
        return false;
    }
    return true; 
}

function checkphone(id) {
    //asks for user phone
    var phone = document.getElementById(id).value;
    String(phone);
    var errphone = document.getElementById("errphone");
    errphone.innerHTML = "";
    if (phone.length != 10) {
        errphone.innerHTML = "invaild phone number";
        return false;
    }
    for (var i = 0; i < 10; i++) {
        if (isNaN(phone.charAt(i)) == true) {
            errphone.innerHTML = "invaild phone number";
            return false;
        }
        if (phone.length < 9 || phone.length > 10) {
            errphone.innerHTML = "invaild phone number";
            return false;
        }
    }
    return true;
}

function checkplace() {
    //asks for user location
    document.getElementById('errplace').innerHTML = "";    
    return true; 
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

function checkTime(i) {
    //checks the time seen as it should be
    if (i < 10) { i = "0" + i };
    return i;
}

function date() {
    //show the date
    var d = new Date();
    document.getElementById("date2").innerHTML = d;
}

function DateAndTime() {
    //function to show time and date
    startTime(); 
    date(); 
}

function CheckAll() {
    //checks if user entered all things he need
    var calc = 0;
    calc = 0;
    if (checkname('firstname')) 
        calc++;
    if (checkUsername('username')) 
        calc++;
    if (checkpassword('password'))
        calc++;
    if (checkpassword2('password2'))
        calc++;
    if (checkbdy('bday'))
        calc++;
    if (checkgender('gender'))
        calc++;
    if (checkemail('email'))
        calc++;
    if (checkphone('phone'))
        calc++;
    if (checkplace('place'))
        calc++;
    if (checkCaptha())
        calc++;
    if (calc == 8) {
        window.location.href = "Sign.in.aspx";
        return true;
    }
    else
        document.getElementById("submit").setAttribute("disabled", true);
    return false;
}

function checkCaptha() {
    //checkes if user is a robot
    var response = grecaptcha.getResponse();
    var check = false;
    if (response.length == 0) {
        document.getElementById('capthaErr').innerHTML =
            "are you a robot?";
        return false;
    } else {
        document.getElementById('capthaErr').innerHTML = "";
        return true;
    }
}