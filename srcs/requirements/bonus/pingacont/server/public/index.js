const buttons = document.querySelectorAll(".ping_btn");

buttons.forEach((btn) => {
    btn.addEventListener("click", async () => {
        const host = btn.getAttribute("host");
        const res = await fetch(`/check?host=${encodeURIComponent(host)}`);
        const data = await res.json();
        const p = btn.parentElement.querySelector("p");
        const gif = document.createElement("img");

        if ((oldgif = btn.parentElement.querySelector("img")))
            oldgif.remove();
        if (data.reachable)
        {
            gif.src = "/img/dance-shark.gif";
            p.textContent = btn.getAttribute("service") + " is up!";
            p.style.color = "#2baf2bff";
        }
        else
        {
            gif.src = "/img/catcry.gif"
            p.textContent = btn.getAttribute("service") + " is down!";
            p.style.color = "#a01717ff";
        }
        gif.style.width = "75px";
        gif.style.height = "75px";
        gif.style.backgroundColor = "transparent";
        p.parentElement.appendChild(gif);
    })
});

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
        document.getElementById("egbb").innerHTML = "...";
    }
    if (easterEggFunc.counter === 10)
    {
        var newElem = document.getElementById("egb");
        newElem.href = "https://catguerrilla";
    }
}