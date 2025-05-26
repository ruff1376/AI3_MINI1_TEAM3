const calendar = document.getElementById("calendar");
const selectedDateTitle = document.getElementById("selected-date-title");
const scheduleBody = document.getElementById("schedule-body");
const baseHours = ["12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"];

// trainers는 JSP에서 서버에서 받아서 script로 주입해야 함
// 예: <script> const trainers = ["김계란", "손흥민"]; </script>

function pad(n) {
  return n < 10 ? '0' + n : n;
}


function renderCalendar(date = new Date()) {
  calendar.innerHTML = "";
  const year = date.getFullYear();
  const month = date.getMonth();
  const firstDay = new Date(year, month, 1).getDay();
  const lastDate = new Date(year, month + 1, 0).getDate();
  const today = new Date();

  const header = document.createElement("div");
  header.className = "calendar-header d-flex justify-content-between align-items-center px-5 py-2";

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
  title.className = "calendar-title fw-bold fs-4";

  header.appendChild(prev);
  header.appendChild(title);
  header.appendChild(next);
  calendar.appendChild(header);

  const grid = document.createElement("div");
  grid.className = "calendar-grid d-grid";
  grid.style.gridTemplateColumns = "repeat(7, 1fr)";

  const days = ["일", "월", "화", "수", "목", "금", "토"];
  days.forEach(day => {
    const dayCell = document.createElement("div");
    dayCell.className = "calendar-day text-center fw-bold py-2";
    dayCell.textContent = day;
    grid.appendChild(dayCell);
  });

  for (let i = 0; i < firstDay; i++) grid.appendChild(document.createElement("div"));

  for (let d = 1; d <= lastDate; d++) {
    const cell = document.createElement("div");
    cell.className = "calendar-date text-center py-2";
    cell.textContent = d;
    const dateStr = `${year}-${pad(month + 1)}-${pad(d)}`;

    if (d === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
      cell.classList.add("today", "border", "border-success");
    }

    if (typeof initialSelectedDate !== "undefined" && initialSelectedDate === dateStr) {
      cell.classList.add("selected", "bg-success", "text-white", "fw-bold");
    }

    cell.addEventListener("click", () => {
		window.location.href = `schedule?date=${dateStr}`; // ✅ 서블릿으로 이동

    });

    grid.appendChild(cell);
  }

  calendar.appendChild(grid);
}

function renderSchedule() {
  scheduleBody.innerHTML = "";
  baseHours.forEach(hour => {
    const [h, m] = hour.split(":"), baseTime = new Date(0, 0, 0, +h, +m);
    for (let i = 0; i < 2; i++) {
      const time = new Date(baseTime.getTime() + i * 30 * 60000);
      const nextTime = new Date(time.getTime() + 30 * 60000);
      const timeStr = time.toTimeString().substring(0, 5);
      const nextStr = nextTime.toTimeString().substring(0, 5);
      const fullTimeRange = `${timeStr}~${nextStr}`;

      const tr = document.createElement("tr");

      if (i === 0) {
        const timeCell = document.createElement("td");
        timeCell.textContent = hour;
        timeCell.rowSpan = 2;
        timeCell.className = "time-cell";
        tr.appendChild(timeCell);
      }

      trainers.forEach(trainer => {
        const td = document.createElement("td");
        const wrapper = document.createElement("div");
        wrapper.className = "cell-wrapper";

        const checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.className = "cell-checkbox d-none";

        const input = document.createElement("input");
        input.type = "text";
        input.className = "cell-input";
        input.placeholder = "";
        input.disabled = true;

        td.dataset.time = fullTimeRange;
        td.dataset.trainer = trainer;

        if (typeof savedEntries !== "undefined" && Array.isArray(savedEntries)) {
          const matched = savedEntries.find(e => e.trainer === trainer && e.time === fullTimeRange);
          if (matched) {
            if (matched.checked === true || matched.checked === "true") {
              td.classList.add("selected-time");
              checkbox.checked = true;
              input.disabled = false;
            }
            input.value = matched.memo || "";
          }
        }

        // ✅ 셀(td) 클릭 시 체크/해제 되도록 td에 직접 이벤트 설정
        td.addEventListener("click", (e) => {
          // input 클릭은 제외 (focus만 유지)
          if (e.target === input) return;

          checkbox.checked = !checkbox.checked;
          td.classList.toggle("selected-time", checkbox.checked);
          input.disabled = !checkbox.checked;
          if (checkbox.checked) input.focus();
          else input.value = "";
        });

        wrapper.appendChild(checkbox);
        wrapper.appendChild(input);
        td.appendChild(wrapper);
        tr.appendChild(td);
      });

      scheduleBody.appendChild(tr);
    }
  });
}

document.querySelector("form").addEventListener("submit", (e) => {
  const form = e.target;
  document.querySelectorAll(".dynamic-entry").forEach(el => el.remove());
  const cells = document.querySelectorAll("td[data-trainer]");
  let entryIndex = 0, deleteIndex = 0;

  cells.forEach(cell => {
    const trainer = cell.dataset.trainer;
    const time = cell.dataset.time;
    const input = cell.querySelector("input[type='text']");
    const checkbox = cell.querySelector("input[type='checkbox']");
    const memo = input?.value.trim() || "";

    if (checkbox.checked) {
      const createHiddenInput = (name, value) => {
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = `entries[${entryIndex}].${name}`;
        input.value = value;
        input.classList.add("dynamic-entry");
        form.appendChild(input);
      };
      createHiddenInput("trainer", trainer);
      createHiddenInput("time", time);
      createHiddenInput("memo", memo);
      createHiddenInput("checked", true);
      entryIndex++;
    } else {
      ["trainer", "time"].forEach(key => {
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = `deleteEntries[${deleteIndex}].${key}`;
        input.value = cell.dataset[key];
        input.classList.add("dynamic-entry");
        form.appendChild(input);
      });
      deleteIndex++;
    }
  });

  const title = document.getElementById("selected-date-title").textContent;
  const date = title.split(" ")[0];
  document.getElementById("selected-date-value").value = date;
});

renderCalendar();
if (typeof initialSelectedDate !== "undefined" && initialSelectedDate) {
  selectedDateTitle.textContent = `${initialSelectedDate} 예약 스케줄`;
  renderSchedule();
}
