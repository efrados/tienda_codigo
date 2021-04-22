import Rails from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["errors", "spinner"]
  onPostSuccess(event) {
    const [data, status, xhr] = event.detail;
    this.errorsTarget.innerHTML = xhr.response;
  }
  click(event) {
    this.spinnerTarget.innerHTML = "Sending<span class='spinner-border' style='width: 10rem; height: 10rem;'></span>";
  }

  showError(event) {
    const [data, status, xhr] = event.detail;

    this.errorsTarget.innerHTML = xhr.response;

  }
}