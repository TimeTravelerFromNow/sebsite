import e from"fs";var n="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var a={};var r=a.hljs=new function(){function escape(e){return e.replace(/&/gm,"&amp;").replace(/</gm,"&lt;")}function langRe(e,n,a){return RegExp(n,"m"+(e.case_insensitive?"i":"")+(a?"g":""))}function findCode(e){for(var n=0;n<e.childNodes.length;n++){var a=e.childNodes[n];if("CODE"==a.nodeName)return a;if(!(3==a.nodeType&&a.nodeValue.match(/\s+/)))break}}function blockText(e,n){var a="";for(var r=0;r<e.childNodes.length;r++)if(3==e.childNodes[r].nodeType){var t=e.childNodes[r].nodeValue;n&&(t=t.replace(/\n/g,""));a+=t}else"BR"==e.childNodes[r].nodeName?a+="\n":a+=blockText(e.childNodes[r]);/MSIE [678]/.test(navigator.userAgent)&&(a=a.replace(/\r/g,"\n"));return a}function blockLanguage(n){var a=n.className.split(/\s+/);a=a.concat(n.parentNode.className.split(/\s+/));for(var r=0;r<a.length;r++){var t=a[r].replace(/^language-/,"");if(e[t]||"no-highlight"==t)return t}}function nodeStream(e){var n=[];(function(e,a){for(var r=0;r<e.childNodes.length;r++)if(3==e.childNodes[r].nodeType)a+=e.childNodes[r].nodeValue.length;else if("BR"==e.childNodes[r].nodeName)a+=1;else{n.push({event:"start",offset:a,node:e.childNodes[r]});a=arguments.callee(e.childNodes[r],a);n.push({event:"stop",offset:a,node:e.childNodes[r]})}return a})(e,0);return n}function mergeStreams(e,n,a){var r=0;var t="";var i=[];function selectStream(){return e.length&&n.length?e[0].offset!=n[0].offset?e[0].offset<n[0].offset?e:n:"start"==n[0].event?e:n:e.length?e:n}function open(e){var n="<"+e.nodeName.toLowerCase();for(var a=0;a<e.attributes.length;a++){var r=e.attributes[a];n+=" "+r.nodeName.toLowerCase();void 0!=r.nodeValue&&(n+='="'+escape(r.nodeValue)+'"')}return n+">"}while(e.length||n.length){var l=selectStream().splice(0,1)[0];t+=escape(a.substr(r,l.offset-r));r=l.offset;if("start"==l.event){t+=open(l.node);i.push(l.node)}else if("stop"==l.event){var o=i.length;do{o--;var s=i[o];t+="</"+s.nodeName.toLowerCase()+">"}while(s!=l.node);i.splice(o,1);while(o<i.length){t+=open(i[o]);o++}}}t+=a.substr(r);return t}function highlight(n,a){function subMode(e,n){for(var a=0;a<n.contains.length;a++)if(n.contains[a].beginRe.test(e))return n.contains[a]}function endOfMode(e,n){if(t[e].end&&t[e].endRe.test(n))return 1;if(t[e].endsWithParent){var a=endOfMode(e-1,n);return a?a+1:0}return 0}function isIllegal(e,n){return n.illegalRe&&n.illegalRe.test(e)}function compileTerminators(e,n){var a=[];for(var r=0;r<e.contains.length;r++)a.push(e.contains[r].begin);var i=t.length-1;do{t[i].end&&a.push(t[i].end);i--}while(t[i+1].endsWithParent);e.illegal&&a.push(e.illegal);return langRe(n,"("+a.join("|")+")",true)}function eatModeChunk(e,n){var a=t[t.length-1];a.terminators||(a.terminators=compileTerminators(a,r));a.terminators.lastIndex=n;var i=a.terminators.exec(e);return i?[e.substr(n,i.index-n),i[0],false]:[e.substr(n),"",true]}function keywordMatch(e,n){var a=r.case_insensitive?n[0].toLowerCase():n[0];for(var t in e.keywordGroups)if(e.keywordGroups.hasOwnProperty(t)){var i=e.keywordGroups[t].hasOwnProperty(a);if(i)return[t,i]}return false}function processKeywords(e,n){if(!n.keywords)return escape(e);var a="";var r=0;n.lexemsRe.lastIndex=0;var t=n.lexemsRe.exec(e);while(t){a+=escape(e.substr(r,t.index-r));var i=keywordMatch(n,t);if(i){l+=i[1];a+='<span class="'+i[0]+'">'+escape(t[0])+"</span>"}else a+=escape(t[0]);r=n.lexemsRe.lastIndex;t=n.lexemsRe.exec(e)}a+=escape(e.substr(r,e.length-r));return a}function processBuffer(n,a){if(a.subLanguage&&e[a.subLanguage]){var r=highlight(a.subLanguage,n);l+=r.keyword_count;return r.value}return processKeywords(n,a)}function startNewMode(e,n){var a=e.className?'<span class="'+e.className+'">':"";if(e.returnBegin){o+=a;e.buffer=""}else if(e.excludeBegin){o+=escape(n)+a;e.buffer=""}else{o+=a;e.buffer=n}t.push(e);i+=e.relevance}function processModeInfo(e,n,a){var r=t[t.length-1];if(a){o+=processBuffer(r.buffer+e,r);return false}var i=subMode(n,r);if(i){o+=processBuffer(r.buffer+e,r);startNewMode(i,n);return i.returnBegin}var l=endOfMode(t.length-1,n);if(l){var s=r.className?"</span>":"";r.returnEnd?o+=processBuffer(r.buffer+e,r)+s:r.excludeEnd?o+=processBuffer(r.buffer+e,r)+s+escape(n):o+=processBuffer(r.buffer+e+n,r)+s;while(l>1){s=t[t.length-2].className?"</span>":"";o+=s;l--;t.length--}var c=t[t.length-1];t.length--;t[t.length-1].buffer="";c.starts&&startNewMode(c.starts,"");return r.returnEnd}if(isIllegal(n,r))throw"Illegal"}var r=e[n];var t=[r.defaultMode];var i=0;var l=0;var o="";try{var s=0;r.defaultMode.buffer="";do{var c=eatModeChunk(a,s);var g=processModeInfo(c[0],c[1],c[2]);s+=c[0].length;g||(s+=c[1].length)}while(!c[2]);if(t.length>1)throw"Illegal";return{language:n,relevance:i,keyword_count:l,value:o}}catch(e){if("Illegal"==e)return{language:null,relevance:0,keyword_count:0,value:escape(a)};throw e}}function compileModes(){function compileMode(e,n,a){if(!e.compiled){if(!a){e.beginRe=langRe(n,e.begin?e.begin:"\\B|\\b");e.end||e.endsWithParent||(e.end="\\B|\\b");e.end&&(e.endRe=langRe(n,e.end))}e.illegal&&(e.illegalRe=langRe(n,e.illegal));void 0==e.relevance&&(e.relevance=1);e.keywords&&(e.lexemsRe=langRe(n,e.lexems||r.IDENT_RE,true));for(var t in e.keywords)if(e.keywords.hasOwnProperty(t)){e.keywords[t]instanceof Object?e.keywordGroups=e.keywords:e.keywordGroups={keyword:e.keywords};break}e.contains||(e.contains=[]);e.compiled=true;for(var i=0;i<e.contains.length;i++)compileMode(e.contains[i],n,false);e.starts&&compileMode(e.starts,n,false)}}for(var n in e)e.hasOwnProperty(n)&&compileMode(e[n].defaultMode,e[n],true)}function initialize(){if(!initialize.called){initialize.called=true;compileModes()}}function highlightBlock(n,a,r){initialize();var t=blockText(n,r);var i=blockLanguage(n);if("no-highlight"!=i){if(i)var l=highlight(i,t);else{var l={language:"",keyword_count:0,relevance:0,value:escape(t)};var o=l;for(var s in e)if(e.hasOwnProperty(s)){var c=highlight(s,t);c.keyword_count+c.relevance>o.keyword_count+o.relevance&&(o=c);if(c.keyword_count+c.relevance>l.keyword_count+l.relevance){o=l;l=c}}}var g=n.className;g.match(l.language)||(g=g?g+" "+l.language:l.language);var u=nodeStream(n);if(u.length){var d=document.createElement("pre");d.innerHTML=l.value;l.value=mergeStreams(u,nodeStream(d),t)}a&&(l.value=l.value.replace(/^((<[^>]+>|\t)+)/gm,(function(e,n,r,t){return n.replace(/\t/g,a)})));r&&(l.value=l.value.replace(/\n/g,"<br>"));if(/MSIE [678]/.test(navigator.userAgent)&&"CODE"==n.tagName&&"PRE"==n.parentNode.tagName){var d=n.parentNode;var h=document.createElement("div");h.innerHTML="<pre><code>"+l.value+"</code></pre>";n=h.firstChild.firstChild;h.firstChild.className=d.className;d.parentNode.replaceChild(h.firstChild,d)}else n.innerHTML=l.value;n.className=g;n.dataset={};n.dataset.result={language:l.language,kw:l.keyword_count,re:l.relevance};o&&o.language&&(n.dataset.second_best={language:o.language,kw:o.keyword_count,re:o.relevance})}}function highlightText(n,a,r){initialize();var t=n;var i;var l={language:"",keyword_count:0,relevance:0,value:escape(t)};var o=l;for(var s in e)if(e.hasOwnProperty(s)){var c=highlight(s,t);c.keyword_count+c.relevance>o.keyword_count+o.relevance&&(o=c);if(c.keyword_count+c.relevance>l.keyword_count+l.relevance){o=l;l=c}}a&&(l.value=l.value.replace(/^((<[^>]+>|\t)+)/gm,(function(e,n,r,t){return n.replace(/\t/g,a)})));r&&(l.value=l.value.replace(/\n/g,"<br>"));return l.value}function initHighlighting(){if(!initHighlighting.called){initHighlighting.called=true;initialize();var e=document.getElementsByTagName("pre");for(var n=0;n<e.length;n++){var a=findCode(e[n]);a&&highlightBlock(a,r.tabReplace)}}}function initHighlightingOnLoad(){var e=arguments;var handler=function(){initHighlighting.apply(null,e)};if(window.addEventListener){window.addEventListener("DOMContentLoaded",handler,false);window.addEventListener("load",handler,false)}else window.attachEvent?window.attachEvent("onload",handler):window.onload=handler}var e={};(this||n).LANGUAGES=e;(this||n).initHighlightingOnLoad=initHighlightingOnLoad;(this||n).highlightBlock=highlightBlock;(this||n).initHighlighting=initHighlighting;(this||n).highlightText=highlightText;(this||n).IDENT_RE="[a-zA-Z][a-zA-Z0-9_]*";(this||n).UNDERSCORE_IDENT_RE="[a-zA-Z_][a-zA-Z0-9_]*";(this||n).NUMBER_RE="\\b\\d+(\\.\\d+)?";(this||n).C_NUMBER_RE="\\b(0x[A-Za-z0-9]+|\\d+(\\.\\d+)?)";(this||n).RE_STARTERS_RE="!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|\\.|-|-=|/|/=|:|;|<|<<|<<=|<=|=|==|===|>|>=|>>|>>=|>>>|>>>=|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~";(this||n).BACKSLASH_ESCAPE={begin:"\\\\.",relevance:0};(this||n).APOS_STRING_MODE={className:"string",begin:"'",end:"'",illegal:"\\n",contains:[(this||n).BACKSLASH_ESCAPE],relevance:0};(this||n).QUOTE_STRING_MODE={className:"string",begin:'"',end:'"',illegal:"\\n",contains:[(this||n).BACKSLASH_ESCAPE],relevance:0};(this||n).C_LINE_COMMENT_MODE={className:"comment",begin:"//",end:"$"};(this||n).C_BLOCK_COMMENT_MODE={className:"comment",begin:"/\\*",end:"\\*/"};(this||n).HASH_COMMENT_MODE={className:"comment",begin:"#",end:"$"};(this||n).NUMBER_MODE={className:"number",begin:(this||n).NUMBER_RE,relevance:0};(this||n).C_NUMBER_MODE={className:"number",begin:(this||n).C_NUMBER_RE,relevance:0};(this||n).inherit=function(e,n){var a={};for(var r in e)a[r]=e[r];if(n)for(var r in n)a[r]=n[r];return a}};var t={};var i=t;(function(){var n=t,r=e,l=a.hljs,o="vendor/highlight.js/languages/",s=new URL(import.meta.url.slice(0,import.meta.url.lastIndexOf("/"))).pathname+"/"+o,c=/\.js$/i,g={},u={};n.loadedLanguages=[];function acceptJsFiles(e){if(e.match(c))return true}function preRequireModules(e,n,a){a[n]=e=e.replace(c,"");try{u[e]=require("./"+o+e)}catch(n){console.error("[ERROR] could not preload language pack for '"+e+"'");console.error(n.message);console.error(n.stack);return}}function preloadLanguages(e,a){if(e){console.error("[ERROR] langPath '"+s+"'");console.error(e.message);console.error(e.stack)}else{n.languages=a.filter(acceptJsFiles).sort((function(e,n){return"xml"===e?-1e8:"django.js"===e?1e9:e===n?0:e<n?-1:e>n?1:0}));n.languages.forEach(preRequireModules)}}function loadLangs(e,a){var r;"string"===typeof a&&(a=[a]);if(Array.isArray(a)){a.some((function(e){var a;if(!g[e]){a=u[e];if(!a){r=new Error("No language pack available for '"+e+"'");return true}try{a(l)}catch(a){console.warn("[WARN] failed to load",e);console.warn(a.message);console.warn(a.stack);n.languages=n.languages.filter((function(n){return n!==e}));return}g[e]=true;n.loadedLanguages.push(e)}}));e(r)}else e(new Error("no array of languages given"))}function init(e,a,r){Array.isArray(a)||(a=n.languages.slice());loadLangs(e,a)}function highlight(e,n,a){n=n||"    ";e=e.replace(/\r\n|\r|\n/g,"\n");return a?e.replace(/\n/g,"￿").replace(/<code([^>]*)>(.*?)<\/code>/gm,(function(e,a,r){return"<code"+a+">"+l.highlightText(r.replace(/\uffff/g,"\n"),n)+"</code>"})).replace(/&amp;(\w+;)/g,"&$1").replace(/\uffff/g,"\n"):l.highlightText(e,n)}preloadLanguages(null,r.readdirSync(s));n.init=init;n.highlight=highlight;function backwardsCompat(){n.init((function(){}),["php"]);return n.highlight.apply(null,arguments)}n.Highlight=i.Highlight=backwardsCompat})();export default t;

