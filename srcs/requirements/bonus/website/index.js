function easterEggFunc()
{
    if (typeof easterEggFunc.counter == 'undefined')
    {
        easterEggFunc.counter = 1;
    }
    else
        ++easterEggFunc.counter;
    if (easterEggFunc.counter === 5)
    {
        var newElem = document.createElement("a");
        newElem.href = "https://en.wikipedia.org/wiki/Buffer_overflow";
        newElem.target = "_blank";
        newElem.innerHTML = "Get started";
        newElem.style.fontSize = "1px";
        newElem.style.display = "inline-block";
        newElem.style.width = "20px";
        newElem.style.height = "20px";
        newElem.style.textAlign = "center";
        document.getElementById("egb").innerHTML = "Your commitment to the cause has proven to be real, we'll get in touch soon";
        document.body.append(newElem);
    }
}