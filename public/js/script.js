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
  const cont4 = document.querySelector("#chart10");
  const cont5 = document.querySelector("#chart11");
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
            labelFontSize: 15,
            labelAngle: -45,
            title: "Role type",
            interval: 1,
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
                { label: "DB Admin", y: response["rows"][0].sent},
                { label: "Civic Officer", y: response["rows"][1].sent },
                { label: "IT Associate", y: response["rows"][2].sent },
                { label: "ER Specialist", y: response["rows"][3].sent },
                { label: "Boss", y: response["rows"][4].sent }
              ]
            },
            {
                type: "column",
                toolTipContent:
                  'Role: {label} <br>Messages Recieved: {y}',
                dataPoints: [
                  { label: "DB Admin", y: response["rows"][0].received},
                  { label: "Civic Officer", y: response["rows"][1].received },
                  { label: "IT Associate", y: response["rows"][2].received },
                  { label: "ER Specialist", y: response["rows"][3].received },
                  { label: "Boss", y: response["rows"][4].sent }
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
    if(cont4) {
      fetch("/teammsg1").then(data => data.json()).then(data => {
        response = data;
        const cont10 = document.querySelector("#chart10");
          console.log(data);
          var chart10 = new CanvasJS.Chart(cont10, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Number of messages actions per team",
            fontColor:"white"
          },
          toolTip: {
            shared: true
          },
          legend: {
		          cursor: "pointer",
		          verticalAlign: "top",
		          horizontalAlign: "center",
		          dockInsidePlotArea: true,
	        },
          axisX: {
            title: "In game day",
            interval: 1
          },
          axisY: {
            title: "Number of messages",
            interval: 1
          },
          data: [
            {
              name: "Team 1",
              showInLegend: true,
              labelFontColor: "white",
              type: "line",
              axisYType: "secondary",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 1, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][0].day1 },
                { x: 2,  y: response["rows"][0].day2 },
                { x: 3,  y: response["rows"][0].day3 },
                { x: 4,  y: response["rows"][0].day4 },
                { x: 5,  y: response["rows"][0].day5 }
              ]
            }, {
              type: "line",
              name: "Team 2",
              showInLegend: true,
              labelFontColor: "white",
              axisYType: "secondary",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 2, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][1].day1 },
                { x: 2,  y: response["rows"][1].day2 },
                { x: 3,  y: response["rows"][1].day3 },
                { x: 4,  y: response["rows"][1].day4 },
                { x: 5,  y: response["rows"][1].day5 }
              ]
            }, {
              type: "line",
              name: "Team 3",
              showInLegend: true,
              labelFontColor: "white",
              axisYType: "secondary",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 3, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][2].day1 },
                { x: 2,  y: response["rows"][2].day2 },
                { x: 3,  y: response["rows"][2].day3 },
                { x: 4,  y: response["rows"][2].day4 },
                { x: 5,  y: response["rows"][2].day5 }
              ]
            }, {
              type: "line",
              name: "Team 4",
              showInLegend: true,
              labelFontColor: "white",
              axisYType: "secondary",
              toolTipContent:
                'Team: 4, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][3].day1 },
                { x: 2,  y: response["rows"][3].day2 },
                { x: 3,  y: response["rows"][3].day3 },
                { x: 4,  y: response["rows"][3].day4 },
                { x: 5,  y: response["rows"][3].day5 }
              ]
            }, {
              type: "line",
              axisYType: "secondary",
              name: "Team 5",
              showInLegend: true,
              labelFontColor: "white",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 5, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][4].day1 },
                { x: 2,  y: response["rows"][4].day2 },
                { x: 3,  y: response["rows"][4].day3 },
                { x: 4,  y: response["rows"][4].day4 },
                { x: 5,  y: response["rows"][4].day5 }
              ]
            }
          ]
        });
        chart10.render();
      })
    }
    if (cont5) {
      fetch("/actors").then(data => data.json()).then(data => {
        response = data;
          console.log(data);
          var chart11 = new CanvasJS.Chart(cont5, {
          backgroundColor: null,
          animationEnabled: true,
          title: {            
            fontColor: "white",
            text: "Messages sent/received by different roles",
          },
          axisX: {
            title: "Role ID",
            labelFontColor: "white",
            labelWrap: true,
          },
          axisY: {
            title: "Number of Messages",
            labelFontColor: "white",
            labelWrap: true
          },
          data: [
            {
              type: "stackedBar",
              name: "Sent",
              toolTipContent:
                'Role: {x} <br>Messages Sent: {y}',
              dataPoints: [
                { y: response["rows"][0].sent, x: response["rows"][0].role_type_id},
                { y: response["rows"][1].sent, x: response["rows"][1].role_type_id},
                { y: response["rows"][2].sent, x: response["rows"][2].role_type_id},
                { y: response["rows"][3].sent, x: response["rows"][3].role_type_id},
                { y: response["rows"][4].sent, x: response["rows"][4].role_type_id}
              ]
            },
            {
                type: "stackedBar",
                name: "Received",
                toolTipContent:
                  'Role: {x} <br>Messages Received: {y}',
                dataPoints: [
                  { y: response["rows"][0].received, x: response["rows"][0].role_type_id},
                  { y: response["rows"][1].received, x: response["rows"][1].role_type_id},
                  { y: response["rows"][2].received, x: response["rows"][2].role_type_id},
                  { y: response["rows"][3].received, x: response["rows"][3].role_type_id},
                  { y: response["rows"][4].received, x: response["rows"][4].role_type_id}
                ]
            }
          ]
        });
        chart11.render();
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
            labelFontSize: 15,
            labelAngle: -45,
            interval: 1,
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
                { label: "DB Admin", y: response["rows"][0].sent},
                { label: "Civic Officer", y: response["rows"][1].sent },
                { label: "IT Associate", y: response["rows"][2].sent },
                { label: "ER Specialist", y: response["rows"][3].sent },
                { label: "Boss", y: response["rows"][4].sent }
              ]
            },
            {
                type: "column",
                toolTipContent:
                  'Role: {label} <br>Messages Recieved: {y}',
                dataPoints: [
                  { label: "DB Admin", y: response["rows"][0].received},
                  { label: "Civic Officer", y: response["rows"][1].received },
                  { label: "IT Associate", y: response["rows"][2].received },
                  { label: "ER Specialist", y: response["rows"][3].received },
                  { label: "Boss", y: response["rows"][4].sent }
                ]
            }
          ]
        });
        chart7.render();

      });
    }
    if(cont4) {
      fetch("/teammsg1").then(data => data.json()).then(data => {
        response = data;
        const cont10 = document.querySelector("#chart10");
          console.log(data);
          var chart10 = new CanvasJS.Chart(cont10, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Number of messages actions per team"
          },
          toolTip: {
            shared: true
          },
          legend: {
		          cursor: "pointer",
		          verticalAlign: "top",
		          horizontalAlign: "center",
		          dockInsidePlotArea: true,
	        },
          axisX: {
            title: "In game day",
            interval: 1
          },
          axisY: {
            title: "Number of messages",
            interval: 1
          },
          data: [
            {
              name: "Team 1",
              showInLegend: true,
              type: "line",
              axisYType: "secondary",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 1, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][0].day1 },
                { x: 2,  y: response["rows"][0].day2 },
                { x: 3,  y: response["rows"][0].day3 },
                { x: 4,  y: response["rows"][0].day4 },
                { x: 5,  y: response["rows"][0].day5 }
              ]
            }, {
              type: "line",
              name: "Team 2",
              showInLegend: true,
              axisYType: "secondary",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 2, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][1].day1 },
                { x: 2,  y: response["rows"][1].day2 },
                { x: 3,  y: response["rows"][1].day3 },
                { x: 4,  y: response["rows"][1].day4 },
                { x: 5,  y: response["rows"][1].day5 }
              ]
            }, {
              type: "line",
              name: "Team 3",
              showInLegend: true,
              axisYType: "secondary",
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 3, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][2].day1 },
                { x: 2,  y: response["rows"][2].day2 },
                { x: 3,  y: response["rows"][2].day3 },
                { x: 4,  y: response["rows"][2].day4 },
                { x: 5,  y: response["rows"][2].day5 }
              ]
            }, {
              type: "line",
              name: "Team 4",
              showInLegend: true,
              axisYType: "secondary",
              toolTipContent:
                'Team: 4, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][3].day1 },
                { x: 2,  y: response["rows"][3].day2 },
                { x: 3,  y: response["rows"][3].day3 },
                { x: 4,  y: response["rows"][3].day4 },
                { x: 5,  y: response["rows"][3].day5 }
              ]
            }, {
              type: "line",
              axisYType: "secondary",
              name: "Team 5",
              showInLegend: true,
              //indexLabel: "{y} messages",
              toolTipContent:
                'Team: 5, Day: {x} <br>Messages sent/received: {y}',
              dataPoints: [
                { x: 1,  y: response["rows"][4].day1 },
                { x: 2,  y: response["rows"][4].day2 },
                { x: 3,  y: response["rows"][4].day3 },
                { x: 4,  y: response["rows"][4].day4 },
                { x: 5,  y: response["rows"][4].day5 }
              ]
            }
          ]
        });
        chart10.render();
      })
    }
    }
    if (cont5) {
      fetch("/actors").then(data => data.json()).then(data => {
        response = data;
          console.log(data);
          var chart11 = new CanvasJS.Chart(cont5, {
          backgroundColor: null,
          animationEnabled: true,
          title: {
            text: "Messages sent/received by different roles",
          },
          axisX: {
            title: "Role ID",
            labelWrap: true,
          },
          axisY: {
            title: "Number of Messages",
            labelWrap: true
          },
          data: [
            {
              type: "stackedBar",
              name: "Sent",
              toolTipContent:
                'Role: {x} <br>Messages Sent: {y}',
              dataPoints: [
                { y: response["rows"][0].sent, x: response["rows"][0].role_type_id},
                { y: response["rows"][1].sent, x: response["rows"][1].role_type_id},
                { y: response["rows"][2].sent, x: response["rows"][2].role_type_id},
                { y: response["rows"][3].sent, x: response["rows"][3].role_type_id},
                { y: response["rows"][4].sent, x: response["rows"][4].role_type_id}
              ]
            },
            {
                type: "stackedBar",
                name: "Received",
                toolTipContent:
                  'Role: {x} <br>Messages Received: {y}',
                dataPoints: [
                  { y: response["rows"][0].received, x: response["rows"][0].role_type_id},
                  { y: response["rows"][1].received, x: response["rows"][1].role_type_id},
                  { y: response["rows"][2].received, x: response["rows"][2].role_type_id},
                  { y: response["rows"][3].received, x: response["rows"][3].role_type_id},
                  { y: response["rows"][4].received, x: response["rows"][4].role_type_id}
                ]
            }
          ]
        });
        chart11.render();
    });
  }
});



