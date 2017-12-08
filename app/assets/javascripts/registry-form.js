document.addEventListener('DOMContentLoaded', () => {

  let div = document.getElementById('champs');
  let addFieldButton = document.getElementById('add_field_button');
  let champs = document.getElementsByClassName('guest_field');

  function addInput(name){
    let input = document.createElement("input");
    input.className = "guest_field form-control string optional";
    input.name = name;
    div.appendChild(input);
  }

  function addField() {
    addInput("registry[guest_names][]");
    div.appendChild(document.createElement("br"));
  }



  function inputsEmpty() {
    for (let champ of champs) {
      if(champ.value == "") {
        return true;
      }
    }
    return false;
  }

  addFieldButton.addEventListener('click', function() {
    if (inputsEmpty()) {
      console.log("y en a un de vide!!");
      return;
    }
    addField();
  });
});
