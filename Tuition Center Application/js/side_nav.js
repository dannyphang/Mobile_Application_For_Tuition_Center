let sidebar = document.querySelector(".sidebar");
let closeBtn = document.querySelector("#btn");
let searchBtn = document.querySelector("#search_btn");

closeBtn.addEventListener("click", () => {
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
});

// following are the code to change sidebar button(optional)
function menuBtnChange() {
    if (sidebar.classList.contains("open")) {
        closeBtn.classList.replace("menu-outline", "close-outline");//replacing the iocns class
    } else {
        closeBtn.classList.replace("close-outline", "menu-outline");//replacing the iocns class
    }
}
// sign out confirm alert
function signout_confirm() {
    var confirm = confirm("Are you sure to sign out?");
    if (confirm) {
        alert("Your account have been signed out!");
    }
}