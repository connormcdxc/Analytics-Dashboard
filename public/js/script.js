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
  const cont2 = document.querySelector("#chart8");
  const cont3 = document.querySelector("#chart9");
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
          console.log(data);
          var chart7 = new CanvasJS.Chart(cont, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages sent/received by different roles",
            fontColor: "white",
          },
          axisX: {
            labelFontColor: "white",
            labelAngle: -45,
            title: "Role type",
            interval: 1,
            labelWrap: true,
          },
          axisY: {
            labelFontColor: "white",
            title: "Number of messages",
            interval: 5,
            labelWrap: true
          },
          data: [
            {
              type: "column",
              toolTipContent:
                'Role: {label} <br>Messages Sent: {y}',
              dataPoints: [
                { label: response["rows"][0].role_type, y: response["rows"][0].sent},
                { label: response["rows"][1].role_type, y: response["rows"][1].sent },
                { label: response["rows"][2].role_type, y: response["rows"][2].sent },
                { label: response["rows"][3].role_type, y: response["rows"][3].sent },
                { label: response["rows"][4].role_type, y: response["rows"][4].sent }
              ]
            },
            {
                type: "column",
                toolTipContent:
                  'Role: {label} <br>Messages Recieved: {y}',
                dataPoints: [
                  { label: response["rows"][0].role_type, y: response["rows"][0].received},
                  { label: response["rows"][1].role_type, y: response["rows"][1].received },
                  { label: response["rows"][2].role_type, y: response["rows"][2].received },
                  { label: response["rows"][3].role_type, y: response["rows"][3].received },
                  { label: response["rows"][4].role_type, y: response["rows"][4].received }
                ]
            }
          ]
        });
        chart7.render();

      });
    }
    if (cont2) {
      fetch("/TeamMessagesSent").then(data => data.json()).then(data => {
        response = data;
        const cont8 = document.querySelector("#chart8");
          console.log(data);
          var chart8 = new CanvasJS.Chart(cont8, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages sent from each team",
            fontColor: "white",
          },
          axisX: {
            labelFontColor: "white",
            title: "person",
            interval: 1,
            labelWrap: true
          },
          axisY: {
            labelFontColor: "white",
            title: "Person ID",
            interval: 1,
            labelWrap: true
          },
          data: [
            {
              type: "pie",
              startAngle: 240,
              indexLabel: "{label}: {y} messages sent",
              toolTipContent:
                'Team ID: {label} <br>Messages sent: {y} messages',
              dataPoints: [
                { y: response["rows"][0].count,  label: "Team " + response["rows"][0].team_id },
                { y: response["rows"][1].count,  label: "Team " + response["rows"][1].team_id },
                { y: response["rows"][2].count,  label: "Team " + response["rows"][2].team_id },
                { y: response["rows"][3].count,  label: "Team " + response["rows"][3].team_id },
                { y: response["rows"][4].count,  label: "Team " + response["rows"][4].team_id }
              ]
            }
          ]
        });
        chart8.render();
      });
    }
    if (cont3) {
      fetch("/TeamMessagesRec").then(data => data.json()).then(data => {
        response = data;
        const cont9 = document.querySelector("#chart9");
          console.log(data);
          var chart8 = new CanvasJS.Chart(cont9, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages recieved from other teams",
            fontColor: "white",
          },
          axisX: {
            labelFontColor: "white",
            title: "person",
            interval: 1,
            labelWrap: true
          },
          axisY: {
            labelFontColor: "white",
            title: "Person ID",
            interval: 1,
            labelWrap: true
          },
          data: [
            {
              type: "pie",
              startAngle: 240,
              indexLabel: "{label}: {y} messages recieved",
              toolTipContent:
                'Team ID: {label} <br>Messages recieved: {y} messages',
              dataPoints: [
                { y: response["rows"][0].count,  label: "Team " + response["rows"][0].team_id },
                { y: response["rows"][1].count,  label: "Team " + response["rows"][1].team_id },
                { y: response["rows"][2].count,  label: "Team " + response["rows"][2].team_id },
                { y: response["rows"][3].count,  label: "Team " + response["rows"][3].team_id },
                { y: response["rows"][4].count,  label: "Team " + response["rows"][4].team_id }
              ]
            }
          ]
        });
        chart8.render();
      });
    }
  }

  function nodark() {
    document.body.classList.remove("dark-mode");
    checkbox.checked = false;
    sessionStorage.setItem("mode", "light");
    if (cont2) {
      fetch("/TeamMessagesSent").then(data => data.json()).then(data => {
        response = data;
        const cont8 = document.querySelector("#chart8");
          console.log(data);
          var chart8 = new CanvasJS.Chart(cont8, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages sent from each team",
          },
          axisX: {
            title: "person",
            interval: 1,
            labelWrap: true
          },
          axisY: {
            title: "Person ID",
            interval: 1,
            labelWrap: true
          },
          data: [
            {
              type: "pie",
              startAngle: 240,
              indexLabel: "{label}: {y} messages sent",
              toolTipContent:
                'Team ID: {label} <br>Messages sent: {y} messages',
              dataPoints: [
                { y: response["rows"][0].count,  label: "Team " + response["rows"][0].team_id },
                { y: response["rows"][1].count,  label: "Team " + response["rows"][1].team_id },
                { y: response["rows"][2].count,  label: "Team " + response["rows"][2].team_id },
                { y: response["rows"][3].count,  label: "Team " + response["rows"][3].team_id },
                { y: response["rows"][4].count,  label: "Team " + response["rows"][4].team_id }
              ]
            }
          ]
        });
        chart8.render();
      });
    }
    if (cont3) {
      fetch("/TeamMessagesRec").then(data => data.json()).then(data => {
        response = data;
        const cont9 = document.querySelector("#chart9");
          console.log(data);
          var chart8 = new CanvasJS.Chart(cont9, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages recieved from other teams"
          },
          axisX: {
            title: "person",
            interval: 1,
            labelWrap: true
          },
          axisY: {
            title: "Person ID",
            interval: 1,
            labelWrap: true
          },
          data: [
            {
              type: "pie",
              startAngle: 240,
              indexLabel: "{label}: {y} messages recieved",
              toolTipContent:
                'Team ID: {label} <br>Messages recieved: {y} messages',
              dataPoints: [
                { y: response["rows"][0].count,  label: "Team " + response["rows"][0].team_id },
                { y: response["rows"][1].count,  label: "Team " + response["rows"][1].team_id },
                { y: response["rows"][2].count,  label: "Team " + response["rows"][2].team_id },
                { y: response["rows"][3].count,  label: "Team " + response["rows"][3].team_id },
                { y: response["rows"][4].count,  label: "Team " + response["rows"][4].team_id }
              ]
            }
          ]
        });
        chart8.render();
      });
    }
    if (cont) {
      fetch("/actors").then(data => data.json()).then(data => {
        response = data;
          console.log(data);
          var chart7 = new CanvasJS.Chart(cont, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages sent/received by different roles",
          },
          axisX: {
            title: "Role type",
            labelAngle: -45,
            interval: 1,
            labelWrap: true
          },
          axisY: {
            title: "Number of messages",
            interval: 5,
            labelWrap: true
          },
          data: [
            {
              type: "column",
              toolTipContent:
                'Role: {label} <br>Messages Sent: {y}',
              dataPoints: [
                { label: response["rows"][0].role_type, y: response["rows"][0].sent},
                { label: response["rows"][1].role_type, y: response["rows"][1].sent },
                { label: response["rows"][2].role_type, y: response["rows"][2].sent },
                { label: response["rows"][3].role_type, y: response["rows"][3].sent },
                { label: response["rows"][4].role_type, y: response["rows"][4].sent }
              ]
            },
            {
                type: "column",
                toolTipContent:
                  'Role: {label} <br>Messages Recieved: {y}',
                dataPoints: [
                  { label: response["rows"][0].role_type, y: response["rows"][0].received},
                  { label: response["rows"][1].role_type, y: response["rows"][1].received },
                  { label: response["rows"][2].role_type, y: response["rows"][2].received },
                  { label: response["rows"][3].role_type, y: response["rows"][3].received },
                  { label: response["rows"][4].role_type, y: response["rows"][4].received }
                ]
            }
          ]
        });
        chart7.render();

      });
    }
  }
});
