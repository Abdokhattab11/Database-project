
async function fetch_table_data(table_name) {
  const table_data = await (await fetch('/result', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({fetch: table_name})
  })).json()
  return table_data
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
  console.log(await fetch_table_data("Authors"));
  removeExistTable();
  allTables[0].classList.add("active__table");
});
projectsTableBtn.addEventListener("click", async () => {
  console.log(await fetch_table_data("Books"));
  removeExistTable();
  allTables[1].classList.add("active__table");
});
teamsTableBtn.addEventListener("click", async () => {
  console.log(await fetch_table_data("Writes"));
  removeExistTable();
  allTables[2].classList.add("active__table");
});
tasksTableBtn.addEventListener("click", () => {
  removeExistTable();
  allTables[3].classList.add("active__table");
});
customTableBtn.addEventListener("click", () => {
  removeExistTable();
  allTables[4].classList.add("active__table");
});