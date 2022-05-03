//Shows list of models based on province query 

//GLOBAL VARIABLES -------------------------------------------------------------------
let provinceObj = {};

//FUNCTIONS + HELPERS ----------------------------------------------------------------

function queryByProvince(){
    let selectedProvince = document.getElementById("provinces").value;

    //create the provinceObj JSON
    provinceObj["province"] = selectedProvince;
    console.log(provinceObj);

    //check if any fields are empty 
    if (selectedProvince == null){
        alert("Please select a province.");
    } else {
        let request = new XMLHttpRequest();
        
        //listen for state change
	    request.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200){
                console.log("On state registered and accepted...");

                //Redirect to /models/${province} in server 
                let province = JSON.parse(this.responseText)["Province"];
                console.log(province);
                window.location.href = `http://localhost:3000/models/${province}`
		    }
	    }
        request.open("POST", "/validate");
	    request.setRequestHeader("Content-Type", "application/json");
	    request.send(JSON.stringify(provinceObj));
    }
}