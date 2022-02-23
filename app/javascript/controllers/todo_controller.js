import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    console.log('Hello from stimulus!');
  }

  static get targets() {
    return['body', 'counter', 'submit'];
  }

  countCharacters(event) {
    let characters = this.bodyTarget.value.length;
    this.counterTarget.innerText = characters;
    if (characters > 20) {
      this.counterTarget.classList.remove('text-success');
      this.counterTarget.classList.add('text-danger');
      this.submitTarget.disabled = true;
    } else {
      this.counterTarget.classList.add('text-success');
      this.counterTarget.classList.remove('text-danger');
      this.submitTarget.disabled = false;
    }

  }
}
