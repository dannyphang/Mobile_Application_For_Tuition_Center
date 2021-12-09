const input = document.getElementById("search_input");
const searchBtn = document.getElementById("search_btn");

const expand = () => {
    searchBtn.classList.toggle("close");
    input.classList.toggle("square");
};

searchBtn.addEventListener("click", expand);