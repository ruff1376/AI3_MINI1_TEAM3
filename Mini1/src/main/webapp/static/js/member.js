function filterMembers() {
	const keyword = document.getElementById("memberSearch").value.toLowerCase();
	const rows = document.querySelectorAll(".member-row");
	let found = false;

	rows.forEach(row => {
		const name = row.querySelector(".member-name").textContent.toLowerCase();
		if (name.includes(keyword)) {
			row.style.display = "";
			found = true;
		} else {
			row.style.display = "none";
		}
	});

	const emptyRow = document.querySelector("#emptyRow");
	if (emptyRow) emptyRow.remove();

	if (!found) {
		const tbody = document.querySelector("tbody");
		const tr = document.createElement("tr");
		tr.id = "emptyRow";
		tr.innerHTML = `<td colspan="4" class="text-center py-3">조회된 데이터가 없습니다.</td>`;
		tbody.appendChild(tr);
	}
}

function goToDetail(memberNo) {
	fetch(`/Mini1/admin/memberlist?id=${memberNo}`)
		.then(res => res.json())
		.then(data => {
			document.getElementById("modalMemberNo").textContent = data.memberNo;
			document.getElementById("modalName").textContent = data.name;
			document.getElementById("modalPhone").textContent = data.phone;
			document.getElementById("modalJoinDate").textContent = data.joinDate;
			document.getElementById("modalPtCount").textContent = `${data.usedCount} / ${data.totalCount}`;

			const modal = new bootstrap.Modal(document.getElementById('memberModal'));
			modal.show();
		});
}