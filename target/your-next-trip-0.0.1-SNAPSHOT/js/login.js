/*Name: login.js
 *Desc: This file handle validation for the login form to ensure proper input is being entered
 *Author: Nabeel Khan
 *Date Created: 12-16-19
 *Date Last Modified: 12-16-19 By: Nabeel Khan
 */

//Listener for submit

function validateLogin(e) {
    e.preventDefault();

    //Get values from event
    const userEmail = e.target[0].value;
    const userPassword = e.target[1].value;

    //Regex to check basic email and password syntax
    const emailCheck = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    const passwordCheck = /[\w#!@$%^&*)(}{:">?;'.\/\\]+/;

    if (!emailCheck.test(userEmail) || !passwordCheck.test(userPassword)) {
        alert("Error: Invalid email address or password");
    } else {
        window.location.replace("./recommendation.jsp");
    }

}