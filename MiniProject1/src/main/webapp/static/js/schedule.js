// ✅ 전역 변수 설정
const calendar = document.getElementById("calendar");
const selectedDateTitle = document.getElementById("selected-date-title");
const scheduleBody = document.getElementById("schedule-body");
const baseHours = ["12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"];

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

    if (selectedDate === dateStr) {
      cell.classList.add("selected", "bg-success", "text-white", "fw-bold");
    }

    cell.addEventListener("click", () => {
      window.location.href = `schedule?date=${dateStr}`;
    });

    grid.appendChild(cell);
  }

  calendar.appendChild(grid);
}

function renderSchedule() {
  scheduleBody.innerHTML = "";
  baseHours.forEach(hour => {
    const [h, m] = hour.split(":");
    const baseTime = new Date(0, 0, 0, +h, +m);

    for (let i = 0; i < 2; i++) {
      const time = new Date(baseTime.getTime() + i * 30 * 60000);
      const timeStr = time.toTimeString().substring(0, 5);
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
        td.dataset.time = timeStr;
        td.dataset.trainerId = trainer.id;

        const label = document.createElement("div");
        label.className = "selected-name";
        label.textContent = "";

		const matched = savedEntries.find(e =>
		  String(e.trainerId) === String(trainer.id) &&
		  e.bookTime.substring(0, 5) === timeStr
		);
        if (matched) {
          td.classList.add("selected-time");
          const member = memberList.find(m => m.no === matched.memberNo);
          if (member) {
            label.textContent = member.name;
            td.appendChild(label);

            const hiddenInputs = [
              { key: "trainerId", value: trainer.id },
              { key: "memberNo", value: member.no },
              { key: "bookDate", value: selectedDate },
              { key: "bookTime", value: timeStr },
              { key: "note", value: matched.note || "" }
            ];
            hiddenInputs.forEach(({ key, value }) => {
              const input = document.createElement("input");
              input.type = "hidden";
              input.classList.add("entry-hidden");
              input.dataset.key = key;
              input.value = value;
              td.appendChild(input);
            });
          }
        }

        td.appendChild(label);

        td.addEventListener("click", () => {
          if (td.querySelector("select")) return;

          const originalContent = td.innerHTML;
          td.innerHTML = "";

          const select = document.createElement("select");
          select.className = "form-select member-select";

          const defaultOption = document.createElement("option");
          defaultOption.value = "";
          defaultOption.textContent = "선택하세요";
          defaultOption.disabled = true;
          defaultOption.selected = true;
          select.appendChild(defaultOption);

          memberList.forEach(m => {
            const option = document.createElement("option");
            option.value = m.no;
            option.textContent = `${m.name} (${m.phone})`;
            select.appendChild(option);
          });

          select.addEventListener("mousedown", e => e.stopPropagation());
          select.addEventListener("click", e => e.stopPropagation());

          td.appendChild(select);

          setTimeout(() => {
            new Choices(select, { searchEnabled: true });
          }, 0);

          select.addEventListener("change", () => {
            const selected = memberList.find(m => m.no == select.value);
            if (selected) {
              td.innerHTML = "";
              td.classList.add("selected-time");

              const nameLabel = document.createElement("div");
              nameLabel.textContent = selected.name;
              nameLabel.className = "selected-name";
              td.appendChild(nameLabel);

              const inputs = [
                { key: "trainerId", value: trainer.id },
                { key: "memberNo", value: selected.no },
                { key: "bookDate", value: selectedDate },
                { key: "bookTime", value: timeStr },
                { key: "note", value: "" }
              ];
              inputs.forEach(({ key, value }) => {
                const input = document.createElement("input");
                input.type = "hidden";
                input.classList.add("entry-hidden");
                input.dataset.key = key;
                input.value = value;
                td.appendChild(input);
              });

              document.removeEventListener("click", outsideClickHandler);
            }
          });

          function outsideClickHandler(e) {
            if (!td.contains(e.target)) {
              td.innerHTML = originalContent;
              document.removeEventListener("click", outsideClickHandler);
            }
          }

          setTimeout(() => {
            document.addEventListener("click", outsideClickHandler);
          }, 0);
        });

        tr.appendChild(td);
      });

      scheduleBody.appendChild(tr);
    }
  });
}

// ✅ 폼 전송 시 hidden input 정리
const form = document.querySelector("form");
form.addEventListener("submit", function () {
  const allHidden = document.querySelectorAll(".entry-hidden");
  const entryMap = [];

  allHidden.forEach(input => {
    const td = input.closest("td");
    let map = entryMap.find(m => m.td === td);
    if (!map) {
      map = { td, data: {} };
      entryMap.push(map);
    }
    map.data[input.dataset.key] = input.value;
  });

  allHidden.forEach(input => input.remove());

  entryMap.forEach((entry, index) => {
    for (const key in entry.data) {
      const hidden = document.createElement("input");
      hidden.type = "hidden";
      hidden.name = `entries[${index}].${key}`;
      hidden.value = entry.data[key];
      form.appendChild(hidden);
    }
  });
});

// ✅ 초기 렌더링
const selectedDate = initialSelectedDate || new Date().toISOString().split("T")[0];
document.getElementById("selected-date-value").value = selectedDate;
selectedDateTitle.textContent = `${selectedDate} 예약 스케줄`;
renderCalendar(new Date(selectedDate));
renderSchedule();
