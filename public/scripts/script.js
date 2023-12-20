async function fetch_table_data(table_name) {
  const table_data = await (
    await fetch("/result", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ fetch: table_name }),
    })
  ).json();
  return table_data;
}

const defaultTableDisplay = document.querySelector(
  ".default__table__container"
);
const allTables = document.querySelectorAll(".table__container");

const emplyeesTableBtn = document.getElementById("emplyees-a");
const projectsTableBtn = document.getElementById("projects-a");
const teamsTableBtn = document.getElementById("teams-a");
const tasksTableBtn = document.getElementById("tasks-a");
const customTableBtn = document.getElementById("custom-a");
const removeExistTable = () => {
  if (defaultTableDisplay.classList.contains("active__table"))
    defaultTableDisplay.classList.remove("active__table");
  for (const t of allTables) {
    if (t.classList.contains("active__table"))
      t.classList.remove("active__table");
  }
};

emplyeesTableBtn.addEventListener("click", async () => {
  const obj = await fetch_table_data("Employee");
  const list = obj["list"];
  const emplyeeTable = allTables[0].querySelector("table tbody");
  let html = ``;
  for (let i = 0; i < list.length; i++) {
    let newHtml = ``;
    for (const j in list[i]) {
      newHtml += `<td>${list[i][j]}</td>`;
    }

    html += `<tr>${newHtml} <td><button class="del-btn"><i class="fa-solid fa-trash trash-icon"></i></button></td></tr>`;
  }
  emplyeeTable.innerHTML = html;
  removeExistTable();
  allTables[0].classList.add("active__table");
});
projectsTableBtn.addEventListener("click", async () => {
  const obj = await fetch_table_data("Project");
  const list = obj["list"];
  const emplyeeTable = allTables[1].querySelector("table tbody");
  let html = ``;
  for (let i = 0; i < list.length; i++) {
    let newHtml = ``;
    for (const j in list[i]) {
      newHtml += `<td>${list[i][j]}</td>`;
    }

    html += `<tr>${newHtml} <td><button class="del-btn"><i class="fa-solid fa-trash trash-icon"></i></button></td></tr>`;
  }
  emplyeeTable.innerHTML = html;
  removeExistTable();
  allTables[1].classList.add("active__table");
});
teamsTableBtn.addEventListener("click", async () => {
  const obj = await fetch_table_data("Team");
  const list = obj["list"];
  const emplyeeTable = allTables[2].querySelector("table tbody");
  let html = ``;
  for (let i = 0; i < list.length; i++) {
    let newHtml = ``;
    for (const j in list[i]) {
      newHtml += `<td>${list[i][j]}</td>`;
    }

    html += `<tr>${newHtml} <td><button class="del-btn"><i class="fa-solid fa-trash trash-icon"></i></button></td></tr>`;
  }
  emplyeeTable.innerHTML = html;
  removeExistTable();
  allTables[2].classList.add("active__table");
});
tasksTableBtn.addEventListener("click", async () => {
  const obj = await fetch_table_data("Task");
  const list = obj["list"];
  const emplyeeTable = allTables[3].querySelector("table tbody");
  let html = ``;
  for (let i = 0; i < list.length; i++) {
    let newHtml = ``;
    for (const j in list[i]) {
      newHtml += `<td>${list[i][j]}</td>`;
    }

    html += `<tr>${newHtml} <td><button class="del-btn"><i class="fa-solid fa-trash trash-icon"></i></button></td></tr>`;
  }
  emplyeeTable.innerHTML = html;
  removeExistTable();
  allTables[3].classList.add("active__table");
});
customTableBtn.addEventListener("click", async () => {
  removeExistTable();
  allTables[4].classList.add("active__table");
});
