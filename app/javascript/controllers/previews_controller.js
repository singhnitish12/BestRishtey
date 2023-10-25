import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previews"
export default class extends Controller {
  static targets = ["input", "preview"];
  static values = { initialPreviewSrc: String };
  connect() {
    this.initialPreviewSrcValue = this.previewTarget.src;
  }

  preview() {
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();

    reader.onloadend = function () {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else{
      preview.src = "";
    }

  }

  reset(){
    this.inputTarget.value = "";
    this.previewTarget.src = this.initialPreviewSrcValue;
    //this.previewTarget.src = "";
    // this.resetButtonTarget.addEventListener("click", (event) => {
    //   event.preventDefault()
    // })
  }

}
