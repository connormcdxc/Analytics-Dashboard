function openNav() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
  }
  
function closeNav() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

window.addEventListener('load', () => {
  const checkbox = document.querySelector("#dark");
  if (sessionStorage.getItem("mode") == "dark") {
    darkmode(); 
  } else {
    nodark(); 
  }
  checkbox.addEventListener("change", function() {
    if (checkbox.checked) {
      darkmode(); 
    } else {
      nodark(); 
    }
  });
  function darkmode() {
    document.body.classList.add("dark-mode"); 
    checkbox.checked = true; 
    sessionStorage.setItem("mode", "dark");
  }
  function nodark() {
    document.body.classList.remove("dark-mode"); 
    checkbox.checked = false; 
    sessionStorage.setItem("mode", "light"); 
  }
});







