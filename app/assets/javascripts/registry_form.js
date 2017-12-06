const checkBox = document.querySelectorAll('#new_registry span');
const checkedBox = document.getElementsByClassName('registry_guest')[0];

checkBox.forEach((span) => {
  span.addEventListener("click", (event) => {
    if (document.getElementById('registry_presence_coming').checked === true) {
      checkedBox.style.display = "block";
    } else {
      checkedBox.style.display = "none";
    };
  });
});

