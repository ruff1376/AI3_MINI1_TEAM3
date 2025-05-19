const calendar = document.getElementById("calendar");
const selectedDateTitle = document.getElementById("selected-date-title");
const scheduleBody = document.getElementById("schedule-body");
const previewBox = document.getElementById("preview-box");
const previewContent = document.getElementById("preview-content");
const selectedData = [];

let current = new Date();

function renderCalendar(date = new Date()) {
  calendar.innerHTML = "";

  const year = date.getFullYear();
  const month = date.getMonth();
  const firstDay = new Date(year, month, 1).getDay();
  const lastDate = new Date(year, month + 1, 0).getDate();
  const today = new Date();

  const header = document.createElement("div");
  header.className = "calendar-header";

  const prev = document.createElement("span");
  prev.textContent = "<";
  prev.style.cursor = "pointer";
  prev.onclick = () => renderCalendar(new Date(year, month - 1, 1));

  const next = document.createElement("span");
  next.textContent = ">";
  next.style.cursor = "pointer";
  next.onclick = () => renderCalendar(new Date(year, month + 1, 1));

  const title = document.createElement("div");
  title.textContent = `${year}년 ${month + 1}월`;
  title.className = "calendar-title";

  header.appendChild(prev);
  header.appendChild(title);
  header.appendChild(next);
  calendar.appendChild(header);

  const grid = document.createElement("div");
  grid.className = "calendar-grid";
  const days = ["일", "월", "화", "수", "목", "금", "토"];
  days.forEach(day => {
    const dayCell = document.createElement("div");
    dayCell.className = "calendar-day";
    dayCell.textContent = day;
    grid.appendChild(dayCell);
  });

  for (let i = 0; i < firstDay; i++) grid.appendChild(document.createElement("div"));

  for (let d = 1; d <= lastDate; d++) {
    const cell = document.createElement("div");
    cell.className = "calendar-date";
    cell.textContent = d;
    const dateStr = `${year}-${String(month + 1).padStart(2, "0")}-${String(d).padStart(2, "0")}`;

    if (d === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
      cell.classList.add("today");
    }

    cell.addEventListener("click", () => {
      document.querySelectorAll(".calendar-date").forEach(el => el.classList.remove("selected"));
      cell.classList.add("selected");
      selectDate(dateStr);
    });

    grid.appendChild(cell);
  }

  calendar.appendChild(grid);
}

function selectDate(dateStr) {
  selectedDateTitle.textContent = `${dateStr} 예약 스케줄`;
  renderSchedule();
  previewBox.style.display = "none";
}

function renderSchedule() {
  scheduleBody.innerHTML = "";
  const baseHours = ["12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"];
  const trainers = ["김계란", "손흥민", "이강인", "기성용", "박지성"];

  baseHours.forEach(hour => {
    const [h, m] = hour.split(":");
    const baseTime = new Date(0, 0, 0, +h, +m);

    for (let i = 0; i < 2; i++) {
      const time = new Date(baseTime.getTime() + i * 30 * 60000);
      const nextTime = new Date(time.getTime() + 30 * 60000);

      const timeStr = time.toTimeString().substring(0, 5);
      const nextStr = nextTime.toTimeString().substring(0, 5);

      const tr = document.createElement("tr");

      if (i === 0) {
        const timeCell = document.createElement("td");
        timeCell.textContent = hour;
        timeCell.rowSpan = 2;
        timeCell.classList.add("time-cell");
        tr.appendChild(timeCell);
      }

      trainers.forEach(trainer => {
        const td = document.createElement("td");
        const wrapper = document.createElement("div");
        wrapper.className = "cell-wrapper";

        const checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.className = "cell-checkbox";
        checkbox.style.display = "none";

        const input = document.createElement("input");
        input.type = "text";
        input.className = "cell-input";
        input.placeholder = "";
        input.disabled = true;

        wrapper.addEventListener("click", () => {
          checkbox.checked = !checkbox.checked;
          if (checkbox.checked) {
            td.classList.add("selected-time");
            input.disabled = false;
            input.focus();
          } else {
            td.classList.remove("selected-time");
            input.disabled = true;
            input.value = "";
          }
        });

        input.addEventListener("click", e => {
          e.stopPropagation();
          wrapper.click(); // ✅ input 클릭 시 wrapper 클릭 발생
        });

        checkbox.addEventListener("click", e => e.stopPropagation());

        wrapper.appendChild(checkbox);
        wrapper.appendChild(input);
        td.appendChild(wrapper);

        td.dataset.time = `${timeStr}~${nextStr}`;
        td.dataset.trainer = trainer;

        tr.appendChild(td);
      });

      scheduleBody.appendChild(tr);
    }
  });
}

function saveData() {
  selectedData.length = 0;
  document.querySelectorAll(".selected-time").forEach(cell => {
    const time = cell.dataset.time;
    const trainer = cell.dataset.trainer;
    const value = cell.querySelector("input[type='text']").value;
    selectedData.push({ trainer, time, memo: value });
  });
  previewContent.textContent = JSON.stringify(selectedData, null, 2);
  previewBox.style.display = "block";
}

function enableEditing() {
  document.querySelectorAll(".selected-time .cell-input").forEach(input => {
    input.disabled = false;
    input.focus();
  });
}

renderCalendar();
