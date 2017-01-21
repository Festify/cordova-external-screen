exports["airPlayScreen"] = {
setupScreenConnectionNotificationHandlers: function (success, fail) {
    return PhoneGap.exec(success, fail, "AirPlayScreen", "setupScreenConnectionNotificationHandlers", []);
},
    
loadHTMLResource: function (url, success, fail) {
    return PhoneGap.exec(success, fail, "AirPlayScreen", "loadHTMLResource", [url]);
},
    
loadHTML: function (url, success, fail) {
    return PhoneGap.exec(success, fail, "AirPlayScreen", "loadHTML", [url]);
},
    
invokeJavaScript: function (scriptString, success, fail) {
    return PhoneGap.exec(success, fail, "AirPlayScreen", "invokeJavaScript", [scriptString]);
},
    
checkExternalScreenAvailable: function (success, fail) {
    return PhoneGap.exec(success, fail, "AirPlayScreen", "checkExternalScreenAvailable", []);
}
};
