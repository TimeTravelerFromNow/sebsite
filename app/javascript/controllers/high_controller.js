import { Controller } from "@hotwired/stimulus"
import {HighlightJS } from "highlight"


export default class extends Controller {

  static targets = ["lang", "codeBlock"]

  static lang = ""

  connect() {
    this.findLang();
    if( this.lang != "" ) {
      HighlightJS.highlightElement(this.codeBlockTarget, this.lang)
    }
    else {
      this.codeBlockTarget.textContent = HighlightJS.highlightAuto(this.codeBlockTarget.textContent)
    }
  }

  findLang() {
    const languageRegex = /(?!lang\-\\w\*)lang-\w*\W*/gm

    let language = this.langTarget.textContent.match(languageRegex)

    if (language) {
        language = language[0].toString().trim()
        this.langTarget.textContent = this.langTarget.textContent.replace(language, '')
        this.codeBlockTarget.classList.add(language, 'line-numbers')
        this.lang = language.split("-")[1]
    } else {
      console.log("high_controller couldnt find language ", this.langTarget)
    }
  }

  escapeHtml(unsafe)
  {
      return unsafe
           .replace(/&/g, "&amp;")
           .replace(/</g, "&lt;")
           .replace(/>/g, "&gt;")
           .replace(/"/g, "&quot;")
           .replace(/'/g, "&#039;");
   }

}
