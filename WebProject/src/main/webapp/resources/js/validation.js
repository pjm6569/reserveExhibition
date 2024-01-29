function CheckAddProduct() {
	var Id = document.getElementById('Id');
	var name = document.getElementById('name');
    var ticketPrice = document.getElementById("ticketPrice");
    var time = document.getElementById("time");

	if(Id.value.trim().length == 0){
		alert("Id를 입력하세요");
		Id.select();
		Id.focus();
		return false;
	}
	
	if(name.value.trim().length == 0){
		alert("Id를 입력하세요");
		name.select();
		name.focus();
		return false;
	}


    if (ticketPrice.value.length == 0 || isNaN(ticketPrice.value)) {
        alert("[가격]\n숫자만 입력하세요");
        ticketPrice.select();
        ticketPrice.focus();
        return false;
    }

    if (ticketPrice.value < 0) {
        alert("[가격]\n음수는 입력할 수 없습니다");
        ticketPrice.select();
        ticketPrice.focus();
        return false;  
    } 
    
    if (time.value.length == 0 || isNaN(time.value)) {
        alert("[관람시간(분)]\n숫자만 입력하세요");
        time.select();
        time.focus();
        return false;
    }

    if (time.value < 0) {
        alert("[관람시간(분)]\n음수는 입력할 수 없습니다");
        time.select();
        time.focus();
        return false;  
    } 
    
    // Confirm before submitting the form
    if (confirm("등록하시겠습니까?")) {
        // Assuming you have a form with the name "newProduct"
        document.newExhibition.submit();
    }
}
