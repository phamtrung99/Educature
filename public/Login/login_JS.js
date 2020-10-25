const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

function CheckDKFunc() {
	var checkBox = document.getElementById("CheckBoxDK");
	var text = document.getElementById("submit");
	if (checkBox.checked == true) {
		text.style.display = "";
	} else {
		text.style.display = "none";
	}
}
function CheckDKFunc1() {
	var checkBox = document.getElementById("CheckBoxDK1");
	var text = document.getElementById("submit1");
	if (checkBox.checked == true) {
		text.style.display = "";
	} else {
		text.style.display = "none";
	}
}