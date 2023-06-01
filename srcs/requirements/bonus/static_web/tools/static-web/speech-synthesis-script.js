var synth = window.speechSynthesis;

function speechSpeak() {
	synth.cancel();

	var inputText = document.getElementById('userText').value;
	inputText = inputText.replace(/\?/g, '?  [[slnc 4000]]');

	var utterThis = new SpeechSynthesisUtterance(inputText);

	utterThis.pitch = 1;
	utterThis.rate = 0.8;

	synth.speak(utterThis);
	document.getElementById('userText').blur();
}

function speechPause() {
	if (synth.paused === true) {
		synth.resume();
	}
	else {
		synth.pause();
	}
}

function speechCancel() {
	synth.cancel();
}

function clearTextarea() {
	document.getElementById('userText').value = '';
}
