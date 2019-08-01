function pageClick(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	$("#flTitle").text($(k).text());
	document.getElementById("con").innerHTML = '<object type="text/html" data="text1.jsp" width="100%" height="100%"></object>';
}
function pageClick1(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	$("#flTitle").text($(k).text());
	document.getElementById("con").innerHTML = '<object type="text/html" data="sum" width="100%" height="100%"></object>';
}
