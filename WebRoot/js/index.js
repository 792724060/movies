//function pageClick(k) {
//	$(k).parent().find("div").removeClass("active");
//	$(k).addClass("active");
//	$("#flTitle").text($(k).text());
//	document.getElementById("con").innerHTML = '<object type="text/html" data="sum" width="100%" height="100%"></object>';
//}
function pageClick1(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	$("#flTitle").text($(k).text());
	document.getElementById("con").innerHTML = '<object type="text/html" data="view" width="100%" height="100%"></object>';
}
function pageClick2(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	$("#flTitle").text($(k).text());
	document.getElementById("con").innerHTML = '<object type="text/html" data="allschedule" width="100%" height="100%"></object>';
}
function pageClick3(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	$("#flTitle").text($(k).text());
	document.getElementById("con").innerHTML = '<object type="text/html" data="text3.jsp" width="100%" height="100%"></object>';
}