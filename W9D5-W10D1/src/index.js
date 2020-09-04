const DOMNodeCollection = require("./dom_node_collection");

$l = function(arg) {
    // debugger
    if(arg instanceof HTMLElement){
        return new DOMNodeCollection([arg]);
    }else {
        let nodeList = document.querySelectorAll(arg);
        let arr = [];
        for(let i = 0; i < nodeList.length; i++) {
            arr.push(nodeList[i]);
        }
        return new DOMNodeCollection(arr);
    }
}

window.$l = $l;