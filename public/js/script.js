function openNav() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
  document.getElementById("topBar").style.display = "none";
}

function closeNav() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
  document.getElementById("topBar").style.display = "block";
}
var formatted_data = "";
var workingData = [];
var response;
sessionStorage.setItem("actors", fetch("/actors").then(res => res.json()));

    
  


window.addEventListener("load", () => {
  const cont = document.querySelector("#chart7");
  const checkbox = document.querySelector("#dark");
  //console.log(sessionStorage.getItem("actors"));


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
    if (cont) {
      fetch("/actors").then(data => data.json()).then(data => {
        response = data;
        const cont7 = document.querySelector("#chart7");
          console.log(data);
          var chart7 = new CanvasJS.Chart(cont7, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Actor Test Chart",
            fontColor: "white"
          },
          axisX: {
            title: "person",
            interval: 1
          },
          axisY: {
            title: "Person ID",
            interval: 1
          },
          data: [
            {
              type: "bar",
              toolTipContent:
                'Actor ID: {x} <br>Role Type ID:  {y}',
              dataPoints: [
                { x: response["rows"][0].actor_id, y: response["rows"][0].role_type_id },
                { x: response["rows"][1].actor_id, y: response["rows"][1].role_type_id },
                { x: response["rows"][2].actor_id, y: response["rows"][2].role_type_id },
                { x: response["rows"][3].actor_id, y: response["rows"][3].role_type_id },
                { x: response["rows"][4].actor_id, y: response["rows"][4].role_type_id },
                { x: response["rows"][5].actor_id, y: response["rows"][5].role_type_id },
                { x: response["rows"][6].actor_id, y: response["rows"][6].role_type_id },
                { x: response["rows"][7].actor_id, y: response["rows"][7].role_type_id },
                { x: response["rows"][8].actor_id, y: response["rows"][8].role_type_id },
                { x: response["rows"][9].actor_id, y: response["rows"][9].role_type_id }
              ]
            }
          ]
        });
        //chart7.dataPoints = { x: response["rows"][0].comment, y: response["rows"][0].person_id}
        chart7.render();
  
      });
    }
  }

  function nodark() {
    document.body.classList.remove("dark-mode");
    checkbox.checked = false;
    sessionStorage.setItem("mode", "light");
    if (cont) {
      fetch("/actors").then(data => data.json()).then(data => {
        response = data;
        const cont7 = document.querySelector("#chart7");
          console.log(data);
          var chart7 = new CanvasJS.Chart(cont7, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Actor Test Chart"
          },
          axisX: {
            title: "person",
            interval: 1
          },
          axisY: {
            title: "Person ID",
            interval: 1
          },
          data: [
            {
              type: "bar",
              toolTipContent:
                'Actor ID: {x} <br>Role Type ID:  {y}',
              dataPoints: [
                { x: response["rows"][0].actor_id, y: response["rows"][0].role_type_id },
                { x: response["rows"][1].actor_id, y: response["rows"][1].role_type_id },
                { x: response["rows"][2].actor_id, y: response["rows"][2].role_type_id },
                { x: response["rows"][3].actor_id, y: response["rows"][3].role_type_id },
                { x: response["rows"][4].actor_id, y: response["rows"][4].role_type_id },
                { x: response["rows"][5].actor_id, y: response["rows"][5].role_type_id },
                { x: response["rows"][6].actor_id, y: response["rows"][6].role_type_id },
                { x: response["rows"][7].actor_id, y: response["rows"][7].role_type_id },
                { x: response["rows"][8].actor_id, y: response["rows"][8].role_type_id },
                { x: response["rows"][9].actor_id, y: response["rows"][9].role_type_id }
              ]
            }
          ]
        });
        //chart7.dataPoints = { x: response["rows"][0].comment, y: response["rows"][0].person_id}
        chart7.render();
  
      });
    }
  }
});