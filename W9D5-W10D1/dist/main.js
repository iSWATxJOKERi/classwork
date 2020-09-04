/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\r\n    constructor(html_array) {\r\n        this.ha = html_array;\r\n    }\r\n}\r\n\r\nDOMNodeCollection.prototype.html = function(string) {\r\n    if(string) {\r\n        for(let i = 0; i < this.ha.length; i++) {\r\n            this.ha[i].innerHTML = string;\r\n        }\r\n    }else {\r\n        return this.ha[0].innerHTML;\r\n    }\r\n}\r\n\r\nDOMNodeCollection.prototype.empty = function() {\r\n    for(let i = 0; i < this.ha.length; i++) {\r\n        this.ha[i].innerText = \"\";\r\n    }\r\n}\r\n\r\nDOMNodeCollection.prototype.append = function(element) {\r\n    if(element instanceof jQuery) {\r\n        for(let i = 0; i < element.length; i++) {\r\n            for(let j = 0; j < this.length; j++) {\r\n                this[j].innerHTML.append(element[i].outerHTML);\r\n            }\r\n        }\r\n    }else if(element instanceof HTMLElement || element instanceof String) {\r\n        let ele = $(element);\r\n        for(let i = 0; i < ele.length; i++) {\r\n            for(let j = 0; j < this.length; j++) {\r\n                this[j].innerHTML.append(ele[i].outerHTML);\r\n            }\r\n        }\r\n    }\r\n}\r\n\r\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\r\n\r\n$l = function(arg) {\r\n    // debugger\r\n    if(arg instanceof HTMLElement){\r\n        return new DOMNodeCollection([arg]);\r\n    }else {\r\n        let nodeList = document.querySelectorAll(arg);\r\n        let arr = [];\r\n        for(let i = 0; i < nodeList.length; i++) {\r\n            arr.push(nodeList[i]);\r\n        }\r\n        return new DOMNodeCollection(arr);\r\n    }\r\n}\r\n\r\nwindow.$l = $l;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });