class DOMNodeCollection {
    constructor(html_array) {
        this.ha = html_array;
    }
}

DOMNodeCollection.prototype.html = function(string) {
    if(string) {
        for(let i = 0; i < this.ha.length; i++) {
            this.ha[i].innerHTML = string;
        }
    }else {
        return this.ha[0].innerHTML;
    }
}

DOMNodeCollection.prototype.empty = function() {
    for(let i = 0; i < this.ha.length; i++) {
        this.ha[i].innerText = "";
    }
}

DOMNodeCollection.prototype.append = function(element) {
    if(element instanceof jQuery) {
        for(let i = 0; i < element.length; i++) {
            for(let j = 0; j < this.length; j++) {
                this[j].innerHTML.append(element[i].outerHTML);
            }
        }
    }else if(element instanceof HTMLElement || element instanceof String) {
        let ele = $(element);
        for(let i = 0; i < ele.length; i++) {
            for(let j = 0; j < this.length; j++) {
                this[j].innerHTML.append(ele[i].outerHTML);
            }
        }
    }
}

module.exports = DOMNodeCollection;