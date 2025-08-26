const buttons = document.querySelectorAll(".ping_btn");

buttons.forEach((btn) => {
    btn.addEventListener("click", async () => {
        const host = btn.getAttribute("host");
        const res = await fetch(`/check?host=${encodeURIComponent(host)}`);
        const data = await res.json();
        if (data.reachable)
            btn.parentElement.querySelector("p").textContent = "Reachable!";
        else
            btn.parentElement.querySelector("p").textContent = "Unreachable!";
    })
});